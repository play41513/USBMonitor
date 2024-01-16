//---------------------------------------------------------------------------
#include <windows.h>    // 安全移除USB裝置用 *要比 vcl.h 早編譯
#include <cfgmgr32.h>	// 安全移除USB裝置用 *要比 vcl.h 早編譯
#include <SetupAPI.h>	// 安全移除USB裝置用 *要比 vcl.h 早編譯

#include <vcl.h>
#pragma hdrstop

#include <stdio.h>		//檔案輸出入用
#include <dbt.h>		//裝置拔差事件用
#include <initguid.h>	//GUID 類別
#include "usbdi.h"		// 安全移除USB裝置用
#include "Unit1.h"



DWORD NEW_DEVICEDISK;			//最新變化的磁碟狀態
DWORD OLD_DEVICEDISK; 			//上次紀錄的磁碟狀態

BYTE WRITE_BUFFER[BUFFER_SIZE];	//寫入用的緩衝區
BYTE READ_BUFFER[BUFFER_SIZE];	//讀取用的緩衝區

FILE *fp;                       //檔案指標
bool bTimerStart=true;
bool bSetting = false;
int TimeOut=5,savetimeout;
int Hpl_Dev_Data;
bool bPLUGOUT;
AnsiString DEVCON;



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
	if(DeviceI == 0)
		Panel2 ->Height +=35;
	MForm->Height = 420+Panel2 ->Height;
	bPLUGOUT = false;
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
		 //if(!bSetting)
		 //	 CheckDevVPID(0);
	 }

	 if (Message.WParam == DBT_DEVICEREMOVECOMPLETE) //卸除了一項裝置!
	 {
		if(!bSetting)
		{
			VPIDTimeOut = 0;
			for(int i =1;i<=10;i++)
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
						usb_rw_info[MPDevice].zDeviceTable->Color=clGreen;
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
				for(int x=0;x<moDisk->Lines->Count;x++)
				{
					if(strstr(((AnsiString)moDisk->Lines->Strings[x]).c_str(),SS.c_str()))
					{
						for(int y=0;y<16;y++)
						{
							if (wcsstr(moDisk->Lines->Strings[x].c_str(),usb_rw_info[y].zDeviceTable->Caption.c_str()))
							{
								usb_rw_info[y].zDeviceTable->Color=clCream;
								MForm->Refresh();
								break;
							}
						}
						moDisk->Lines->Delete(x);
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
		for(int x=0;x<moDisk->Lines->Count;x++)
		{
			AnsiString sDisk = "("+AnsiString(Disk)+")";
			if(strstr(((AnsiString)moDisk->Lines->Strings[x]).c_str(),sDisk.c_str()))
			{
				moDisk->Lines->Delete(x);
			}
		}
		moDisk->Lines->Add((AnsiString)Volumelabel+" ("+Disk+")");
	}
	SS=((AnsiString)Volumelabel).UpperCase();
	for(int x=0;x<16;x++)
	{
		if (!strcmp(SS.c_str(),usb_rw_info[x].DISKName.c_str()))
		{
			if(!moDisk->Text.Pos(SS)) return -1;
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
		(ULONG)i,       //   設備資訊集裏的設備序號
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
void __fastcall TMForm::RemoveusbClick(TObject *Sender)
{
	for(int x=0;x<moUSB->Lines->Count;x++)
		DeviceRemove((AnsiString)moUSB->Lines->Strings[x].SubString(6,17).LowerCase());
	btnFindDevice->Click();
	edtTimeoutRemove->Text=(AnsiString)TimeOut;
	MForm->Refresh();
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
		if(!bTimerStart)
		{
			Timer1->Enabled = false;
			Sleep(500);
        }
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

void __fastcall TMForm::btn_setClick(TObject *Sender)
{
	if(edit_password->Text.UpperCase() == "SET"){
		if(btn_set->Caption == "SET"){
			bSetting = true;
			VPIDTimeOut = 0;
			for(int i=1;i<=10;i++)
			{
				((TPanel *)FindComponent("pan" + IntToStr(i)))->Enabled =true;
				((TPanel *)FindComponent("pan_show" + IntToStr(i)))->Caption ="Setting...";
				((TPanel *)FindComponent("pan_show" + IntToStr(i)))->Color =clCream;
				((TPanel *)FindComponent("btnDeleteItem" + IntToStr(i)))->Visible =true;
			}
			edit_password->Enabled = false;
			btn_set->Caption = "END";
			Panel22->Visible = true;
			edit_vid1->SetFocus();
			if(DeviceI == 0)
			{
				Panel2 ->Height +=35;
				MForm->Height = 420+Panel2 ->Height;
			}
		}else{
			bSetting = false;
			for(int i=1;i<=10;i++)
			{
				((TPanel *)FindComponent("pan" + IntToStr(i)))->Enabled =false;
				((TPanel *)FindComponent("pan_show" + IntToStr(i)))->Caption ="WAIT";
				((TPanel *)FindComponent("pan_show" + IntToStr(i)))->Color =clCream;
				((TPanel *)FindComponent("btnDeleteItem" + IntToStr(i)))->Visible = false;
			}
			edit_password->Enabled = true;
			btn_set->Caption = "SET";
			edit_password->Text = "";
			Panel22->Visible = false;
			saveinfo();
		    CheckDevVPID(0);

		}
	}else{
		MessageBox(0,"密碼錯誤(PASSWORD ERROR)","警告",MB_OK);
	}
}
//---------------------------------------------------------------------------
void  TMForm::saveinfo(){

	for(int i=0;i<10;i++)
	{
		TEdit * edt_vid = (TEdit *)FindComponent("edit_vid" + IntToStr(i+1));
		TEdit * edt_pid = (TEdit *)FindComponent("edit_pid" + IntToStr(i+1));
		TEdit * edt_rev = (TEdit *)FindComponent("edit_rev" + IntToStr(i+1));
		deviceinfo[i] = "VID_"+edt_vid->Text+"&PID_"+edt_pid->Text+"&REV_"+edt_rev->Text;
	}
	SaveINIFile();
}
//----------------------------------------------------------------------------
void  TMForm::SaveINIFile(){
	char filename[] = "SET.ini";
		fstream fp;
		fp.open(filename, ios::out); // 開啟檔案
		for(int i=0;i<10;i++)
		{
			if(deviceinfo[i] !="")
			{
				TEdit * edtNum = (TEdit *)FindComponent("edtNum" + IntToStr(i+1));
				AnsiString DevInfoNum =  "<DeviceInfo"+AnsiString(i+1)+">";
				fp << DevInfoNum.c_str() << AnsiString(edtNum->Text).c_str() <<endl;
				fp << deviceinfo[i].c_str() << endl;
            }
		}
		fp << "<TimeOut>" << endl;
		fp << AnsiString(savetimeout).c_str() << endl;
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
		for(int i=1;i<=9;i++)
		{
			((TEdit *)FindComponent("edtNum" + IntToStr(i)))->Text = Findfilemsg("SET.ini", "<DeviceInfo1>", 2*i-2).SubString(14,1);
			deviceinfo[i-1] = Findfilemsg("SET.ini", "<DeviceInfo"+AnsiString(i)+">", 1);
		}
		edtNum10->Text = Findfilemsg("SET.ini", "<DeviceInfo10>",0).SubString(15,1);
		deviceinfo[9] = Findfilemsg("SET.ini", "<DeviceInfo10>", 1);
		//
		savetimeout = Findfilemsg("SET.ini", "<TimeOut>", 1).ToInt();
		DeviceI =  Findfilemsg("SET.ini", "<ItemNumber>", 1).ToInt();
		Panel2 ->Height = Panel9->Height + DeviceI*35;
		MForm->Height = pl_Memo_Switch->Height+pl_DevData->Height+Panel2->Height;
		if(!strcmp(Findfilemsg("SET.ini", "<DUT Data>", 1).c_str(),"false"))
		{
			pl_Memo_Switch->Caption = "v" ;
			Hpl_Dev_Data = pl_DevData->Height;
			MForm->Height -= Hpl_Dev_Data;
			MForm->AutoSize =true;
			pl_DevData->Visible = false;
		}

		MForm->Position = poScreenCenter;

		for(int i=1;i<=10;i++)
		{
			TEdit * edt_vid = (TEdit *)FindComponent("edit_vid" + IntToStr(i));
			TEdit * edt_pid = (TEdit *)FindComponent("edit_pid" + IntToStr(i));
			TEdit * edt_rev = (TEdit *)FindComponent("edit_rev" + IntToStr(i));
			edt_vid->Text = deviceinfo[i-1].SubString(5,4);
			edt_pid->Text = deviceinfo[i-1].SubString(14, 4);
			if(deviceinfo[i-1].Length() > 24)
				edt_rev->Text = deviceinfo[i-1].SubString(23, 4);
		}
	}
	else
	{
		MessageBox(0,"找不到SET檔","警告",MB_OK);
		savetimeout = 5000;
		DeviceI =  1;
		Panel2 ->Height = Panel9->Height + DeviceI*35;
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
void __fastcall TMForm::chb_comparClick(TObject *Sender)
{
	if(!chb_compar->Checked){
		Panel2->Visible = false;
	}else{
		pl_Memo_Switch->Visible = false ;
		Panel6->Visible=false;
		Panel2->Visible = true;
		pl_Memo_Switch->Visible = true;
		Panel6->Visible=true;
	}
	moHUB->Height = Panel1->Height/2;
}
//---------------------------------------------------------------------------

void __fastcall TMForm::chb_usbClick(TObject *Sender)
{
	if(!chb_usb->Checked){
		Panel5->Visible = false;
	}else{
		Panel5->Visible = true;
	}
}
//---------------------------------------------------------------------------

void __fastcall TMForm::chb_diskClick(TObject *Sender)
{
	if(!chb_disk->Checked){
		moDisk->Visible = false;
	}else{
		moDisk->Visible = true;
	}
}
//---------------------------------------------------------------------------


void __fastcall TMForm::btn_addClick(TObject *Sender)
{
	if(DeviceI < 10){
		DeviceI++;
		Panel2->Height += 35;
		MForm->Height += 35;
	}

	moHUB->Height = Panel1->Height/2;
}
//---------------------------------------------------------------------------


void __fastcall TMForm::FormResize(TObject *Sender)
{
	moHUB->Height = Panel1->Height/2;
}
//---------------------------------------------------------------------------

void __fastcall TMForm::btnFindDeviceClick(TObject *Sender)//Leno 2007/1/9
{
	TListHUB_Dev->Clear();
	TListUSB_Dev->Clear();
	EnumUSB();
	EnumHUB();
	//
	bool bSame = true;
	if(moHUB->Text != TListHUB_Dev->Text)
	{
		bSame = false;
		moHUB->Text = TListHUB_Dev->Text;
	}
	if(moUSB->Text != TListUSB_Dev->Text)
	{
		bSame = false;
		moUSB->Text = TListUSB_Dev->Text;
	}

	if(!bSetting&&!bSame)
		CheckDevVPID(0);

}
void TMForm::CheckDevVPID(int flag)
{
	if(flag==1) VPIDTimeOut = 0;
	for(int i = 1; i <= DeviceI;i++)
	{
		bool bHave = false;
		TPanel * pan_show = ((TPanel *)FindComponent("pan_show" + IntToStr(i)));
		int num = ((TEdit *)FindComponent("edtNum" + IntToStr(i)))->Text.ToInt() ;
		AnsiString deviceVPID = Findfilemsg("SET.ini", "<DeviceInfo1>", 2*i-1);
		for(int j = 0;j<moHUB->Lines->Count;j++)
		{
			if(strstr(moHUB->Lines->Strings[j].t_str(),deviceVPID.c_str()))
			{
				bHave = true;
				num--;
			}
		}
		for(int j = 0;j<moUSB->Lines->Count;j++)
		{
			if(strstr(moUSB->Lines->Strings[j].t_str(),deviceVPID.c_str()))
			{
				bHave = true;
				num--;
			}
		}
		if(flag!=1 &&!bHave && pan_show->Color!=clRed)
		{
			pan_show->Caption = "WAIT";
			pan_show->Color = clCream;
		}
		//
		if(num <= 0 )
		{
			if(pan_show->Caption == "WAIT"||pan_show->Caption == "FAIL")
			{
				for(int i =1;i<=10;i++)
				{
					TPanel * plShow = ((TPanel *)FindComponent("pan_show" + IntToStr(i)));
					if(plShow->Color == clRed)
					{
						  plShow->Caption ="WAIT";
						  plShow->Color =clCream;
					}
				}
				VPIDTimeOut =  GetTickCount()+Findfilemsg("SET.ini", "<TimeOut>", 1).ToInt();
			}
			pan_show->Caption = "PASS";
			pan_show->Color = clGreen;
		}
		if(flag==1 && pan_show->Color!=clGreen)
		{
			VPIDTimeOut = 0;
			pan_show->Caption = "FAIL";
			pan_show->Color = clRed;
		}
		MForm->Refresh();
	}
}
//---------------------------------------------------------------------------
void __fastcall TMForm::Timer1Timer(TObject *Sender)
{
	if(bTimerStart)
	{
		bTimerStart = false;

		if(VPIDTimeOut!=0&&GetTickCount() > VPIDTimeOut &&!bSetting)
			CheckDevVPID(1);
		//else if(VPIDTimeOut==0)
		btnFindDevice->Click();

		if(VPIDTimeOut==0)
		{
			for(int i =1;i<=10;i++)
			{
				TPanel * plShow = ((TPanel *)FindComponent("pan_show" + IntToStr(i)));
				if(plShow->Color == clGreen)
				{
					VPIDTimeOut =  GetTickCount()+Findfilemsg("SET.ini", "<TimeOut>", 1).ToInt();
					break;
				}
			}
		}
		CheckDiskName();
		bTimerStart = true;
	}
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
			if(HexChar[j] < 0x30 || HexChar[j] > 0x39){
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
			if(HexChar[j] < 0x31 || HexChar[j] > 0x39){
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
	if(MessageBox(0,"請確認程式畫面上DUT HUB\\USB資訊是否完整\n按  是\(Y\)  載入DUT資訊 \n","警告",MB_YESNO) == IDYES)
	{
		for(int i=1;i<=10;i++)
		{
			((TEdit *)FindComponent("edit_vid" + IntToStr(i)))->Text ="0000";
			((TEdit *)FindComponent("edit_pid" + IntToStr(i)))->Text ="0000";
			((TEdit *)FindComponent("edit_rev" + IntToStr(i)))->Text ="0000";
			((TEdit *)FindComponent("edtNum" + IntToStr(i)))->Text ="1";
		}
		//
		int setVPIDpl = 1;
		AnsiString PID,VID,REV;
		for(int i=0;i<moHUB->Lines->Count;i++)
		{
			VID = moHUB->Lines->Strings[i].UpperCase().SubString(14,4);
			PID = moHUB->Lines->Strings[i].UpperCase().SubString(23,4);
			REV = moHUB->Lines->Strings[i].UpperCase().SubString(32,4);
			bool bSame = false;
			for(int i=1;i<=10;i++)  //尋找是否有重複資訊
			{
				TEdit *edit_vid = ((TEdit *)FindComponent("edit_vid" + IntToStr(i)));
				TEdit *edit_pid = ((TEdit *)FindComponent("edit_pid" + IntToStr(i)));
				TEdit *edit_rev = ((TEdit *)FindComponent("edit_rev" + IntToStr(i)));
				TEdit *edit_num = ((TEdit *)FindComponent("edtNum" + IntToStr(i)));
				if(!strcmp(VID.c_str(),edit_vid->Text.t_str()))
					if(!strcmp(PID.c_str(),edit_pid->Text.t_str()))
						if(!strcmp(REV.c_str(),edit_rev->Text.t_str()))
						{
							bSame =true;
							edit_num->Text = AnsiString(edit_num->Text.ToInt()+1);
						}
			}
			if(!bSame&&setVPIDpl<=10)
			{
				((TEdit *)FindComponent("edit_vid" + IntToStr(setVPIDpl)))->Text = VID;
				((TEdit *)FindComponent("edit_pid" + IntToStr(setVPIDpl)))->Text = PID;
				((TEdit *)FindComponent("edit_rev" + IntToStr(setVPIDpl)))->Text = REV;
				setVPIDpl++;
			}
		}
		for(int i=0;i<moUSB->Lines->Count;i++)
		{
			VID = moUSB->Lines->Strings[i].UpperCase().SubString(9,4);
			PID = moUSB->Lines->Strings[i].UpperCase().SubString(18,4);
			REV = moUSB->Lines->Strings[i].UpperCase().SubString(27,4);
			bool bSame = false;
			for(int i=1;i<=10;i++)  //尋找是否有重複資訊
			{
				TEdit *edit_vid = ((TEdit *)FindComponent("edit_vid" + IntToStr(i)));
				TEdit *edit_pid = ((TEdit *)FindComponent("edit_pid" + IntToStr(i)));
				TEdit *edit_rev = ((TEdit *)FindComponent("edit_rev" + IntToStr(i)));
				TEdit *edit_num = ((TEdit *)FindComponent("edtNum" + IntToStr(i)));
				if(!strcmp(VID.c_str(),edit_vid->Text.t_str()))
					if(!strcmp(PID.c_str(),edit_pid->Text.t_str()))
						if(!strcmp(REV.c_str(),edit_rev->Text.t_str()))
						{
							bSame =true;
							edit_num->Text = AnsiString(edit_num->Text.ToInt()+1);
						}
			}
			if(!bSame&&setVPIDpl<=10)
			{
				((TEdit *)FindComponent("edit_vid" + IntToStr(setVPIDpl)))->Text = VID;
				((TEdit *)FindComponent("edit_pid" + IntToStr(setVPIDpl)))->Text = PID;
				((TEdit *)FindComponent("edit_rev" + IntToStr(setVPIDpl)))->Text = REV;
				setVPIDpl++;
			}
		}
		DeviceI = setVPIDpl-1;
		if(DeviceI == 0)
		{
			Panel2 ->Height = Panel9->Height +35;
			MessageBox(0,"找不到待測物(Not Find DUT)","警告",MB_OK);
		}
		else Panel2 ->Height = Panel9->Height + (setVPIDpl-1)*35;
		MForm->Height = 420+Panel2 ->Height;
		saveinfo();
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
	for(int i = btn->Tag ; i <= DeviceI ; i++)
	{
		if(btn->Tag == DeviceI)
		{
			((TEdit *)FindComponent("edtNum" + IntToStr(i)))->Text =  "1" ;
			((TEdit *)FindComponent("edit_vid" + IntToStr(i)))->Text =  "0000" ;
			((TEdit *)FindComponent("edit_pid" + IntToStr(i)))->Text =  "0000" ;
			((TEdit *)FindComponent("edit_rev" + IntToStr(i)))->Text =  "0000" ;
			break;
		}
		if(i == DeviceI) break;

		((TEdit *)FindComponent("edtNum" + IntToStr(i)))->Text =  ((TEdit *)FindComponent("edtNum" + IntToStr(i+1)))->Text ;
		((TEdit *)FindComponent("edit_vid" + IntToStr(i)))->Text =  ((TEdit *)FindComponent("edit_vid" + IntToStr(i+1)))->Text ;
		((TEdit *)FindComponent("edit_pid" + IntToStr(i)))->Text =  ((TEdit *)FindComponent("edit_pid" + IntToStr(i+1)))->Text ;
		((TEdit *)FindComponent("edit_rev" + IntToStr(i)))->Text =  ((TEdit *)FindComponent("edit_rev" + IntToStr(i+1)))->Text ;

		((TEdit *)FindComponent("edtNum" + IntToStr(i+1)))->Text =  "1" ;
		((TEdit *)FindComponent("edit_vid" + IntToStr(i+1)))->Text =  "0000" ;
		((TEdit *)FindComponent("edit_pid" + IntToStr(i+1)))->Text =  "0000" ;
		((TEdit *)FindComponent("edit_rev" + IntToStr(i+1)))->Text =  "0000" ;
	}
	DeviceI--;
	Panel2 ->Height = Panel9->Height + DeviceI*35;
	MForm->Height = 420+Panel2 ->Height;
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
					if(usb_rw_info[MPDevice].zDeviceTable->Color!=clGreen)
					{
						if (DiskWriteRead(0x41+i)) 	//0x41 = 'A'
						{
							usb_rw_info[MPDevice].zDeviceTable->Color=clRed;
						}
						else
						{
							//Disk Add And Test Pass
							usb_rw_info[MPDevice].zDeviceTable->Color=clGreen;
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
	bTimerStart = false;
	bSaveLocalDevInfo = false;

	moHUB->Clear();
	moUSB->Clear();
	moDisk->Clear();
	TListInitUSB_Dev->Clear();

	btnFindDevice->Click();
	bSaveLocalDevInfo = true;
	bTimerStart = true;
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
			(ULONG)i,       //   設備資訊集裏的設備序號
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
						SS=ch;
						SS = SS.SubString(1,SS.Pos("{")-2);
						if(SS.Pos("vid"))
						{
							SS = getUSB_Rev(SS);
							if(!bSaveLocalDevInfo){
								TListInitUSB_Dev->Add(SS);
							}
							else if(!lan_find_inf(((AnsiString)TListInitUSB_Dev->Text).c_str(),SS.c_str()))
							{
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
			(ULONG)i,       //   設備資訊集裏的設備序號
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
						SS=ch;
						SS = SS.SubString(1,SS.Pos("{")-2);
						if(SS.Pos("vid"))
						{
							SS = getUSB_Rev(SS);
							if(!bSaveLocalDevInfo){
								TListInitUSB_Dev->Add(SS);
							}
							else if(!lan_find_inf(((AnsiString)TListInitUSB_Dev->Text).c_str(),SS.c_str()))
							{
								TListHUB_Dev->Add("[HUB]"+SS);
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
	//AnsiString VPID = DEV_PATH.SubString(1,DEV_PATH.Pos("\\")-1);
	//AnsiString PATH = DEV_PATH.SubString(DEV_PATH.Pos("\\"),DEV_PATH.Length()-DEV_PATH.Pos("\\")+1);
	//DEV_PATH = VPID.UpperCase()+PATH;
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
	return DevRev;
}
void TMForm::SynchronizeUSB()
{
	for(int j=0;j<16;j++)
	{
		if(!moDisk->Text.Pos(usb_rw_info[j].DISKName))
		{
			usb_rw_info[j].zDeviceTable->Color=clCream;
		}
	}
}
