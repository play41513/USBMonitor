//---------------------------------------------------------------------------
#include <windows.h>    // 安全移除USB裝置用 *要比 vcl.h 早編譯
#include <cfgmgr32.h>	// 安全移除USB裝置用 *要比 vcl.h 早編譯
#include <SetupAPI.h>	// 安全移除USB裝置用 *要比 vcl.h 早編譯

#include <vcl.h>
#pragma hdrstop

#include <stdio.h>		//檔案輸出入用
#include <usbioctl.h>
#include <dbt.h>		//裝置拔差事件用
#include <initguid.h>	//GUID 類別
#include "usbdi.h"		// 安全移除USB裝置用
#include "Unit1.h"
#include "USBDevConnectionInfo.h"
#include "GL_PDView.h"



DWORD NEW_DEVICEDISK;			//最新變化的磁碟狀態
DWORD OLD_DEVICEDISK; 			//上次紀錄的磁碟狀態

BYTE WRITE_BUFFER[BUFFER_SIZE];	//寫入用的緩衝區
BYTE READ_BUFFER[BUFFER_SIZE];	//讀取用的緩衝區

FILE *fp;                       //檔案指標
bool bSetting = false;
int dwINITimeOut;
int Hpl_Dev_Data;
bool bPLUGOUT;
USBDevConnectionInfo *USBCONInfo = new USBDevConnectionInfo();
GL_PDView *GL_PD = new GL_PDView();

//---------------------------------------------------------------------------
using namespace std;
#pragma package(smart_init)
#pragma resource "*.dfm"
TMForm *MForm;
//---------------------------------------------------------------------------
__fastcall TMForm::TMForm(TComponent* Owner)
	: TForm(Owner)
{
	Read_INI_File();
	//
	AnsiString num;
	for(int x=0;x<16;x++)
	{
		num.printf("%02d",x+1);
		usb_rw_info[x].DISKName= FindComponent("DEVICE"+AnsiString(num))->Name;
		usb_rw_info[x].zDeviceTable = (TPanel *)FindComponent("DEVICE"+AnsiString(num));
	}
	//
	TListInitUSB_Dev = new TStringList;
	TListHUB_Dev = new TStringList;
	TListUSB_Dev = new TStringList;
	TListFlash_Disk = new TStringList;
	UnRemoveDev = new TStringList;
	//
	bSaveLocalDevInfo = false;
	btnFindDevice->Click();

	CheckDISKClick(NULL);
	bSaveLocalDevInfo = true;
	//

	VPIDTimeOut=0;
	bPLUGOUT = false;
	//
	TouchKeyboard->Left = 5;
	//
	gStrTestLogPath = "C:\\ASMP\\log\\USBMonitor\\"+FormatDateTime("yyyy-mm-dd", Now())+".txt";
	_mkdir( "C:\\ASMP\\");
	_mkdir( "C:\\ASMP\\log\\" );
	_mkdir( "C:\\ASMP\\log\\USBMonitor\\" );
	LocalWriteSettingLOG(true);
	//
}
//---------------------------------------------------------------------------
void __fastcall TMForm::FormCreate(TObject *Sender)
{

	GUID guid;
	// 註冊USB HUB裝置 , 系統才能欄到
	guid =StringToGUID(GUID_USB_HUB);
	g_DeviceNogification.RegisterWindowsDeviceInterfaceNotification(
	Handle,guid);// GUID_CLASS_USB_DEVICE_USB);

	//USB Device  , 系統才能欄到
	guid =StringToGUID(GUID_USB_DEVICE);
	g_DeviceNogification.RegisterWindowsDeviceInterfaceNotification(
	Handle,guid);// GUID_CLASS_USB_DEVICE_USB);

	// 註冊USBSTOR 裝置 , 能欄到SD
	guid =StringToGUID(GUID_USBSTOR);
	g_DeviceNogification.RegisterWindowsDeviceInterfaceNotification(
	Handle,guid);// GUID_CLASS_USB_DEVICE_USB);

	 //消息
	OldFormWndProc = this->WindowProc;
	this->WindowProc = FormWndProc;

	OLD_DEVICEDISK=GetLogicalDrives();

}
//---------------------------------------------------------------------------
//=====攔截訊息=========================
void __fastcall TMForm::FormWndProc(TMessage& Message)
{
	OldFormWndProc(Message);

	if (Message.Msg == WM_DEVICECHANGE) {

	 if (Message.WParam == DBT_DEVICEARRIVAL)//新插入了一項裝置!
	 {
		 CheckDISKClick(NULL);
	 }

	 if (Message.WParam == DBT_DEVICEREMOVECOMPLETE) //卸除了一項裝置!
	 {
		if(!bSetting)
		{
			VPIDTimeOut = 0;
			for(int i =1;i<=15;i++)
			{
				TPanel * plShow = ((TPanel *)FindComponent("pan_show" + IntToStr(i)));
				if(plShow->Color == clRed)
				{
					  plShow->Caption ="WAIT";
					  plShow->Color =clCream;
				}
			}
		}
		CheckDISKClick(NULL);
	 }
	}
}
//---------------------------------------------------------------------------
void __fastcall TMForm::CheckDISKClick(TObject *Sender)
{
AnsiString SS;
int MPDevice;
NEW_DEVICEDISK=GetLogicalDrives();
if (NEW_DEVICEDISK!=OLD_DEVICEDISK)	//磁碟機有變動
	{
	for (char i = 0; i < 32; i++)
		{
		if ((NEW_DEVICEDISK&(0x01<<i))!=(OLD_DEVICEDISK&(0x01<<i)))	//檢查變化碟
			{
			SS=(char)(0x41+i);
			if (NEW_DEVICEDISK&(0x01<<i))	//新增磁碟
			{
				MPDevice=CheckDISKVolumelabel(0x41+i);
				if (MPDevice!=-1)				//帶測磁碟機
				{
					if (DiskWriteRead(0x41+i)) 	//0x41 = 'A'
					{
						usb_rw_info[MPDevice].zDeviceTable->Color=clRed;
					}
					else
					{
						//Disk Add And Test Pass
						switch(FindDiskUSBType3(0x41+i))
						{
							case USBTYPE_SUPER_SPEED_PLUS:
								usb_rw_info[MPDevice].zDeviceTable->Color=clGreen;
								break;
							case USBTYPE_SUPER_SPEED:
								usb_rw_info[MPDevice].zDeviceTable->Color=clGreen;
								break;
							case USBTYPE_NOT_FIND_DEV:
								usb_rw_info[MPDevice].zDeviceTable->Color=clYellow;
								break;
							default:
								usb_rw_info[MPDevice].zDeviceTable->Color=clHotLight;
								break;
						}
					}
				}
			}
			else//Leno 移除磁碟
			{
				bPLUGOUT = true;
				for(int x=0;x<16;x++)
				{
					if (!strcmp(SS.c_str(),&usb_rw_info[x].DISKVolumelabel))
					{
						usb_rw_info[x].DISKVolumelabel=' ';
						break;
					}
				}
				SS="("+SS+")";

				for(int x=0;x<LBoxDisk->Items->Count;x++)
				{
					if(strstr(((AnsiString)LBoxDisk->Items->Strings[x]).c_str(),SS.c_str()))
					{
						for(int y=0;y<16;y++)
						{
							if (wcsstr(LBoxDisk->Items->Strings[x].c_str(),usb_rw_info[y].zDeviceTable->Caption.c_str()))
							{
								usb_rw_info[y].zDeviceTable->Color=clCream;
								MForm->Refresh();
								break;
							}
						}
						LBoxDisk->Items->Delete(x);
					}
				}
				bPLUGOUT = false;
			}
			}
		}
	OLD_DEVICEDISK=NEW_DEVICEDISK;
	}
}
//---------------------------------------------------------------------------
int  TMForm::CheckDISKVolumelabel(char Disk)
{
	AnsiString SS;
	char Volumelabel[20];
	DWORD SerialNumber;
	DWORD MaxCLength;
	DWORD FileSysFlag;
	char FileSysName[10];
	AnsiString DiskName;
	DiskName=Disk;                      //Filename = 新磁碟的時間檔案
	DiskName+=":\\";
	GetVolumeInformation( DiskName.c_str(),Volumelabel,255,&SerialNumber,&MaxCLength,&FileSysFlag,FileSysName,255);
	if(!bSaveLocalDevInfo){
		TListFlash_Disk->Add(Volumelabel);
	}else if(!lan_find_inf(((AnsiString)TListFlash_Disk->Text).c_str(), Volumelabel)&&MaxCLength==255){
		for(int x=0;x<LBoxDisk->Items->Count;x++)
		{
			AnsiString sDisk = "("+AnsiString(Disk)+")";
			if(strstr(((AnsiString)LBoxDisk->Items->Strings[x]).c_str(),sDisk.c_str()))
			{
				LBoxDisk->Items->Delete(x);
			}
		}
		LBoxDisk->Items->Add((AnsiString)Volumelabel+" ("+Disk+")");
	}
	SS=((AnsiString)Volumelabel).UpperCase();
	for(int x=0;x<16;x++)
	{
		if (!strcmp(SS.c_str(),usb_rw_info[x].DISKName.c_str()))
		{
			if(!LBoxDisk->Items->Text.Pos(SS)) return -1;
			usb_rw_info[x].DISKVolumelabel=Disk;
			return x;
		}
	}
	return -1;
}
//---------------------------------------------------------------------------
char  TMForm::DiskWriteRead(char Disk)
{
	try
	{
	memset(WRITE_BUFFER,(BYTE)0xA5,BUFFER_SIZE);
	AnsiString FileName=Disk;
						  //Filename = 新磁碟的時間檔案
	FileName+=":\\"+FormatDateTime("yymmddhhmmss",Now())+".bin";
	fp=fopen(FileName.c_str(),"a+");
	if(fp == NULL)
       return 0x01;	//EEEOR
	fseek(fp,0,SEEK_END);
	fwrite(WRITE_BUFFER,BUFFER_SIZE,1,fp);
	fclose(fp);

	fp=fopen(FileName.c_str(),"rb");
	if(fp == NULL)
	   return 0x01;	//EEEOR
	fseek(fp,0,SEEK_SET);
	fread(READ_BUFFER,BUFFER_SIZE,1,fp);
	fclose(fp);
	DeleteFile(FileName.c_str());
	if (memcmp(READ_BUFFER,WRITE_BUFFER,BUFFER_SIZE))
	{
		return 0x01;	//EEEOR
	}
	else
	{
		return 0x00;	//PASS
	}
	}
	catch(...)
	{
		return 0x01;	//EEEOR
	}
}
//---------------------------------------------------------------------------
bool  TMForm::DeviceRemove(AnsiString PVID)
{
HDEVINFO hDevInfo;
SP_DEVINFO_DATA DeviceInfoData;
DWORD i,j;
AnsiString SS,USBPath;
PSP_DEVICE_INTERFACE_DETAIL_DATA   pDetail   =NULL;
//--------------------------------------------------------------------------
//   獲取設備資訊
	GUID guid =StringToGUID("{A5DCBF10-6530-11D2-901F-00C04FB951ED}");
hDevInfo = SetupDiGetClassDevs((LPGUID)&guid,
				0,   //   Enumerator
				0,
				DIGCF_PRESENT | DIGCF_DEVICEINTERFACE );
if   (hDevInfo   ==   INVALID_HANDLE_VALUE)
	{
	 //if (DEBUG)  MForm->moHUB->Lines->Add("ERROR - SetupDiGetClassDevs()"); //   查詢資訊失敗
	}
else
	{
//--------------------------------------------------------------------------
SP_DEVICE_INTERFACE_DATA   ifdata;
DeviceInfoData.cbSize   =   sizeof(SP_DEVINFO_DATA);
for (i=0;SetupDiEnumDeviceInfo(hDevInfo, i, &DeviceInfoData);i++)	//   枚舉每個USB設備
	{
	ULONG   len;
	CONFIGRET cr;
	PNP_VETO_TYPE   pnpvietotype;
	CHAR   vetoname[MAX_PATH];
	ULONG   ulStatus;
	ULONG   ulProblemNumber;
	ifdata.cbSize   =   sizeof(ifdata);
	if (SetupDiEnumDeviceInterfaces(								//   枚舉符合該GUID的設備介面
		hDevInfo,           //   設備資訊集控制碼
		NULL,                         //   不需額外的設備描述
		(LPGUID)&guid,//GUID_CLASS_USB_DEVICE,                     //   GUID
		(ULONG)i,       //   設備資訊集�堛熙]備序號
		&ifdata))                 //   設備介面資訊
		{
		ULONG predictedLength   =   0;
		ULONG requiredLength   =   0;
		//   取得該設備介面的細節(設備路徑)
		SetupDiGetInterfaceDeviceDetail(hDevInfo,         //   設備資訊集控制碼
										&ifdata,          //   設備介面資訊
										NULL,             //   設備介面細節(設備路徑)
										0,         	      //   輸出緩衝區大小
										&requiredLength,  //   不需計算輸出緩衝區大小(直接用設定值)
										NULL);            //   不需額外的設備描述
		//   取得該設備介面的細節(設備路徑)
		predictedLength=requiredLength;
		pDetail = (PSP_INTERFACE_DEVICE_DETAIL_DATA)::GlobalAlloc(LMEM_ZEROINIT,   predictedLength);
		pDetail->cbSize   =   sizeof(SP_DEVICE_INTERFACE_DETAIL_DATA);

		if(SetupDiGetInterfaceDeviceDetail(hDevInfo,         //   設備資訊集控制碼
										&ifdata,             //   設備介面資訊
										pDetail,             //   設備介面細節(設備路徑)
										predictedLength,     //   輸出緩衝區大小
										&requiredLength,     //   不需計算輸出緩衝區大小(直接用設定值)
										NULL))               //   不需額外的設備描述
			{
			char   ch[512];
			for(j=0;j<predictedLength;j++)
				{
				ch[j]=*(pDetail->DevicePath+8+j);
				}
			SS=ch;
			USBPath=SS;

			}

		}
	if (strncmp(USBPath.c_str(),PVID.c_str(),PVID.Length())) continue;    //是否為移除目標

	//if(!CheckDevIsUSB(PVID)) continue;  //是否為磁碟裝置
	//if (DEBUG)  MForm->Memo1->Lines->Add(" *** Get Remove Device *** ");

	cr   =   CM_Get_DevNode_Status( &ulStatus,
									&ulProblemNumber,
									DeviceInfoData.DevInst,
									0);

	if (CR_SUCCESS == cr)
		{
		 SS.printf("OK(0)   -   CM_Get_DevNode_Status()[%d]\n",   cr);
		 //if (DEBUG)  MForm->Memo1->Lines->Add(SS);
		 SS.printf("OK(1)   -   CM_Get_DevNode_Status()   sts   [%x]\n",   ulStatus);
		 //if (DEBUG)  MForm->Memo1->Lines->Add(SS);
		 SS.printf("OK(2)   -   CM_Get_DevNode_Status()   pro   [%x]\n",   ulProblemNumber);
		 //if (DEBUG)  MForm->Memo1->Lines->Add(SS);
		}
	else
		{
		 SS.printf("ERROR   -   CM_Get_DevNode_Status()[%d]\n",   cr);
		 //if (DEBUG)  MForm->Memo1->Lines->Add(SS);
		 SS.printf("ERROR   -   CM_Get_DevNode_Status()[%d]\n",   GetLastError());
		 //if (DEBUG)  MForm->Memo1->Lines->Add(SS);
		}
	//   DN_DISABLEABLE   or   DN_REMOVABLE
	if ((DN_DISABLEABLE & ulStatus ) != 0 )
		{
		 SS.printf("HAS   -   DN_DISABLEABLE()[%x]\n",   DN_DISABLEABLE   &   ulStatus);
		 //if (DEBUG)  MForm->Memo1->Lines->Add(SS);
		}   else   {
		continue;
		}
	if   ((DN_REMOVABLE & ulStatus   )   !=   0   )   {
		 SS.printf("HAS   -   DN_REMOVABLE()[%x]\n",   DN_REMOVABLE   &   ulStatus);
		 //if (DEBUG)  MForm->Memo1->Lines->Add(SS);
		}   else   {
		continue;
		}
	len   =   MAX_PATH;
	 //if (DEBUG)  MForm->Memo1->Lines->Add(USBPath);
	 //if (DEBUG)  MForm->Memo1->Lines->Add("----------------------------------------");
	cr=CM_Request_Device_Eject( DeviceInfoData.DevInst,
									  &pnpvietotype,
									  vetoname,
									  len,
									  0
									  );
	if ( CR_SUCCESS == cr )
		{
		 SS.printf("OK   -   CM_Request_Device_Eject()[%d]\n",   cr);
		 bool bSamePVID=false;
		 for(int x=0;x<UnRemoveDev->Count;x++)
			 if(!strcmp(AnsiString(UnRemoveDev->Strings[x]).c_str(),PVID.c_str())) bSamePVID=true;
		 if(!bSamePVID&&CheckDevIsUSB(PVID))
			UnRemoveDev->Add(PVID);
		 //if (DEBUG)  MForm->Memo1->Lines->Add(SS);
		}
	else
		{
		 SS.printf("ERROR   -   CM_Request_Device_Eject()[%d]\n",   cr);
		 //if (DEBUG)  MForm->Memo1->Lines->Add(SS);
		 SS.printf("ERROR   -   CM_Request_Device_Eject()[%d]\n",   GetLastError());
		 //if (DEBUG)  MForm->Memo1->Lines->Add(SS);
		}
	 //if (DEBUG)  MForm->Memo1->Lines->Add("---------移  除  完  成---------");
//	return true;	//複數移除
	}
if ( GetLastError()!=NO_ERROR && GetLastError()!=ERROR_NO_MORE_ITEMS )
	{
	 SS.printf("ERROR   -   CM_Request_Device_Eject()[%d]\n",   GetLastError());
	}
	//Cleanup
	SetupDiDestroyDeviceInfoList(hDevInfo);
	}
return true;
}
//---------------------------------------------------------------------------
void __fastcall TMForm::btnRemoveUSBDiskClick(TObject *Sender)
{
	/*for(int x=0;x<moUSB->Lines->Count;x++)
		DeviceRemove((AnsiString)moUSB->Lines->Strings[x].SubString(6,17).LowerCase());
	btnFindDevice->Click();
	edtTimeoutRemove->Text=(AnsiString)TimeOut;
	MForm->Refresh();*/
}
//----------------------------------------------------------------------------
char* TMForm::lan_find_inf(char *pData, char *pname) { // 查找字串回傳後面的字串
	char *p, *p1;
	p = pData;
	p1 = strstr(p, pname);
	if (p1 == NULL)
		return NULL;
	p = p1 + strlen(pname);
	return p;
}
void __fastcall TMForm::FormClose(TObject *Sender, TCloseAction &Action)
{
	try
	{
		TimerMain->Enabled = false;
		Sleep(500);

		delete TListInitUSB_Dev;
		delete TListFlash_Disk;
		delete UnRemoveDev;
		SaveINIFile();
	}
	catch(...)
	{
		//
	}
}
//---------------------------------------------------------------------------

void __fastcall TMForm::btnSetClick(TObject *Sender)
{
	if(btnSet->Caption.Pos("SET"))
	{
		if(edtPassWord->Text.UpperCase() == PASSWORD)
		{
			bSetting = true;
			VPIDTimeOut = 0;
			for(int i=1;i<=15;i++)
			{
				((TPanel *)FindComponent("pan" + IntToStr(i)))->Enabled =true;
				((TPanel *)FindComponent("pan_show" + IntToStr(i)))->Caption ="Setting...";
				((TPanel *)FindComponent("pan_show" + IntToStr(i)))->Color =clCream;
				((TPanel *)FindComponent("btnDeleteItem" + IntToStr(i)))->Visible =true;
			}
			btnDeleteItem99->Visible = true;
			plGLPDView->Enabled = true;
			btnDeleteItem11->Visible = true;
			plGLPDResult->Color = clCream;
			plGLPDResult->Caption = "Setting...";
			edtPassWord->Enabled = false;
			btnSet->Caption = "END";
			plLoadDUTInfo->Visible = true;
			imgLogo->Visible = false;
			edtType1->SetFocus();
			TouchKeyboard->Visible = false;
		}
		else edtPassWord->Font->Color = clRed;
	}
	else
	{
		bSetting = false;
		for(int i=1;i<=15;i++)
		{
			((TPanel *)FindComponent("pan" + IntToStr(i)))->Enabled =false;
			((TPanel *)FindComponent("pan_show" + IntToStr(i)))->Caption ="WAIT";
			((TPanel *)FindComponent("pan_show" + IntToStr(i)))->Color =clCream;
			((TPanel *)FindComponent("btnDeleteItem" + IntToStr(i)))->Visible = false;
		}
		btnDeleteItem99->Visible = false;
		plGLPDView->Enabled = false;
		btnDeleteItem11->Visible = false;
		plGLPDResult->Color = clCream;
		plGLPDResult->Caption = "WAIT";

		edtPassWord->Enabled = true;
		btnSet->Caption = "SET";
		edtPassWord->Text = "";
		plLoadDUTInfo->Visible = false;
		TouchKeyboard->Visible = false;
		imgLogo->Visible = true;
		imgLogo->Left = btnSet->Left+80;
		saveinfo();
		CheckDevVPID(0);

	}
}
//---------------------------------------------------------------------------
void  TMForm::saveinfo(){

	for(int i=0;i<15;i++)
	{
		TEdit * edtType = (TEdit *)FindComponent("edtType" + IntToStr(i+1));
		TEdit * edt_vid = (TEdit *)FindComponent("edit_vid" + IntToStr(i+1));
		TEdit * edt_pid = (TEdit *)FindComponent("edit_pid" + IntToStr(i+1));
		TEdit * edt_rev = (TEdit *)FindComponent("edit_rev" + IntToStr(i+1));
		deviceinfo[i] = "["+edtType->Text+"] VID_"+edt_vid->Text+"&PID_"+edt_pid->Text+"&REV_"+edt_rev->Text;
		if(i<DeviceI)
			RegDriver(deviceinfo[i]);
	}
	SaveINIFile();
	LocalWriteSettingLOG(false);
}
//----------------------------------------------------------------------------
void  TMForm::SaveINIFile(){
	char filename[] = "SET.ini";
		fstream fp;
		fp.open(filename, ios::out); // 開啟檔案
		for(int i=0;i<15;i++)
		{
			if(deviceinfo[i] !="")
			{
				TEdit * edtNum = (TEdit *)FindComponent("edtNum" + IntToStr(i+1));
				AnsiString DevInfoNum =  "<DeviceInfo"+AnsiString(i+1)+">";
				fp << DevInfoNum.c_str() << AnsiString(edtNum->Text).c_str() <<endl;
				fp << deviceinfo[i].c_str() << endl;
			}
		}
		fp << "<GL-PDVersion>" << endl;
		if(edtGLPDVersion->Text == "" || plGLPDView->Height == 0 )
			fp << "NULL" << endl;
		else
			fp << AnsiString(edtGLPDVersion->Text).c_str() << endl;

		fp << "<TimeOut>" << endl;
		fp << AnsiString(dwINITimeOut).c_str() << endl;
		fp << "<ItemNumber>" << endl;
		fp << AnsiString(DeviceI).c_str() << endl;
		fp << "<DUT Data>" << endl;
		if(pl_DevData->Visible)
			fp << "true" << endl;
		else  fp << "false"  << endl;
		fp.close(); // 關閉檔案
}
//----------------------------------------------------------------------------
void  TMForm::Read_INI_File(){
	//
	if(FileExists("SET.ini"))
	{
		for(int i=1;i<=15;i++)
		{
			if(i<10)
			{
				((TEdit *)FindComponent("edtNum" + IntToStr(i)))->Text = Findfilemsg("SET.ini", "<DeviceInfo1>", 2*i-2).SubString(14,1);
				deviceinfo[i-1] = Findfilemsg("SET.ini", "<DeviceInfo"+AnsiString(i)+">", 1);
			}
			else
			{
				((TEdit *)FindComponent("edtNum" + IntToStr(i)))->Text = Findfilemsg("SET.ini", "<DeviceInfo1>", 2*i-2).SubString(15,1);
				deviceinfo[i-1] = Findfilemsg("SET.ini", "<DeviceInfo"+AnsiString(i)+">", 1);
            }
		}
		//
		dwINITimeOut = Findfilemsg("SET.ini", "<TimeOut>", 1).ToInt();
		DeviceI =  Findfilemsg("SET.ini", "<ItemNumber>", 1).ToInt();
		edtGLPDVersion->Text = Findfilemsg("SET.ini", "<GL-PDVersion>", 1);
		plGLPDView->Height   = edtGLPDVersion->Text == "NULL" ? 0 : 35;

		if(DeviceI == 0)
			plLoadDUTData ->Height +=35;
		else
			plLoadDUTData ->Height = Panel9->Height+DeviceI*35+plGLPDView->Height;
		MForm->Height = 390+plLoadDUTData->Height;

		for(int i=1;i<=15;i++)
		{
			TEdit * edtType = (TEdit *)FindComponent("edtType" + IntToStr(i));
			TEdit * edt_vid = (TEdit *)FindComponent("edit_vid" + IntToStr(i));
			TEdit * edt_pid = (TEdit *)FindComponent("edit_pid" + IntToStr(i));
			TEdit * edt_rev = (TEdit *)FindComponent("edit_rev" + IntToStr(i));
			edtType->Text = deviceinfo[i-1].SubString(2,4);
			edt_vid->Text = deviceinfo[i-1].SubString(deviceinfo[i-1].Pos("VID")+4,4);
			edt_pid->Text = deviceinfo[i-1].SubString(deviceinfo[i-1].Pos("PID")+4,4);
			edt_rev->Text = deviceinfo[i-1].SubString(deviceinfo[i-1].Pos("REV")+4,4);
		}
	}
	else
	{
		MessageBox(0,"找不到SET檔","警告",MB_OK);
		dwINITimeOut = 5000;
		DeviceI =  1;
		plLoadDUTData ->Height = Panel9->Height + 35 + plGLPDView->Height;
	}


}
//----------------------------------------------------------------------------
AnsiString TMForm::Findfilemsg(AnsiString filename, AnsiString findmsg,
	int rownum) { // 找檔案找到字串行回傳幾行後的字串
	ifstream lanfile(filename.c_str());
	std::string filemsg;
	if (lanfile.is_open()) {
		while (!lanfile.eof()) {
			getline(lanfile, filemsg);
			if (strstr(filemsg.c_str(), findmsg.c_str())) {
				for (int i = 0; i < rownum; i++)
					getline(lanfile, filemsg);
				lanfile.close();
				return(AnsiString)filemsg.c_str();
			}
		}
		lanfile.close();
		return NULL;
	}
	else
		return "檔案開啟失敗!";
}


void __fastcall TMForm::btn_addClick(TObject *Sender)
{
	if(DeviceI < 15){
		DeviceI++;
		plLoadDUTData->Height += 35;
		MForm->Height += 35;
	}

	LBoxHUB->Height = (plUSBInfo->Height-60)/2;
}
//---------------------------------------------------------------------------
void __fastcall TMForm::FormResize(TObject *Sender)
{
	LBoxHUB->Height = (plUSBInfo->Height-60)/2;
	plHUB->Top = 1;
	LBoxHUB->Top = plHUB->Top + plHUB->Height;
	plUSB->Top = LBoxHUB->Top + LBoxHUB->Height;
	LBoxUSB->Top = plUSB->Top + plUSB->Height;
}
//---------------------------------------------------------------------------

void __fastcall TMForm::btnFindDeviceClick(TObject *Sender)//Leno 2007/1/9
{
	TListHUB_Dev->Clear();
	TListUSB_Dev->Clear();
	TListHUB_Dev->Sorted = true;
	TListHUB_Dev->Duplicates = dupIgnore;
	TListUSB_Dev->Sorted = true;
	TListUSB_Dev->Duplicates = dupIgnore;
	EnumUSB();
	EnumHUB();
	//
	bool bSame = true;
	if(LBoxHUB->Items->Text != TListHUB_Dev->Text)
	{
		bSame = false;
		LBoxHUB->Items->Text = TListHUB_Dev->Text;
	}
	if(LBoxUSB->Items->Text != TListUSB_Dev->Text)
	{
		bSame = false;
		LBoxUSB->Items->Text = TListUSB_Dev->Text;
	}

	if(!bSetting&&!bSame)
		CheckDevVPID(0);
}
void TMForm::CheckDevVPID(int flag)
{
	if(flag == 1) VPIDTimeOut = 0;
	bool bAllPass = true;
	bool bFailed = false;
	for(int i = 1; i <= DeviceI;i++)
	{
		bool bHave = false;
		TPanel * pan_show = ((TPanel *)FindComponent("pan_show" + IntToStr(i)));
		int num = ((TEdit *)FindComponent("edtNum" + IntToStr(i)))->Text.ToInt() ;
		AnsiString deviceVPID = Findfilemsg("SET.ini", "<DeviceInfo1>", 2*i-1);
		for(int j = 0;j<LBoxHUB->Items->Count;j++)
		{
			if(strstr(LBoxHUB->Items->Strings[j].t_str(),deviceVPID.c_str()))
			{
				bHave = true;
				num--;
			}
		}
		for(int j = 0;j<LBoxUSB->Items->Count;j++)
		{
			if(strstr(LBoxUSB->Items->Strings[j].t_str(),deviceVPID.c_str()))
			{
				bHave = true;
				num--;
			}
		}
		if(flag!=1 &&num!=0)
		{
			pan_show->Caption = "WAIT";
			pan_show->Color = clCream;
			bAllPass = false;
		}
		if(flag!=1 &&!bHave && pan_show->Color!=clRed)
		{
			pan_show->Caption = "WAIT";
			pan_show->Color = clCream;
			bAllPass = false;
		}
		//
		if(num <= 0 )
		{   //allpass 預防有顏色顯示錯誤的
			if(pan_show->Caption == "WAIT"||pan_show->Caption == "FAIL")
			{
				for(int i =1;i<=15;i++)
				{
					TPanel * plShow = ((TPanel *)FindComponent("pan_show" + IntToStr(i)));
					if(plShow->Color == clRed)
					{
						  plShow->Caption ="WAIT";
						  plShow->Color =clCream;
					}
				}
				VPIDTimeOut =  GetTickCount()+dwINITimeOut;
			}
			pan_show->Caption = "PASS";
			pan_show->Color = clGreen;
		}
		if(flag==1 && pan_show->Color!=clGreen)
		{
			VPIDTimeOut = 0;
			pan_show->Caption = "FAIL";
			pan_show->Color = clRed;
			bAllPass        = false;
			bFailed			= true;
		}
		MForm->Refresh();
	}
	if(bAllPass && plGLPDView->Height)
	{
		if(plGLPDResult->Color == clGreen)
		{
			//有時候PASS過後 又讀到空值，不再讀值
		}
		else
		{  //
			AnsiString astrTemp;
			for(int i = 0;i<3;i++)
			{
				astrTemp = GL_PD->GetGLPDVersion(5000).Trim();
				if(astrTemp != "")
					break;
			}
			if(astrTemp == edtGLPDVersion->Text)
			{
				plGLPDResult->Caption = "PASS";
				plGLPDResult->Color = clGreen;
			}
			else
			{
				plGLPDResult->Caption = "FAIL("+astrTemp+")";
				plGLPDResult->Color = clRed;
			}
		}
	}
	else
	{
		plGLPDResult->Caption = "WAIT";
		plGLPDResult->Color = clCream;
	}
	if(bFailed)
		LocalWriteTestingLOG();
}
//---------------------------------------------------------------------------
void __fastcall TMForm::TimerMainTimer(TObject *Sender)
{
	TimerMain->Enabled = false;

	if(VPIDTimeOut!=0&&GetTickCount() > VPIDTimeOut &&!bSetting)
		CheckDevVPID(1);
	//else if(VPIDTimeOut==0)
	btnFindDevice->Click();

	if(VPIDTimeOut==0)
	{
		for(int i =1;i<=15;i++)
		{
			TPanel * plShow = ((TPanel *)FindComponent("pan_show" + IntToStr(i)));
			if(plShow->Color == clGreen)
			{
				VPIDTimeOut =  GetTickCount()+dwINITimeOut;
				break;
			}
		}
	}
	CheckDiskName();
	TimerMain->Enabled = true;
}
//---------------------------------------------------------------------------
bool TMForm::CheckDevIsUSB(AnsiString PVID)
{
	TRegistry *reg = new TRegistry();
	bool IsUSB=false;
	reg->RootKey = HKEY_LOCAL_MACHINE;
	AnsiString temppath = "SYSTEM\\CurrentControlSet\\Services\\USBSTOR\\Enum";
	reg->OpenKey(temppath.c_str(), false);
	for(int x=0;x<32;x++)
	{
		if(reg->ValueExists((AnsiString)x))
			if(strstr(AnsiString(reg->ReadString((AnsiString)x)).LowerCase().c_str(),PVID.c_str()))
				IsUSB=true;
		else break;
	}

	reg->CloseKey();
	delete reg;
	return IsUSB;
}
//---------------------------------------------------------------------------


void __fastcall TMForm::ckbAutoRemoveTimeClick(TObject *Sender)
{
	if(ckbAutoRemoveTime->Checked)
	{
		Panel7->Visible=true;
	}
	else Panel7->Visible=false;
}
//---------------------------------------------------------------------------
bool TMForm::CheckVPIDSET(TEdit * edt){
	TCHAR HexChar[8];
	if(edt->Text.Length() == 0){}
	else if(edt->Text.Length() <= 4 ){
		edt->Text = edt->Text.UpperCase();// 把字串轉成全大寫
		AnsiString pvid = edt->Text;
		_tcscpy_s(HexChar, 8, pvid.c_str());
		for(int j=0;j<pvid.Length();j++)
		{
			if(HexChar[j] < 0x30 || HexChar[j] > 0x3B){
				if(HexChar[j] < 0x41 || HexChar[j] > 0x5A){
					edt->Font->Color = clRed;
					return false;
				}
			}
		}
	}
	else
	{
		int bb = edt->Text.Length();
		edt->Font->Color = clRed;
		return false;
	}
	if(edt->Text.Length() == 4) edt->Font->Color = clBlue;
	else edt->Font->Color = clWindowText;

	edt-> SelStart=edt-> Text.Length();
	return true;
}
void __fastcall TMForm::edit_vid1Change(TObject *Sender)
{
	TEdit* n=(TEdit*)Sender;
	CheckVPIDSET(n);
}
//---------------------------------------------------------------------------
bool TMForm::CheckTestNum(TEdit * edt)
{
	TCHAR HexChar[8];
	if(edt->Text.Length() == 0){
	}
	else if(edt->Text.Length() <= 1 ){
		edt->Text = edt->Text.UpperCase();// 把字串轉成全大寫
		AnsiString pvid = edt->Text;
		_tcscpy_s(HexChar, 8, pvid.c_str());
		for(int j=0;j<pvid.Length();j++)
		{
			if(HexChar[j] < 0x31 || HexChar[j] > 0x3B){
					edt->Font->Color = clRed;
					edt-> SelStart=edt-> Text.Length();
					return false;
			}
		}
	}
	else
	{
		int bb = edt->Text.Length();
		edt->Font->Color = clRed;
		return false;
	}
	if(edt->Text.Length() == 1) edt->Font->Color = clBlue;
	else edt->Font->Color = clWindowText;

	edt-> SelStart=edt-> Text.Length();
	return true;
}
//---------------------------------------------------------------------------

void __fastcall TMForm::edtNum1Change(TObject *Sender)
{
	TEdit* n=(TEdit*)Sender;
	CheckTestNum(n);
}
//---------------------------------------------------------------------------

void __fastcall TMForm::edtNum1Exit(TObject *Sender)
{
	TEdit* edt=(TEdit*)Sender;
	if(edt->Text.Length() == 0 || edt->Font->Color == clRed){
		edt->Text = "1";
		edt->Font->Color = clBlue;
	}
}
//---------------------------------------------------------------------------


void __fastcall TMForm::pl_Memo_SwitchClick(TObject *Sender)
{
	if(pl_DevData->Visible)
	{
		pl_Memo_Switch->Caption = "v" ;
		Hpl_Dev_Data = pl_DevData->Height;
		MForm->Height -= Hpl_Dev_Data;
		MForm->AutoSize =true;
		pl_DevData->Visible = false;
	}
	else
	{
		pl_Memo_Switch->Caption = "^";
		MForm->AutoSize =false;
		MForm->Height += Hpl_Dev_Data;
		pl_DevData->Visible = true;
	}
}
//---------------------------------------------------------------------------

void __fastcall TMForm::btnLoadDUTClick(TObject *Sender)
{
	if(MessageBox(0,"請確認程式畫面上DUT HUB / USB資訊是否完整\n按  \"是\"  載入DUT資訊 \n","警告",MB_YESNO) == IDYES)
	{
		for(int i=1;i<=15;i++)
		{
			((TEdit *)FindComponent("edit_vid" + IntToStr(i)))->Text ="0000";
			((TEdit *)FindComponent("edit_pid" + IntToStr(i)))->Text ="0000";
			((TEdit *)FindComponent("edit_rev" + IntToStr(i)))->Text ="0000";
			((TEdit *)FindComponent("edtNum" + IntToStr(i)))->Text ="1";
			((TEdit *)FindComponent("edtType" + IntToStr(i)))->Text ="NULL";
		}
		//
		int setVPIDpl = 1;
		AnsiString SS,astrType,astrPID,astrVID,astrREV;
		for(int i=0;i<LBoxHUB->Items->Count;i++)
		{
			SS 	= LBoxHUB->Items->Strings[i].UpperCase();
			astrType 	= SS.SubString(SS.Pos("[")+1,4);
			astrVID 	= SS.SubString(SS.Pos("VID")+4,4);
			astrPID 	= SS.SubString(SS.Pos("PID")+4,4);
			astrREV 	= SS.SubString(SS.Pos("REV")+4,4);
			bool bSame = false;
			for(int i=1;i<=15;i++)  //尋找是否有重複資訊
			{
				TEdit *edtType  = ((TEdit *)FindComponent("edtType" + IntToStr(i)));
				TEdit *edit_vid = ((TEdit *)FindComponent("edit_vid" + IntToStr(i)));
				TEdit *edit_pid = ((TEdit *)FindComponent("edit_pid" + IntToStr(i)));
				TEdit *edit_rev = ((TEdit *)FindComponent("edit_rev" + IntToStr(i)));
				TEdit *edit_num = ((TEdit *)FindComponent("edtNum" + IntToStr(i)));
				if(!strcmp(astrType.c_str(),edtType->Text.t_str()))
						if(!strcmp(astrVID.c_str(),edit_vid->Text.t_str()))
							if(!strcmp(astrPID.c_str(),edit_pid->Text.t_str()))
								if(!strcmp(astrREV.c_str(),edit_rev->Text.t_str()))
								{
									bSame =true;
									edit_num->Text = AnsiString(edit_num->Text.ToInt()+1);
								}
			}
			if(!bSame&&setVPIDpl<=15)
			{
				((TEdit *)FindComponent("edtType" + IntToStr(setVPIDpl)))->Text = astrType;
				((TEdit *)FindComponent("edit_vid" + IntToStr(setVPIDpl)))->Text = astrVID;
				((TEdit *)FindComponent("edit_pid" + IntToStr(setVPIDpl)))->Text = astrPID;
				((TEdit *)FindComponent("edit_rev" + IntToStr(setVPIDpl)))->Text = astrREV;
				setVPIDpl++;
			}
		}
		for(int i=0;i<LBoxUSB->Items->Count;i++)
		{
			SS 	= LBoxUSB->Items->Strings[i].UpperCase();
			astrType 	= SS.SubString(SS.Pos("[")+1,4);
			astrVID 	= SS.SubString(SS.Pos("VID")+4,4);
			astrPID 	= SS.SubString(SS.Pos("PID")+4,4);
			astrREV 	= SS.SubString(SS.Pos("REV")+4,4);
			bool bSame = false;
			for(int i=1;i<=15;i++)  //尋找是否有重複資訊
			{
				TEdit *edtType  = ((TEdit *)FindComponent("edtType" + IntToStr(i)));
				TEdit *edit_vid = ((TEdit *)FindComponent("edit_vid" + IntToStr(i)));
				TEdit *edit_pid = ((TEdit *)FindComponent("edit_pid" + IntToStr(i)));
				TEdit *edit_rev = ((TEdit *)FindComponent("edit_rev" + IntToStr(i)));
				TEdit *edit_num = ((TEdit *)FindComponent("edtNum" + IntToStr(i)));
				if(!strcmp(astrType.c_str(),edtType->Text.t_str()))
					if(!strcmp(astrVID.c_str(),edit_vid->Text.t_str()))
						if(!strcmp(astrPID.c_str(),edit_pid->Text.t_str()))
							if(!strcmp(astrREV.c_str(),edit_rev->Text.t_str()))
							{
								bSame =true;
								edit_num->Text = AnsiString(edit_num->Text.ToInt()+1);
							}
			}
			if(!bSame&&setVPIDpl<=15)
			{
				((TEdit *)FindComponent("edtType" + IntToStr(setVPIDpl)))->Text  = astrType;
				((TEdit *)FindComponent("edit_vid" + IntToStr(setVPIDpl)))->Text = astrVID;
				((TEdit *)FindComponent("edit_pid" + IntToStr(setVPIDpl)))->Text = astrPID;
				((TEdit *)FindComponent("edit_rev" + IntToStr(setVPIDpl)))->Text = astrREV;
				setVPIDpl++;
			}
		}
		DeviceI = setVPIDpl-1;
		btnSet->Enabled = false;
		btnLoadDUT->Enabled = false;
		edtGLPDVersion->Text = GL_PD->GetGLPDVersion(2000).Trim();
		plGLPDView->Height   = 	edtGLPDVersion->Text == "" ? 0 : 35;
		btnSet->Enabled = true;
		btnLoadDUT->Enabled = true;
		if(DeviceI == 0)
		{
			plLoadDUTData ->Height = Panel9->Height +35 + plGLPDView->Height;
			MessageBox(0,"找不到待測物(Not Find DUT)","警告",MB_OK);
			DeviceI = 1;
		}
		else
			plLoadDUTData ->Height = Panel9->Height + (setVPIDpl-1)*35 + plGLPDView->Height;
		MForm->Height = 390+plLoadDUTData ->Height;
	}
}
//---------------------------------------------------------------------------

void __fastcall TMForm::edit_vid1Exit(TObject *Sender)
{
	TEdit* edt=(TEdit*)Sender;
	if(edt->Text.Length() == 0 || edt->Font->Color == clRed){
		edt->Text = "0000";
		edt->Font->Color = clBlue;
	}
}
//---------------------------------------------------------------------------
void __fastcall TMForm::btnDeleteItem1Click(TObject *Sender)
{

	TBitBtn* btn=(TBitBtn*)Sender;
	if(btn->Tag == 99)
		plGLPDView->Height = 0;
	else
	{
		for(int i = btn->Tag ; i <= DeviceI ; i++)
		{
			if(btn->Tag == DeviceI)
			{
				((TEdit *)FindComponent("edtNum" + IntToStr(i)))->Text =  "1" ;
				((TEdit *)FindComponent("edtType" + IntToStr(i)))->Text =  "NULL" ;
				((TEdit *)FindComponent("edit_vid" + IntToStr(i)))->Text =  "0000" ;
				((TEdit *)FindComponent("edit_pid" + IntToStr(i)))->Text =  "0000" ;
				((TEdit *)FindComponent("edit_rev" + IntToStr(i)))->Text =  "0000" ;
				break;
			}
			if(i == DeviceI) break;

			((TEdit *)FindComponent("edtNum" + IntToStr(i)))->Text =  ((TEdit *)FindComponent("edtNum" + IntToStr(i+1)))->Text ;
			((TEdit *)FindComponent("edtType" + IntToStr(i)))->Text =  ((TEdit *)FindComponent("edtType" + IntToStr(i+1)))->Text ;
			((TEdit *)FindComponent("edit_vid" + IntToStr(i)))->Text =  ((TEdit *)FindComponent("edit_vid" + IntToStr(i+1)))->Text ;
			((TEdit *)FindComponent("edit_pid" + IntToStr(i)))->Text =  ((TEdit *)FindComponent("edit_pid" + IntToStr(i+1)))->Text ;
			((TEdit *)FindComponent("edit_rev" + IntToStr(i)))->Text =  ((TEdit *)FindComponent("edit_rev" + IntToStr(i+1)))->Text ;

			((TEdit *)FindComponent("edtNum" + IntToStr(i+1)))->Text =  "1" ;
			((TEdit *)FindComponent("edtType" + IntToStr(i+1)))->Text =  "NULL" ;
			((TEdit *)FindComponent("edit_vid" + IntToStr(i+1)))->Text =  "0000" ;
			((TEdit *)FindComponent("edit_pid" + IntToStr(i+1)))->Text =  "0000" ;
			((TEdit *)FindComponent("edit_rev" + IntToStr(i+1)))->Text =  "0000" ;
		}
		DeviceI--;
	}
	if(DeviceI < 1)
		DeviceI = 1;
	plLoadDUTData ->Height = (Panel9->Height + DeviceI*35) +plGLPDView->Height;
	MForm->Height = 390+plLoadDUTData->Height;
}
//---------------------------------------------------------------------------
void TMForm::CheckDiskName()
{
	if(!bPLUGOUT)
	{
		DWORD DiskInfo = GetLogicalDrives();
		for(int i =4;i<=25;i++)
		{
			if((DiskInfo&(0x01<<i))!=0)
			{
				int MPDevice=CheckDISKVolumelabel(0x41+i);
				if (MPDevice!=-1)				//帶測磁碟機
				{
					if(usb_rw_info[MPDevice].zDeviceTable->Color != clGreen
					&& usb_rw_info[MPDevice].zDeviceTable->Color != clHotLight )
					{
						if (DiskWriteRead(0x41+i)) 	//0x41 = 'A'
						{
							usb_rw_info[MPDevice].zDeviceTable->Color=clRed;
						}
						else
						{
							//Disk Add And Test Pass
							switch(FindDiskUSBType3(0x41+i))
							{
								case USBTYPE_SUPER_SPEED_PLUS:
									usb_rw_info[MPDevice].zDeviceTable->Color=clGreen;
									break;
								case USBTYPE_SUPER_SPEED:
									usb_rw_info[MPDevice].zDeviceTable->Color=clGreen;
									break;
								case USBTYPE_NOT_FIND_DEV:
									usb_rw_info[MPDevice].zDeviceTable->Color=clYellow;
									break;
								default:
									usb_rw_info[MPDevice].zDeviceTable->Color=clHotLight;
									break;
							}
						}
						MForm->Refresh();
					}
				}
			}
		}
		SynchronizeUSB();
	}
}

void __fastcall TMForm::N1Click(TObject *Sender)
{
	TimerMain->Enabled = false;
	bSaveLocalDevInfo = false;

	LBoxHUB->Items->Clear();
	LBoxUSB->Items->Clear();
	LBoxDisk->Items->Clear();
	TListInitUSB_Dev->Clear();

	btnFindDevice->Click();
	bSaveLocalDevInfo = true;
	TimerMain->Enabled = true;
}
//---------------------------------------------------------------------------
void __fastcall TMForm::EnumUSB(){

	HDEVINFO hDevInfo;
	SP_DEVINFO_DATA DeviceInfoData;
	DWORD i,j;
	AnsiString SS,USBPath;
	PSP_DEVICE_INTERFACE_DETAIL_DATA   pDetail   =NULL;
	GUID GUID_USB =StringToGUID(GUID_USB_DEVICE);
	//--------------------------------------------------------------------------
	//   獲取設備資訊
	hDevInfo = SetupDiGetClassDevs((LPGUID)&GUID_USB,
	0,   //   Enumerator
	0,
	DIGCF_PRESENT | DIGCF_DEVICEINTERFACE );
	if   (hDevInfo   ==   INVALID_HANDLE_VALUE){
		//DEBUG("ERROR - SetupDiGetClassDevs()"); //   查詢資訊失敗
	}
	else{
	//--------------------------------------------------------------------------
		SP_DEVICE_INTERFACE_DATA   ifdata;
		DeviceInfoData.cbSize   =   sizeof(SP_DEVINFO_DATA);
		for (i=0;SetupDiEnumDeviceInfo(hDevInfo, i, &DeviceInfoData);i++)	//   枚舉每個USB設備
		{
			ifdata.cbSize   =   sizeof(ifdata);
			if (SetupDiEnumDeviceInterfaces(								//   枚舉符合該GUID的設備介面
			hDevInfo,           //   設備資訊集控制碼
			NULL,                         //   不需額外的設備描述
			(LPGUID)&GUID_USB,//GUID_CLASS_USB_DEVICE,                     //   GUID
			(ULONG)i,       //   設備資訊集�堛熙]備序號
			&ifdata))                 //   設備介面資訊
			{
				ULONG predictedLength   =   0;
				ULONG requiredLength   =   0;
				//   取得該設備介面的細節(設備路徑)
				SetupDiGetInterfaceDeviceDetail(hDevInfo,         //   設備資訊集控制碼
					&ifdata,          //   設備介面資訊
					NULL,             //   設備介面細節(設備路徑)
					0,         	      //   輸出緩衝區大小
					&requiredLength,  //   不需計算輸出緩衝區大小(直接用設定值)
					NULL);            //   不需額外的設備描述
				//   取得該設備介面的細節(設備路徑)
				predictedLength=requiredLength;
				pDetail = (PSP_INTERFACE_DEVICE_DETAIL_DATA)::GlobalAlloc(LMEM_ZEROINIT,   predictedLength);
				pDetail->cbSize   =   sizeof(SP_DEVICE_INTERFACE_DETAIL_DATA);

				if(SetupDiGetInterfaceDeviceDetail(hDevInfo,         //   設備資訊集控制碼
					&ifdata,             //   設備介面資訊
					pDetail,             //   設備介面細節(設備路徑)
					predictedLength,     //   輸出緩衝區大小
					&requiredLength,     //   不需計算輸出緩衝區大小(直接用設定值)
					NULL))               //   不需額外的設備描述
				{
					try
					{
						char   ch[512];
						for(j=0;j<predictedLength;j++)
						{
						ch[j]=*(pDetail->DevicePath+8+j);
						}
						SS="\\\\?\\USB#"+AnsiString(ch);
						SS=ch;
						SS = SS.SubString(1,SS.Pos("{")-2);
						if(SS.Pos("vid"))
						{
							if(!bSaveLocalDevInfo){
								TListInitUSB_Dev->Add(SS);
							}
							else if(!lan_find_inf(((AnsiString)TListInitUSB_Dev->Text).c_str(),SS.c_str()))
							{
								AnsiString USBType,USBDev;
								AnsiString DevPath = SS;
								DevPath.Delete(1,SS.Pos("#"));
								USBDev = CheckDevIsDuplicate(false,DevPath);
								if(USBDev == "")
								{
									switch(USBCONInfo->GetUSBType(SS.c_str()))
									{
										case USBTYPE_NOT_FIND_DEV:
											USBType = "[NULL] ";
											break;
										case USBTYPE_HI_SPEED:
											USBType = "[USB2] ";
											break;
										case USBTYPE_SUPER_SPEED:
											USBType = "[USB3] ";
											break;
										case USBTYPE_SUPER_SPEED_PLUS:
											USBType = "[GEN2] ";
											break;
										case USBTYPE_LOW_SPEED_PLUS:
											USBType = "[USB1] ";
											break;
									}
									SS = USBType+getUSB_Rev(SS)+"#"+DevPath;
								}
								else
									SS = USBDev;
								TListUSB_Dev->Add(SS);
							}
						}
						//Memo1->Lines->Add(SS);
						//DEBUG(SS);
					}
					catch(...)
					{
						//DEBUG("列舉失敗");
					}
				}
				GlobalFree(pDetail);
			}
		}
	}
	SetupDiDestroyDeviceInfoList(hDevInfo);
}
void __fastcall TMForm::EnumHUB(){
	HDEVINFO hDevInfo;
	SP_DEVINFO_DATA DeviceInfoData;
	DWORD i,j;
	AnsiString SS,USBPath;
	PSP_DEVICE_INTERFACE_DETAIL_DATA   pDetail   =NULL;
	GUID GUID_HUB =StringToGUID(GUID_USB_HUB);
	//--------------------------------------------------------------------------
	//   獲取設備資訊
	hDevInfo = SetupDiGetClassDevs((LPGUID)&GUID_HUB,
	0,   //   Enumerator
	0,
	DIGCF_PRESENT | DIGCF_DEVICEINTERFACE );
	if   (hDevInfo   ==   INVALID_HANDLE_VALUE){
		//DEBUG("ERROR - SetupDiGetClassDevs()"); //   查詢資訊失敗
	}
	else{
	//--------------------------------------------------------------------------
		SP_DEVICE_INTERFACE_DATA   ifdata;
		DeviceInfoData.cbSize   =   sizeof(SP_DEVINFO_DATA);
		for (i=0;SetupDiEnumDeviceInfo(hDevInfo, i, &DeviceInfoData);i++)	//   枚舉每個USB設備
		{
			ifdata.cbSize   =   sizeof(ifdata);
			if (SetupDiEnumDeviceInterfaces(								//   枚舉符合該GUID的設備介面
			hDevInfo,           //   設備資訊集控制碼
			NULL,                         //   不需額外的設備描述
			(LPGUID)&GUID_HUB,//GUID_CLASS_USB_DEVICE,                     //   GUID
			(ULONG)i,       //   設備資訊集�堛熙]備序號
			&ifdata))                 //   設備介面資訊
			{
				ULONG predictedLength   =   0;
				ULONG requiredLength   =   0;
				//   取得該設備介面的細節(設備路徑)
				SetupDiGetInterfaceDeviceDetail(hDevInfo,         //   設備資訊集控制碼
					&ifdata,          //   設備介面資訊
					NULL,             //   設備介面細節(設備路徑)
					0,         	      //   輸出緩衝區大小
					&requiredLength,  //   不需計算輸出緩衝區大小(直接用設定值)
					NULL);            //   不需額外的設備描述
				//   取得該設備介面的細節(設備路徑)
				predictedLength=requiredLength;
				pDetail = (PSP_INTERFACE_DEVICE_DETAIL_DATA)::GlobalAlloc(LMEM_ZEROINIT,   predictedLength);
				pDetail->cbSize   =   sizeof(SP_DEVICE_INTERFACE_DETAIL_DATA);

				if(SetupDiGetInterfaceDeviceDetail(hDevInfo,         //   設備資訊集控制碼
					&ifdata,             //   設備介面資訊
					pDetail,             //   設備介面細節(設備路徑)
					predictedLength,     //   輸出緩衝區大小
					&requiredLength,     //   不需計算輸出緩衝區大小(直接用設定值)
					NULL))               //   不需額外的設備描述
				{
					//
					try
					{
						char   ch[512];
						for(j=0;j<predictedLength;j++)
						{
						ch[j]=*(pDetail->DevicePath+8+j);
						}
						SS=ch;
						SS = SS.SubString(1,SS.Pos("{")-2);
						if(SS.Pos("vid"))
						{
							if(!bSaveLocalDevInfo){
								TListInitUSB_Dev->Add(SS);
							}
							else if(!lan_find_inf(((AnsiString)TListInitUSB_Dev->Text).c_str(),SS.c_str()))
							{
								AnsiString USBType,USBDev;
								AnsiString DevPath = SS;
								DevPath.Delete(1,SS.Pos("#"));
								USBDev = CheckDevIsDuplicate(true,DevPath);
								if(USBDev == "")
								{
									switch(USBCONInfo->GetUSBType(SS.c_str()))
									{
										case USBTYPE_NOT_FIND_DEV:
											USBType = "[NULL] ";
											break;
										case USBTYPE_HI_SPEED:
											USBType = "[USB2] ";
											break;
										case USBTYPE_SUPER_SPEED:
											USBType = "[USB3] ";
											break;
										case USBTYPE_SUPER_SPEED_PLUS:
											USBType = "[GEN2] ";
											break;
										case USBTYPE_LOW_SPEED_PLUS:
											USBType = "[USB1] ";
											break;
									}
									SS = USBType+getUSB_Rev(SS)+"#"+DevPath;
								}
								else
									SS = USBDev;
								TListHUB_Dev->Add(SS);
							}
						}

						//Memo1->Lines->Add(SS);
						//DEBUG(SS);
					}
					catch(...)
					{
						//DEBUG("列舉失敗");
                    }
				}
				GlobalFree(pDetail);
			}
		}
	}
	SetupDiDestroyDeviceInfoList(hDevInfo);
}
AnsiString TMForm::getUSB_Rev(AnsiString DEV_PATH)
{
	DEV_PATH = StringReplace(DEV_PATH, "#", "\\", TReplaceFlags()<<rfReplaceAll);
	AnsiString DevInfo="";
	AnsiString DevRev ="";

	HKEY hSoftKey = NULL;
	hSoftKey = NULL;
	AnsiString temppath = "system\\CurrentControlSet\\Enum\\USB\\"+DEV_PATH;
	if (RegOpenKeyEx(HKEY_LOCAL_MACHINE, temppath.c_str(), 0, KEY_READ,&hSoftKey) == ERROR_SUCCESS)
	{
		DWORD dwType=REG_SZ;
		DWORD dwCount=0;
		LONG lResult = RegQueryValueEx(hSoftKey, "HardwareID", NULL, &dwType,NULL, &dwCount);
		if (lResult == ERROR_SUCCESS)
		{
			LPBYTE company_Get=new BYTE [dwCount];
			lResult = RegQueryValueEx(hSoftKey, "HardwareID", NULL, &dwType,
			company_Get, &dwCount);
			if(lResult == ERROR_SUCCESS)
			{
				DevRev = AnsiString((char*)company_Get);
			}
			delete company_Get;
		}
	}
	if (hSoftKey != NULL)
		RegCloseKey(hSoftKey);
	return DevRev.Delete(1,4);
}
void TMForm::SynchronizeUSB()
{
	for(int j=0;j<16;j++)
	{
		if(!LBoxDisk->Items->Text.Pos(usb_rw_info[j].DISKName))
		{
			usb_rw_info[j].zDeviceTable->Color=clCream;
		}
	}
}
void TMForm::RegDriver(AnsiString DevVPID)
{
	if(DevVPID.Pos("VID_17E9")||DevVPID.Pos("VID_0D8C")||DevVPID.Pos("VID_0BDA")||DevVPID.Pos("VID_0B95"))
	{
		TRegistry *reg = new TRegistry();
		reg->RootKey = HKEY_LOCAL_MACHINE;
		AnsiString temppath = "SYSTEM\\CurrentControlSet\\Control\\usbflags";
		reg->OpenKey(temppath.c_str(), false);
		AnsiString tempIgnoreHWSerNum = "IgnoreHWSerNum"+DevVPID.SubString(5,4)+DevVPID.SubString(14,4);
		if(!reg->ValueExists (tempIgnoreHWSerNum))
		{
			BYTE buf[1];
			buf[0] = 0x01;
			reg->WriteBinaryData(tempIgnoreHWSerNum,buf,1);
		}
		reg->CloseKey();
		delete reg;
	}
}
void __fastcall TMForm::edtPassWordKeyDown(TObject *Sender, WORD &Key, TShiftState Shift)

{
	if(Key == 13)
		btnSet->Click();
	else
		edtPassWord->Font->Color = clBlue;
}
//---------------------------------------------------------------------------

void __fastcall TMForm::edtPassWordEnter(TObject *Sender)
{
	if(edtPassWord->Font->Color == clRed)
	{
		edtPassWord->Font->Color = clBlue;
		edtPassWord->Text 	= "";
	}
}
//---------------------------------------------------------------------------



void __fastcall TMForm::LBoxHUBExit(TObject *Sender)
{
	TListBox* LBox = (TListBox*)Sender;
	LBox->ItemIndex = -1;
}
//---------------------------------------------------------------------------

void __fastcall TMForm::imgLogoDblClick(TObject *Sender)
{
	TouchKeyboard->Visible = TouchKeyboard->Visible ? false : true;
}
//---------------------------------------------------------------------------
DWORD TMForm::FindDiskUSBType3(char Disk)
{
	AnsiString DiskVolumelabel = Disk;
	TRegistry *reg = new TRegistry();
	TStringList *ts = new TStringList;
	AnsiString DevInfo="";

	reg->RootKey = HKEY_LOCAL_MACHINE;
	AnsiString temppath = "system\\CurrentControlSet\\Services\\USBSTOR\\Enum";
	reg->OpenKey(temppath.c_str(), false);
	int DevNum = reg->ReadInteger("Count");
	for(int x=0;x<DevNum;x++)
	{
		ts->Add(reg->ReadString((AnsiString)x));
	}
	reg->CloseKey();
	for(int x=0;x<ts->Count;x++)
	{
		reg->RootKey = HKEY_LOCAL_MACHINE;
		temppath = "system\\MountedDevices";
		reg->OpenKey(temppath.c_str(), false);
		for(int y=3;y<26;y++)
		{
			char disbuf[14];
			sprintf(disbuf,"\\DosDevices\\%c:",'A'+y);
			DWORD dwBuf = reg->GetDataSize(disbuf);
			wchar_t *bBuf=(wchar_t*)malloc(dwBuf);
			reg->ReadBinaryData(disbuf,bBuf,dwBuf);
			//String comparison
			AnsiString DevPath=ts->Strings[x].SubString(23,ts->Strings[x].Length());
			AnsiString strChildPath1 = GetUSBChildPath(DevPath);
			AnsiString strChildPath2 = GetUSBChildPath(strChildPath1);
			if(bBuf != NULL)
			{
				if(DiskVolumelabel == AnsiString(disbuf).SubString(13,1))
				{
					AnsiString strChildPath = GetUSBChildPath(DevPath);
					if(strstr(AnsiString(bBuf).c_str(),DevPath.c_str()))
					{
						DevInfo+=AnsiString(ts->Strings[x])+"("+AnsiString(disbuf).SubString(13,1)+")\r\n";
						AnsiString VID = DevInfo.SubString(DevInfo.Pos("VID_")+4,4);
						AnsiString PID = DevInfo.SubString(DevInfo.Pos("PID_")+4,4);
						free(bBuf);
						bBuf=NULL;
						reg->CloseKey();
						delete ts;
						delete reg;
						return USBCONInfo->GetUSBType("vid_"+VID+"&pid_"+PID+"#"+DevPath);
					}
					else if((AnsiString(bBuf).LowerCase().Pos(GetUSBChildPath(DevPath))))
					{
						DevInfo+=AnsiString(ts->Strings[x])+"("+AnsiString(disbuf).SubString(13,1)+")\r\n";
						AnsiString VID = DevInfo.SubString(DevInfo.Pos("VID_")+4,4);
						AnsiString PID = DevInfo.SubString(DevInfo.Pos("PID_")+4,4);
						free(bBuf);
						bBuf=NULL;
						reg->CloseKey();
						delete ts;
						delete reg;
						return USBCONInfo->GetUSBType("vid_"+VID+"&pid_"+PID+"#"+DevPath);
                    }
				}
			}
			//
			free(bBuf);
			bBuf=NULL;
		}
	}
	if(ts->Count==0) DevInfo="NULL";
	reg->CloseKey();
	delete ts;
	delete reg;
	return USBTYPE_NOT_FIND_DEV;
}
AnsiString TMForm::CheckDevIsDuplicate(bool bHub,AnsiString DevPath)
{
	AnsiString SS = "";
	if(bHub)
	{
		if(LBoxHUB->Items->Text.Pos(DevPath))
		{
			for(int i = 0; i < LBoxHUB->Count ; i++)
			{
				AnsiString LBoxDevPath = LBoxHUB->Items->Strings[i];
				LBoxDevPath.Delete(1,LBoxDevPath.Pos("#"));
				if(LBoxDevPath == DevPath)
				{
					SS = LBoxHUB->Items->Strings[i];
					break;
				}
			}
		}
	}
	else
	{
		if(LBoxUSB->Items->Text.Pos(DevPath))
		{
			for(int i = 0; i < LBoxUSB->Count ; i++)
			{
				AnsiString LBoxDevPath = LBoxUSB->Items->Strings[i];
				LBoxDevPath.Delete(1,LBoxDevPath.Pos("#"));
				if(LBoxDevPath == DevPath)
				{
					SS = LBoxUSB->Items->Strings[i];
					break;
				}
			}
		}
	}
	if(SS.Pos("NULL"))
		SS = "";
	return SS;
}
void TMForm::LocalWriteTestingLOG()
{
	AnsiString strTemp = FormatDateTime("TIME,mm-dd_hh-nn-ss", Now());
	strTemp += ",TESTING,";
	strTemp += LBoxHUB->Items->Text;
	strTemp += LBoxUSB->Items->Text;
	FILE * fp;
	fp = fopen(gStrTestLogPath.c_str(),"a+");
	fseek( fp, 0, SEEK_END);
	fwrite(strTemp.c_str(),strTemp.Length(),1,fp); //寫入一筆資料
	fclose(fp);
	//
}
void TMForm::LocalWriteSettingLOG(bool bInit)
{
	AnsiString strTemp = FormatDateTime("====[mm-dd_hh-nn-ss]====\r\n", Now());
	if(bInit)
		strTemp += "[OPEN]\r\n";
	else
		strTemp += "[SETTING]\r\n";
	for(int i=0;i< DeviceI;i++)
	{
		if(deviceinfo[i] !="")
		{
			TEdit * edtNum = (TEdit *)FindComponent("edtNum" + IntToStr(i+1));
			strTemp +=  "<DeviceInfo"+AnsiString(i+1)+">";
			strTemp += edtNum->Text;
			strTemp += deviceinfo[i]+"\r\n";
		}
	}
	strTemp += "========================\r\n";
	FILE * fp;
	fp = fopen(gStrTestLogPath.c_str(),"a+");
	fseek( fp, 0, SEEK_END);
	fwrite(strTemp.c_str(),strTemp.Length(),1,fp); //寫入一筆資料
	fclose(fp);
	//
}
AnsiString TMForm::GetUSBChildPath(AnsiString Path)
{
	HDEVINFO hDevInfo;
	SP_DEVINFO_DATA DeviceInfoData;
	DWORD i,j;
	AnsiString SS,USBPath;
	PSP_DEVICE_INTERFACE_DETAIL_DATA   pDetail   =NULL;
	GUID GUID_USB =StringToGUID(GUID_USB_DEVICE);
	//--------------------------------------------------------------------------
	//   獲取設備資訊
	hDevInfo = SetupDiGetClassDevs((LPGUID)&GUID_USB,
	0,   //   Enumerator
	0,
	DIGCF_PRESENT | DIGCF_DEVICEINTERFACE );
	if   (hDevInfo   ==   INVALID_HANDLE_VALUE){
		//DEBUG("ERROR - SetupDiGetClassDevs()"); //   查詢資訊失敗
	}
	else{
	//--------------------------------------------------------------------------
		SP_DEVICE_INTERFACE_DATA   ifdata;
		SP_DEVINFO_DATA            spdd;
		DeviceInfoData.cbSize   =   sizeof(SP_DEVINFO_DATA);
		for (i=0;SetupDiEnumDeviceInfo(hDevInfo, i, &DeviceInfoData);i++)	//   枚舉每個USB設備
		{
			ifdata.cbSize   =   sizeof(ifdata);
			if (SetupDiEnumDeviceInterfaces(								//   枚舉符合該GUID的設備介面
			hDevInfo,           //   設備資訊集控制碼
			NULL,                         //   不需額外的設備描述
			(LPGUID)&GUID_USB,//GUID_CLASS_USB_DEVICE,                     //   GUID
			(ULONG)i,       //   設備資訊集�堛熙]備序號
			&ifdata))                 //   設備介面資訊
			{
				ULONG predictedLength   =   0;
				ULONG requiredLength   =   0;
				//   取得該設備介面的細節(設備路徑)
				SetupDiGetInterfaceDeviceDetail(hDevInfo,         //   設備資訊集控制碼
					&ifdata,          //   設備介面資訊
					NULL,             //   設備介面細節(設備路徑)
					0,         	      //   輸出緩衝區大小
					&requiredLength,  //   不需計算輸出緩衝區大小(直接用設定值)
					NULL);            //   不需額外的設備描述
				//   取得該設備介面的細節(設備路徑)
				predictedLength=requiredLength;
				pDetail = (PSP_INTERFACE_DEVICE_DETAIL_DATA)::GlobalAlloc(LMEM_ZEROINIT,   predictedLength);
				pDetail->cbSize   =   sizeof(SP_DEVICE_INTERFACE_DETAIL_DATA);
				ZeroMemory(&spdd, sizeof(spdd));
				spdd.cbSize = sizeof(spdd);

				if(SetupDiGetInterfaceDeviceDetail(hDevInfo,         //   設備資訊集控制碼
					&ifdata,             //   設備介面資訊
					pDetail,             //   設備介面細節(設備路徑)
					predictedLength,     //   輸出緩衝區大小
					&requiredLength,     //   不需計算輸出緩衝區大小(直接用設定值)
					&spdd))               //   不需額外的設備描述
				{
					try
					{
						char   ch[512];
						for(j=0;j<predictedLength;j++)
						{
						ch[j]=*(pDetail->DevicePath+8+j);
						}
						SS="\\\\?\\USB#"+AnsiString(ch);
						SS=ch;
						SS = SS.SubString(1,SS.Pos("{")-2);
						if(SS.Pos("vid") && SS.Pos(Path))
						{
							DEVINST DevInstParent = 0;
							char szBuff[512] = {0};
							if(CM_Get_Child(&DevInstParent,spdd.DevInst,0) == CR_SUCCESS)
							{
								CM_Get_Device_ID(DevInstParent, szBuff, 512, 0);
								SS = AnsiString(szBuff);
								SS.Delete(1,SS.Pos("\\"));
								SS.Delete(1,SS.Pos("\\"));
								GlobalFree(pDetail);
								SetupDiDestroyDeviceInfoList(hDevInfo);
								return SS.LowerCase();
							}
						}
						//Memo1->Lines->Add(SS);
						//DEBUG(SS);
					}
					catch(...)
					{
						//DEBUG("列舉失敗");
					}
				}
				GlobalFree(pDetail);
			}
		}
	}
	SetupDiDestroyDeviceInfoList(hDevInfo);
	return "";
}


