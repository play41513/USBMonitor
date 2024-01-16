//---------------------------------------------------------------------------
#include <windows.h>    // �w������USB�˸m�� *�n�� vcl.h ���sĶ
#include <cfgmgr32.h>	// �w������USB�˸m�� *�n�� vcl.h ���sĶ
#include <SetupAPI.h>	// �w������USB�˸m�� *�n�� vcl.h ���sĶ

#include <vcl.h>
#pragma hdrstop

#include <stdio.h>		//�ɮ׿�X�J��
#include <dbt.h>		//�˸m�ޮt�ƥ��
#include <initguid.h>	//GUID ���O
#include "usbdi.h"		// �w������USB�˸m��
#include "Unit1.h"



DWORD NEW_DEVICEDISK;			//�̷s�ܤƪ��ϺЪ��A
DWORD OLD_DEVICEDISK; 			//�W���������ϺЪ��A
char  MPU_DISKPANO[32];			//���եΪ��ϺХN����DEVICE�s�� 1 2 3

#define BUFFER_SIZE 1024*1024	//�]�w�C�����ժ��ɮפj�p 1M
BYTE WRITE_BUFFER[BUFFER_SIZE];	//�g�J�Ϊ��w�İ�
BYTE READ_BUFFER[BUFFER_SIZE];	//Ū���Ϊ��w�İ�
FILE *fp;                       //�ɮ׫���
AnsiString FileName;

bool DEBUG=true;				//DEBUG ? ]
bool bTimerRunning=false;


//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TMForm *MForm;
//---------------------------------------------------------------------------
__fastcall TMForm::TMForm(TComponent* Owner)
	: TForm(Owner)
{
	loadset();
	//
	AnsiString disbuf;
	for(int x=1;x<=16;x++){
		if(x<10)
			disbuf="DEVICE0"+(AnsiString)x;
		else
			disbuf="DEVICE1"+(AnsiString)(x-10);
		usb_rw_info[(x-1)].DISKName=disbuf;
	}
	usb_rw_info[0].zDeviceTable=DEVICE01;
	usb_rw_info[1].zDeviceTable=DEVICE02;
	usb_rw_info[2].zDeviceTable=DEVICE03;
	usb_rw_info[3].zDeviceTable=DEVICE04;
	usb_rw_info[4].zDeviceTable=DEVICE05;
	usb_rw_info[5].zDeviceTable=DEVICE06;
	usb_rw_info[6].zDeviceTable=DEVICE07;
	usb_rw_info[7].zDeviceTable=DEVICE08;
	usb_rw_info[8].zDeviceTable=DEVICE09;
	usb_rw_info[9].zDeviceTable=DEVICE10;
	usb_rw_info[10].zDeviceTable=DEVICE11;
	usb_rw_info[11].zDeviceTable=DEVICE12;
	usb_rw_info[12].zDeviceTable=DEVICE13;
	usb_rw_info[13].zDeviceTable=DEVICE14;
	usb_rw_info[14].zDeviceTable=DEVICE15;
	usb_rw_info[15].zDeviceTable=DEVICE16;
	//  savelocalinfo �����q����l��T
	savelocalinfo = false;
	SetMode = false;
	hublist = new TStringList;
	usblist = new TStringList;
	devicelist = new TStringList;
	UnRemoveDev = new TStringList;
	

	//btn_hubinfo->Click();
	//btn_usbinfo->Click();
	btnFindDevice->Click();
	CheckDISKClick(NULL);
	savelocalinfo = true;
	USBDevice[0] = pan1;
	USBDevice[1] = pan2;
	USBDevice[2] = pan3;
	USBDevice[3] = pan4;
	USBDevice[4] = pan5;
	USBDevice[5] = pan6;
	for(int i=0;i<6;i++)
		USBDevice[i]->Enabled = false;
	DeviceI = 1;
	Panel2->Height = 70;
	btn_add->Click();
	//


}
//---------------------------------------------------------------------------
void __fastcall TMForm::FormCreate(TObject *Sender)
{

	GUID guid;
	// ���UUSB HUB�˸m , �t�Τ~�����
	guid =StringToGUID(GUID_USB_HUB);
	g_DeviceNogification.RegisterWindowsDeviceInterfaceNotification(
	Handle,guid);// GUID_CLASS_USB_DEVICE_USB);

	//USB Device  , �t�Τ~�����
	guid =StringToGUID(GUID_USB_DEVICE);
	g_DeviceNogification.RegisterWindowsDeviceInterfaceNotification(
	Handle,guid);// GUID_CLASS_USB_DEVICE_USB);

	// ���UUSBSTOR �˸m , �����SD
	guid =StringToGUID(GUID_USBSTOR);
	g_DeviceNogification.RegisterWindowsDeviceInterfaceNotification(
	Handle,guid);// GUID_CLASS_USB_DEVICE_USB);

	 //����
	OldFormWndProc = this->WindowProc;
	this->WindowProc = FormWndProc;

	OLD_DEVICEDISK=GetLogicalDrives();
	memset(WRITE_BUFFER,(BYTE)0xA5,BUFFER_SIZE);

	myformH = MForm->Height;
}
//---------------------------------------------------------------------------
//=====�d�I�T��=========================
void __fastcall TMForm::FormWndProc(TMessage& Message)
{
	OldFormWndProc(Message);

	if (Message.Msg == WM_DEVICECHANGE) {

	 if (Message.WParam == DBT_DEVICEARRIVAL)//�s���J�F�@���˸m!
	 {
	 //btn_hubinfo->Click();
	 //btn_usbinfo->Click();
		 btnFindDevice->Click();
		 CheckDISKClick(NULL);
	 }

	 if (Message.WParam == DBT_DEVICEREMOVECOMPLETE) //�����F�@���˸m!
	 {
		//btn_hubinfo->Click();
		//btn_usbinfo->Click();

		pan_show1->Caption = "WAIT";
		pan_show1->Color = clCream;
		pan_show2->Caption = "WAIT";
		pan_show2->Color = clCream;
		pan_show3->Caption = "WAIT";
		pan_show3->Color = clCream;
		pan_show4->Caption = "WAIT";
		pan_show4->Color = clCream;
		pan_show5->Caption = "WAIT";
		pan_show5->Color = clCream;
		pan_show6->Caption = "WAIT";
		pan_show6->Color = clCream;
		CheckDISKClick(NULL);
		btnFindDevice->Click();
		Removeusb->Click();
	 }
	}
}
//---------------------------------------------------------------------------

void __fastcall TMForm::CheckDISKClick(TObject *Sender)
{
AnsiString SS;
int MPDevice;
NEW_DEVICEDISK=GetLogicalDrives();
if (NEW_DEVICEDISK!=OLD_DEVICEDISK)	//�Ϻо����ܰ�
	{
	for (char i = 0; i < 32; i++)
		{
		if ((NEW_DEVICEDISK&(0x01<<i))!=(OLD_DEVICEDISK&(0x01<<i)))	//�ˬd�ܤƺ�
			{
			SS=(char)(0x41+i);
			if (NEW_DEVICEDISK&(0x01<<i))	//�s�W�Ϻ�
			{
				MPDevice=CheckDISKVolumelabel(0x41+i);
				if (MPDevice!=-1)				//�a���Ϻо�
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
			else//Leno �����Ϻ�
			{
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
						moDisk->Lines->Delete(x);
					}
				}
			}
			}
		}
	OLD_DEVICEDISK=NEW_DEVICEDISK;
	}
}
//---------------------------------------------------------------------------
int __fastcall TMForm::CheckDISKVolumelabel(char Disk)
{
	AnsiString SS;
	char Volumelabel[20];
	DWORD SerialNumber;
	DWORD MaxCLength;
	DWORD FileSysFlag;
	char FileSysName[10];
	AnsiString DiskName;
	DiskName=Disk;                      //Filename = �s�ϺЪ��ɶ��ɮ�
	DiskName+=":\\";
	GetVolumeInformation( DiskName.c_str(),Volumelabel,255,&SerialNumber,&MaxCLength,&FileSysFlag,FileSysName,255);
	if(!savelocalinfo){
		devicelist->Add(Volumelabel);
	}else if(!lan_find_inf(((AnsiString)devicelist->Text).c_str(), Volumelabel)){
		moDisk->Lines->Add((AnsiString)Volumelabel+" ("+Disk+")");
	}
	SS=((AnsiString)Volumelabel).UpperCase();
	for(int x=0;x<16;x++)
	{
		if (!strcmp(SS.c_str(),usb_rw_info[x].DISKName.c_str()))
		{
			usb_rw_info[x].DISKVolumelabel=Disk;
			return x;
		}
	}
	return -1;
}
//---------------------------------------------------------------------------
char __fastcall TMForm::DiskWriteRead(char Disk)
{
	try
	{
	//�����t�F
	//LARGE_INTEGER nBeginTime;			//�t��CLK
	//LARGE_INTEGER nEndTime;
	FileName=Disk;                      //Filename = �s�ϺЪ��ɶ��ɮ�
	FileName+=":\\"+FormatDateTime("yymmddhhmmss",Now())+".bin";
	fp=fopen(FileName.c_str(),"a+");
	fseek(fp,0,SEEK_END);
	Sleep(1);
	//QueryPerformanceCounter(&nBeginTime);
	fwrite(WRITE_BUFFER,BUFFER_SIZE,1,fp);
	//QueryPerformanceCounter(&nEndTime);
	//Memo1->Lines->Add(IntToStr(nEndTime.QuadPart-nBeginTime.QuadPart));
	fclose(fp);

	fp=fopen(FileName.c_str(),"rb");
	fseek(fp,0,SEEK_SET);
	fread(READ_BUFFER,BUFFER_SIZE,1,fp);
	fclose(fp);
	DeleteFile(FileName.c_str());
	if (memcmp(READ_BUFFER,WRITE_BUFFER,BUFFER_SIZE))
		return 0x01;	//EEEOR
	else
		return 0x00;	//PASS
	}
	catch(...)
	{
	  return 0x01;	//EEEOR
    }
}
//---------------------------------------------------------------------------

bool __fastcall TMForm::DeviceRemove(AnsiString PVID)
{
HDEVINFO hDevInfo;
SP_DEVINFO_DATA DeviceInfoData;
DWORD i,j;
AnsiString SS,USBPath;
PSP_DEVICE_INTERFACE_DETAIL_DATA   pDetail   =NULL;
//--------------------------------------------------------------------------
//   ����]�Ƹ�T
	GUID guid =StringToGUID("{A5DCBF10-6530-11D2-901F-00C04FB951ED}");
hDevInfo = SetupDiGetClassDevs((LPGUID)&guid,
				0,   //   Enumerator
				0,
				DIGCF_PRESENT | DIGCF_DEVICEINTERFACE );
if   (hDevInfo   ==   INVALID_HANDLE_VALUE)
	{
	 if (DEBUG)  MForm->moHUB->Lines->Add("ERROR - SetupDiGetClassDevs()"); //   �d�߸�T����
	}
else
	{
//--------------------------------------------------------------------------
SP_DEVICE_INTERFACE_DATA   ifdata;
DeviceInfoData.cbSize   =   sizeof(SP_DEVINFO_DATA);
for (i=0;SetupDiEnumDeviceInfo(hDevInfo, i, &DeviceInfoData);i++)	//   �T�|�C��USB�]��
	{
//	LPTSTR   buffer   =   NULL;
//	PVOID   buffer2   =   NULL;
//	DWORD   buffersize   =   0;
	ULONG   len;
	CONFIGRET cr;
	PNP_VETO_TYPE   pnpvietotype;
	CHAR   vetoname[MAX_PATH];
	ULONG   ulStatus;
	ULONG   ulProblemNumber;
	ifdata.cbSize   =   sizeof(ifdata);
	if (SetupDiEnumDeviceInterfaces(								//   �T�|�ŦX��GUID���]�Ƥ���
		hDevInfo,           //   �]�Ƹ�T������X
		NULL,                         //   �����B�~���]�ƴy�z
		(LPGUID)&guid,//GUID_CLASS_USB_DEVICE,                     //   GUID
		(ULONG)i,       //   �]�Ƹ�T���ت��]�ƧǸ�
		&ifdata))                 //   �]�Ƥ�����T
		{
		ULONG predictedLength   =   0;
		ULONG requiredLength   =   0;
		//   ���o�ӳ]�Ƥ������Ӹ`(�]�Ƹ��|)
		SetupDiGetInterfaceDeviceDetail(hDevInfo,         //   �]�Ƹ�T������X
										&ifdata,          //   �]�Ƥ�����T
										NULL,             //   �]�Ƥ����Ӹ`(�]�Ƹ��|)
										0,         	      //   ��X�w�İϤj�p
										&requiredLength,  //   ���ݭp���X�w�İϤj�p(�����γ]�w��)
										NULL);            //   �����B�~���]�ƴy�z
		//   ���o�ӳ]�Ƥ������Ӹ`(�]�Ƹ��|)
		predictedLength=requiredLength;
		pDetail = (PSP_INTERFACE_DEVICE_DETAIL_DATA)::GlobalAlloc(LMEM_ZEROINIT,   predictedLength);
		pDetail->cbSize   =   sizeof(SP_DEVICE_INTERFACE_DETAIL_DATA);

		if(SetupDiGetInterfaceDeviceDetail(hDevInfo,         //   �]�Ƹ�T������X
										&ifdata,             //   �]�Ƥ�����T
										pDetail,             //   �]�Ƥ����Ӹ`(�]�Ƹ��|)
										predictedLength,     //   ��X�w�İϤj�p
										&requiredLength,     //   ���ݭp���X�w�İϤj�p(�����γ]�w��)
										NULL))               //   �����B�~���]�ƴy�z
			{
//			USBPath=*(pDetail->DevicePath+8);
//			USBPath.SetLength(predictedLength-10);
//			if (DEBUG)  MForm->Memo1->Lines->Add("USBPath="+SS);
//  �_�� �o��ȥi�H�ΤU�C�o�ؤ覡�B�z�r��?
			char   ch[512];
			for(j=0;j<predictedLength;j++)
				{
				ch[j]=*(pDetail->DevicePath+8+j);
				}
			SS=ch;
			USBPath=SS;

			}

		}
	//Merlin End
	if (strncmp(USBPath.c_str(),PVID.c_str(),PVID.Length())) continue;    //�O�_�������ؼ�

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
	 //if (DEBUG)  MForm->Memo1->Lines->Add("---------��  ��  ��  ��---------");
//	return true;	//�ƼƲ���
	}
if ( GetLastError()!=NO_ERROR && GetLastError()!=ERROR_NO_MORE_ITEMS )
	{
	 SS.printf("ERROR   -   CM_Request_Device_Eject()[%d]\n",   GetLastError());
	 //if (DEBUG)  MForm->Memo1->Lines->Add(SS);
	//Insert   error   handling   here.
	//return   1;
	}
	//Cleanup
	SetupDiDestroyDeviceInfoList(hDevInfo);
	}
//if (DEBUG)  MForm->Memo1->Lines->Add(" -= DeviceRemove End =-");
return true;
}
//---------------------------------------------------------------------------
void __fastcall TMForm::RemoveusbClick(TObject *Sender)
{
	for(int x=0;x<moUSB->Lines->Count;x++)
		DeviceRemove((AnsiString)moUSB->Lines->Strings[x].SubString(6,17).LowerCase());
	if(!ckbAutoRemove->Checked)
	{
		for(int x=0;x<16;x++)
		{
			if(usb_rw_info[x].zDeviceTable->Color == clGreen)
			{
				for(int x=0;x<moDisk->Lines->Count;x++){
					if (wcsstr(moDisk->Lines->Strings[x].c_str(),usb_rw_info[x].zDeviceTable->Caption.c_str()))
					{
						usb_rw_info[x].zDeviceTable->Color=clGreen;
						break;
					}
					if(x==moDisk->Lines->Count-1) usb_rw_info[x].zDeviceTable->Color=clCream;
				}
				if(moDisk->Lines->Count==0) usb_rw_info[x].zDeviceTable->Color=clCream;
			}
		}
		MForm->Refresh();
	}
	btnFindDevice->Click();
}
//---------------------------------------------------------------------------

AnsiString __fastcall TMForm::DosCommand(AnsiString sCmdline)
{
PROCESS_INFORMATION proc = {0}; //����i�{��T���@�ӵ��c
long ret;
bool sPipe;
STARTUPINFO start = {0};
SECURITY_ATTRIBUTES sa = {0};
HANDLE hReadPipe ;
HANDLE hWritePipe;
AnsiString sOutput;
AnsiString sBuffer;
unsigned long lngBytesRead;
char cBuffer[256];
sa.nLength = sizeof(sa);
sa.lpSecurityDescriptor=0;
sa.bInheritHandle = TRUE;
sPipe=::CreatePipe(&hReadPipe, &hWritePipe,&sa, 0); //�Ыغ޹D
if (!sPipe)
{
sOutput="CreatePipe failed. Error: "+AnsiString(GetLastError());
//Memo1->Lines->Add(sOutput);
return sOutput;
}
start.cb = sizeof(STARTUPINFOA);
start.dwFlags = STARTF_USESTDHANDLES | STARTF_USESHOWWINDOW;
start.hStdOutput = hWritePipe;
start.hStdError = hWritePipe;
start.wShowWindow = SW_HIDE;
sBuffer = sCmdline;
ret =::CreateProcess(0, sBuffer.c_str(), &sa, &sa, TRUE, NORMAL_PRIORITY_CLASS, 0, 0, &start, &proc);
if (ret == 0)
{
sOutput="Bad command or filename";
//Memo1->Lines->Add(sOutput);
return sOutput;
}
::CloseHandle(hWritePipe);
do
{
memset(cBuffer,'\0',sizeof(cBuffer));
ret = ::ReadFile(hReadPipe, &cBuffer, 255, &lngBytesRead, 0);
sBuffer=StrPas(cBuffer);
sOutput = sOutput+sBuffer;
//Memo1->Lines->Add(sBuffer);
Application->ProcessMessages();

} while (ret != 0 );
::CloseHandle(proc.hProcess);
::CloseHandle(proc.hThread);
::CloseHandle(hReadPipe);
return sOutput;
}
//----------------------------------------------------------------------------
char* TMForm::lan_find_inf(char *pData, char *pname) { // �d��r��^�ǫ᭱���r��
	char *p, *p1;
	p = pData;
	p1 = strstr(p, pname);
	if (p1 == NULL)
		return NULL;
	p = p1 + strlen(pname);
	return p;
}

void __fastcall TMForm::btn_hubinfoClick(TObject *Sender)
{
	moHUB->Clear();
	HDEVINFO hDevInfo;
	SP_DEVINFO_DATA DeviceInfoData;
	DWORD i,j;
	AnsiString SS,USBPath;
	PSP_DEVICE_INTERFACE_DETAIL_DATA   pDetail   =NULL;
	//--------------------------------------------------------------------------
	//   ����]�Ƹ�T
	hDevInfo = SetupDiGetClassDevs((LPGUID)&GUID_CLASS_USBHUB,
	0,   //   Enumerator
	0,
	DIGCF_PRESENT | DIGCF_DEVICEINTERFACE );
	if   (hDevInfo   ==   INVALID_HANDLE_VALUE){
		if (DEBUG)  MForm->moHUB->Lines->Add("ERROR - SetupDiGetClassDevs()"); //   �d�߸�T����
	}
	else{
	//--------------------------------------------------------------------------
		SP_DEVICE_INTERFACE_DATA   ifdata;
		DeviceInfoData.cbSize   =   sizeof(SP_DEVINFO_DATA);
		for (i=0;SetupDiEnumDeviceInfo(hDevInfo, i, &DeviceInfoData);i++)	//   �T�|�C��USB�]��
		{
			//	LPTSTR   buffer   =   NULL;
			//	PVOID   buffer2   =   NULL;
			//	DWORD   buffersize   =   0;
			ULONG   len;
			CONFIGRET cr;
			PNP_VETO_TYPE   pnpvietotype;
			CHAR   vetoname[MAX_PATH];
			ULONG   ulStatus;
			ULONG   ulProblemNumber;
			ifdata.cbSize   =   sizeof(ifdata);
			if (SetupDiEnumDeviceInterfaces(								//   �T�|�ŦX��GUID���]�Ƥ���
			hDevInfo,           //   �]�Ƹ�T������X
			NULL,                         //   �����B�~���]�ƴy�z
			(LPGUID)&GUID_CLASS_USBHUB,//GUID_CLASS_USB_DEVICE,                     //   GUID
			(ULONG)i,       //   �]�Ƹ�T���ت��]�ƧǸ�
			&ifdata))                 //   �]�Ƥ�����T
			{
				ULONG predictedLength   =   0;
				ULONG requiredLength   =   0;
				//   ���o�ӳ]�Ƥ������Ӹ`(�]�Ƹ��|)
				SetupDiGetInterfaceDeviceDetail(hDevInfo,         //   �]�Ƹ�T������X
					&ifdata,          //   �]�Ƥ�����T
					NULL,             //   �]�Ƥ����Ӹ`(�]�Ƹ��|)
					0,         	      //   ��X�w�İϤj�p
					&requiredLength,  //   ���ݭp���X�w�İϤj�p(�����γ]�w��)
					NULL);            //   �����B�~���]�ƴy�z
				//   ���o�ӳ]�Ƥ������Ӹ`(�]�Ƹ��|)
				predictedLength=requiredLength;
				pDetail = (PSP_INTERFACE_DEVICE_DETAIL_DATA)::GlobalAlloc(LMEM_ZEROINIT,   predictedLength);
				pDetail->cbSize   =   sizeof(SP_DEVICE_INTERFACE_DETAIL_DATA);

				if(SetupDiGetInterfaceDeviceDetail(hDevInfo,         //   �]�Ƹ�T������X
					&ifdata,             //   �]�Ƥ�����T
					pDetail,             //   �]�Ƥ����Ӹ`(�]�Ƹ��|)
					predictedLength,     //   ��X�w�İϤj�p
					&requiredLength,     //   ���ݭp���X�w�İϤj�p(�����γ]�w��)
					NULL))               //   �����B�~���]�ƴy�z
				{
					//			USBPath=*(pDetail->DevicePath+8);
					//			USBPath.SetLength(predictedLength-10);
					//			if (DEBUG)  MForm->Memo1->Lines->Add("USBPath="+SS);
					//  �_�� �o��ȥi�H�ΤU�C�o�ؤ覡�B�z�r��?
					char   ch[512];
					for(j=0;j<predictedLength;j++)
					{
					ch[j]=*(pDetail->DevicePath+8+j);
					}
					SS=ch;

					AnsiString pvid = SS.SubString(0,17);
					if(pvid.SubString(0,4) == "vid_"){
						AnsiString cmd = "devcon6 hwids \"\*"+pvid+"\*\"";
						AnsiString Resultdata = DosCommand(cmd);
						char *pch = strtok(Resultdata.c_str(), "\r\n");
						AnsiString Result;
						int i=0;
						while (pch != NULL) {
							if(lan_find_inf(pch, "REV_")){
								Result = (AnsiString)pch;
							}
							//Result[i] = (AnsiString)pch;
							pch = strtok(NULL, "\r\n");
							i++;
						}
						if(!savelocalinfo){
							hublist->Add(Result);
						}
						if(!lan_find_inf(((AnsiString)hublist->Text).c_str(), Result.c_str())){
							int Infolength = Result.Length();
							if(Infolength > 38)
								MForm->moHUB->Lines->Add("[HUB]"+Result.SubString(0,38));
							else
								MForm->moHUB->Lines->Add("[HUB]"+Result);
							if(deviceinfo1 != ""){
								if(lan_find_inf(Result.c_str(), deviceinfo1.c_str())){
									pan_show1->Caption = "PASS";
									pan_show1->Color = clGreen;
								}
							}
							if(deviceinfo2 != ""){
								if(lan_find_inf(Result.c_str(), deviceinfo2.c_str())){
									pan_show2->Caption = "PASS";
									pan_show2->Color = clGreen;
								}
							}
							if(deviceinfo3 != ""){
								if(lan_find_inf(Result.c_str(), deviceinfo3.c_str())){
									pan_show3->Caption = "PASS";
									pan_show3->Color = clGreen;
								}
							}
							if(deviceinfo4 != ""){
								if(lan_find_inf(Result.c_str(), deviceinfo4.c_str())){
									pan_show4->Caption = "PASS";
									pan_show4->Color = clGreen;
								}
							}
							if(deviceinfo5 != ""){
								if(lan_find_inf(Result.c_str(), deviceinfo5.c_str())){
									pan_show5->Caption = "PASS";
									pan_show5->Color = clGreen;
								}
							}
							if(deviceinfo6 != ""){
								if(lan_find_inf(Result.c_str(), deviceinfo6.c_str())){
									pan_show6->Caption = "PASS";
									pan_show6->Color = clGreen;
								}
							}
						}
					}
					USBPath=SS;

				}
				else
				{
					if (DEBUG)  MForm->moHUB->Lines->Add("SetupDiGetInterfaceDeviceDetail F");
				}
			}
			else
			{
				if (DEBUG)  MForm->moHUB->Lines->Add("SetupDiEnumDeviceInterfaces F");
			}
		}
	}
}
//---------------------------------------------------------------------------

void __fastcall TMForm::btn_usbinfoClick(TObject *Sender)
{
	moUSB->Clear();
	HDEVINFO hDevInfo;
	SP_DEVINFO_DATA DeviceInfoData;
	DWORD i,j;
	AnsiString SS,USBPath;
	PSP_DEVICE_INTERFACE_DETAIL_DATA   pDetail   =NULL;
	//--------------------------------------------------------------------------
	//   ����]�Ƹ�T
	hDevInfo = SetupDiGetClassDevs((LPGUID)&GUID_CLASS_USB_DEVICE,
	0,   //   Enumerator
	0,
	DIGCF_PRESENT | DIGCF_DEVICEINTERFACE );
	if   (hDevInfo   ==   INVALID_HANDLE_VALUE){
		if (DEBUG)  MForm->moHUB->Lines->Add("ERROR - SetupDiGetClassDevs()"); //   �d�߸�T����
	}
	else{
	//--------------------------------------------------------------------------
		SP_DEVICE_INTERFACE_DATA   ifdata;
		DeviceInfoData.cbSize   =   sizeof(SP_DEVINFO_DATA);
		for (i=0;SetupDiEnumDeviceInfo(hDevInfo, i, &DeviceInfoData);i++)	//   �T�|�C��USB�]��
		{
			//	LPTSTR   buffer   =   NULL;
			//	PVOID   buffer2   =   NULL;
			//	DWORD   buffersize   =   0;
			ULONG   len;
			CONFIGRET cr;
			PNP_VETO_TYPE   pnpvietotype;
			CHAR   vetoname[MAX_PATH];
			ULONG   ulStatus;
			ULONG   ulProblemNumber;
			ifdata.cbSize   =   sizeof(ifdata);
			if (SetupDiEnumDeviceInterfaces(								//   �T�|�ŦX��GUID���]�Ƥ���
			hDevInfo,           //   �]�Ƹ�T������X
			NULL,                         //   �����B�~���]�ƴy�z
			(LPGUID)&GUID_CLASS_USB_DEVICE,//GUID_CLASS_USB_DEVICE,                     //   GUID
			(ULONG)i,       //   �]�Ƹ�T���ت��]�ƧǸ�
			&ifdata))                 //   �]�Ƥ�����T
			{
				ULONG predictedLength   =   0;
				ULONG requiredLength   =   0;
				//   ���o�ӳ]�Ƥ������Ӹ`(�]�Ƹ��|)
				SetupDiGetInterfaceDeviceDetail(hDevInfo,         //   �]�Ƹ�T������X
					&ifdata,          //   �]�Ƥ�����T
					NULL,             //   �]�Ƥ����Ӹ`(�]�Ƹ��|)
					0,         	      //   ��X�w�İϤj�p
					&requiredLength,  //   ���ݭp���X�w�İϤj�p(�����γ]�w��)
					NULL);            //   �����B�~���]�ƴy�z
				//   ���o�ӳ]�Ƥ������Ӹ`(�]�Ƹ��|)
				predictedLength=requiredLength;
				pDetail = (PSP_INTERFACE_DEVICE_DETAIL_DATA)::GlobalAlloc(LMEM_ZEROINIT,   predictedLength);
				pDetail->cbSize   =   sizeof(SP_DEVICE_INTERFACE_DETAIL_DATA);

				if(SetupDiGetInterfaceDeviceDetail(hDevInfo,         //   �]�Ƹ�T������X
					&ifdata,             //   �]�Ƥ�����T
					pDetail,             //   �]�Ƥ����Ӹ`(�]�Ƹ��|)
					predictedLength,     //   ��X�w�İϤj�p
					&requiredLength,     //   ���ݭp���X�w�İϤj�p(�����γ]�w��)
					NULL))               //   �����B�~���]�ƴy�z
				{
					//			USBPath=*(pDetail->DevicePath+8);
					//			USBPath.SetLength(predictedLength-10);
					//			if (DEBUG)  MForm->Memo1->Lines->Add("USBPath="+SS);
					//  �_�� �o��ȥi�H�ΤU�C�o�ؤ覡�B�z�r��?
					char   ch[512];
					for(j=0;j<predictedLength;j++)
					{
					ch[j]=*(pDetail->DevicePath+8+j);
					}
					SS=ch;

					AnsiString pvid = SS.SubString(0,17);
					if(pvid.SubString(0,4) == "vid_"){
						AnsiString cmd = "devcon6 hwids \"\*"+pvid+"\*\"";
						AnsiString Resultdata = DosCommand(cmd);
						char *pch = strtok(Resultdata.c_str(), "\r\n");
						AnsiString Result;
						int i=0;
						while (pch != NULL) {
							if(lan_find_inf(pch, "REV_")){
								Result = (AnsiString)pch;
							}
							pch = strtok(NULL, "\r\n");
							i++;
						}
						if(!savelocalinfo){
							usblist->Add(Result);
						}
						if(!lan_find_inf(((AnsiString)usblist->Text).c_str(), Result.c_str())){
							int Infolength = Result.Length();
							if(Infolength > 38)
								MForm->moUSB->Lines->Add(Result.SubString(0,38));
							else
								MForm->moUSB->Lines->Add(Result);
							if(deviceinfo1 != ""){
								if(lan_find_inf(Result.c_str(), deviceinfo1.c_str())){
									pan_show1->Caption = "PASS";
									pan_show1->Color = clGreen;
								}
							}
							if(deviceinfo2 != ""){
								if(lan_find_inf(Result.c_str(), deviceinfo2.c_str())){
									pan_show2->Caption = "PASS";
									pan_show2->Color = clGreen;
								}
							}
							if(deviceinfo3 != ""){
								if(lan_find_inf(Result.c_str(), deviceinfo3.c_str())){
									pan_show3->Caption = "PASS";
									pan_show3->Color = clGreen;
								}
							}
							if(deviceinfo4 != ""){
								if(lan_find_inf(Result.c_str(), deviceinfo4.c_str())){
									pan_show4->Caption = "PASS";
									pan_show4->Color = clGreen;
								}
							}
							if(deviceinfo5 != ""){
								if(lan_find_inf(Result.c_str(), deviceinfo5.c_str())){
									pan_show5->Caption = "PASS";
									pan_show5->Color = clGreen;
								}
							}
							if(deviceinfo6 != ""){
								if(lan_find_inf(Result.c_str(), deviceinfo6.c_str())){
									pan_show6->Caption = "PASS";
									pan_show6->Color = clGreen;
								}
							}
						}
					}
					USBPath=SS;

				}
				else
				{
					if (DEBUG)  MForm->moHUB->Lines->Add("SetupDiGetInterfaceDeviceDetail F");
				}
			}
			else
			{
				if (DEBUG)  MForm->moHUB->Lines->Add("SetupDiEnumDeviceInterfaces F");
			}
		}
	}
}
//---------------------------------------------------------------------------

void __fastcall TMForm::FormClose(TObject *Sender, TCloseAction &Action)
{
	delete hublist;
	delete usblist;
	delete devicelist;
	delete UnRemoveDev;
}
//---------------------------------------------------------------------------

void __fastcall TMForm::btn_setClick(TObject *Sender)
{
	if(edit_password->Text == "set"){
		if(!SetMode){
			edit_password->Enabled = false;
			btn_set->Caption = "END";
			SetMode = true;
			for(int i=0;i<6;i++)
				USBDevice[i]->Enabled = true;
			edit_vid1->SetFocus();
		}else{
			edit_password->Enabled = true;
			btn_set->Caption = "SET";
			edit_password->Text = "";
			SetMode = false;
			for(int i=0;i<6;i++)
				USBDevice[i]->Enabled = false;
			saveinfo();
		}
	}else{
    	MessageBox(0,"�K�X���~","ĵ�i",MB_OK);
	}
}
//---------------------------------------------------------------------------
void __fastcall TMForm::saveinfo(){
	if(edit_vid1->Text != "    " && edit_pid1->Text != "    "){  //�ѩ�MaskEdit �S��J�ȷ|�ɪť�
		if(edit_rev1->Text != "    "){ //�ѩ�MaskEdit �S��J�ȷ|�ɪť�
			deviceinfo1 = "VID_"+edit_vid1->Text+"&PID_"+edit_pid1->Text+"&REV_"+edit_rev1->Text;
		}else{
			deviceinfo1 = "VID_"+edit_vid1->Text+"&PID_"+edit_pid1->Text;
		}
	}else{
		deviceinfo1 = "";
	}

	if(edit_vid2->Text != "    " && edit_pid2->Text != "    "){  //�ѩ�MaskEdit �S��J�ȷ|�ɪť�
		if(edit_rev2->Text != "    "){ //�ѩ�MaskEdit �S��J�ȷ|�ɪť�
			deviceinfo2 = "VID_"+edit_vid2->Text+"&PID_"+edit_pid2->Text+"&REV_"+edit_rev2->Text;
		}else{
			deviceinfo2 = "VID_"+edit_vid2->Text+"&PID_"+edit_pid2->Text;
		}
	}else{
		deviceinfo2 = "";
	}

	if(edit_vid3->Text != "    " && edit_pid3->Text != "    "){  //�ѩ�MaskEdit �S��J�ȷ|�ɪť�
		if(edit_rev3->Text != "    "){ //�ѩ�MaskEdit �S��J�ȷ|�ɪť�
			deviceinfo3 = "VID_"+edit_vid3->Text+"&PID_"+edit_pid3->Text+"&REV_"+edit_rev3->Text;
		}else{
			deviceinfo3 = "VID_"+edit_vid3->Text+"&PID_"+edit_pid3->Text;
		}
	}else{
		deviceinfo3 = "";
	}

	if(edit_vid4->Text != "    " && edit_pid4->Text != "    "){  //�ѩ�MaskEdit �S��J�ȷ|�ɪť�
		if(edit_rev4->Text != "    "){ //�ѩ�MaskEdit �S��J�ȷ|�ɪť�
			deviceinfo4 = "VID_"+edit_vid4->Text+"&PID_"+edit_pid4->Text+"&REV_"+edit_rev4->Text;
		}else{
			deviceinfo4 = "VID_"+edit_vid4->Text+"&PID_"+edit_pid4->Text;
		}
	}else{
		deviceinfo4 = "";
	}

	if(edit_vid5->Text != "    " && edit_pid2->Text != "    "){  //�ѩ�MaskEdit �S��J�ȷ|�ɪť�
		if(edit_rev5->Text != "    "){ //�ѩ�MaskEdit �S��J�ȷ|�ɪť�
			deviceinfo5 = "VID_"+edit_vid5->Text+"&PID_"+edit_pid5->Text+"&REV_"+edit_rev5->Text;
		}else{
			deviceinfo5 = "VID_"+edit_vid5->Text+"&PID_"+edit_pid5->Text;
		}
	}else{
		deviceinfo5 = "";
	}

	if(edit_vid6->Text != "    " && edit_pid6->Text != "    "){  //�ѩ�MaskEdit �S��J�ȷ|�ɪť�
		if(edit_rev6->Text != "    "){ //�ѩ�MaskEdit �S��J�ȷ|�ɪť�
			deviceinfo6 = "VID_"+edit_vid6->Text+"&PID_"+edit_pid6->Text+"&REV_"+edit_rev6->Text;
		}else{
			deviceinfo6 = "VID_"+edit_vid6->Text+"&PID_"+edit_pid6->Text;
		}
	}else{
		deviceinfo6 = "";
	}
	saveset();
}
//----------------------------------------------------------------------------
void __fastcall TMForm::saveset(){
	char filename[] = "SET.ini";
		fstream fp;
		fp.open(filename, ios::out); // �}���ɮ�
		if(deviceinfo1 != ""){
			fp << "<DeviceInfo1>" << endl;
			fp << deviceinfo1.c_str() << endl;
		}
		if(deviceinfo2 != ""){
			fp << "<DeviceInfo2>" << endl;
			fp << deviceinfo2.c_str() << endl;
		}
		if(deviceinfo3 != ""){
			fp << "<DeviceInfo3>" << endl;
			fp << deviceinfo3.c_str() << endl;
		}
		if(deviceinfo4 != ""){
			fp << "<DeviceInfo4>" << endl;
			fp << deviceinfo4.c_str() << endl;
		}
		if(deviceinfo5 != ""){
			fp << "<DeviceInfo5>" << endl;
			fp << deviceinfo5.c_str() << endl;
		}
		if(deviceinfo6 != ""){
			fp << "<DeviceInfo6>" << endl;
			fp << deviceinfo6.c_str() << endl;
		}
		fp.close(); // �����ɮ�
}
//----------------------------------------------------------------------------
void __fastcall TMForm::loadset(){
	deviceinfo1 = Findfilemsg("SET.ini", "<DeviceInfo1>", 1);
	deviceinfo2 = Findfilemsg("SET.ini", "<DeviceInfo2>", 1);
	deviceinfo3 = Findfilemsg("SET.ini", "<DeviceInfo3>", 1);
	deviceinfo4 = Findfilemsg("SET.ini", "<DeviceInfo4>", 1);
	deviceinfo5 = Findfilemsg("SET.ini", "<DeviceInfo5>", 1);
	deviceinfo6 = Findfilemsg("SET.ini", "<DeviceInfo6>", 1);
	if(deviceinfo1.Length() > 24){
		edit_vid1->Text = deviceinfo1.SubString(5,4);
		edit_pid1->Text = deviceinfo1.SubString(14, 4);
		edit_rev1->Text = deviceinfo1.SubString(23, 4);
	}else{
		edit_vid1->Text = deviceinfo1.SubString(5,4);
		edit_pid1->Text = deviceinfo1.SubString(14, 4);
	}
	if(deviceinfo2.Length() > 24){
		edit_vid2->Text = deviceinfo2.SubString(5,4);
		edit_pid2->Text = deviceinfo2.SubString(14, 4);
		edit_rev2->Text = deviceinfo2.SubString(23, 4);
	}else{
		edit_vid2->Text = deviceinfo2.SubString(5,4);
		edit_pid2->Text = deviceinfo2.SubString(14, 4);
	}
	if(deviceinfo3.Length() > 24){
		edit_vid3->Text = deviceinfo3.SubString(5,4);
		edit_pid3->Text = deviceinfo3.SubString(14, 4);
		edit_rev3->Text = deviceinfo3.SubString(23, 4);
	}else{
		edit_vid3->Text = deviceinfo3.SubString(5,4);
		edit_pid3->Text = deviceinfo3.SubString(14, 4);
	}
	if(deviceinfo4.Length() > 24){
		edit_vid4->Text = deviceinfo4.SubString(5,4);
		edit_pid4->Text = deviceinfo4.SubString(14, 4);
		edit_rev4->Text = deviceinfo4.SubString(23, 4);
	}else{
		edit_vid4->Text = deviceinfo4.SubString(5,4);
		edit_pid4->Text = deviceinfo4.SubString(14, 4);
	}
	if(deviceinfo5.Length() > 24){
		edit_vid5->Text = deviceinfo5.SubString(5,4);
		edit_pid5->Text = deviceinfo5.SubString(14, 4);
		edit_rev5->Text = deviceinfo5.SubString(23, 4);
	}else{
		edit_vid5->Text = deviceinfo5.SubString(5,4);
		edit_pid5->Text = deviceinfo5.SubString(14, 4);
	}
	if(deviceinfo6.Length() > 24){
		edit_vid6->Text = deviceinfo6.SubString(5,4);
		edit_pid6->Text = deviceinfo6.SubString(14, 4);
		edit_rev6->Text = deviceinfo6.SubString(23, 4);
	}else{
		edit_vid6->Text = deviceinfo6.SubString(5,4);
		edit_pid6->Text = deviceinfo6.SubString(14, 4);
	}
}
//----------------------------------------------------------------------------
AnsiString TMForm::Findfilemsg(AnsiString filename, AnsiString findmsg,
	int rownum) { // ���ɮק��r���^�ǴX��᪺�r��
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
		return "�ɮ׶}�ҥ���!";
}
void __fastcall TMForm::chb_comparClick(TObject *Sender)
{
	if(!chb_compar->Checked){
		Panel2->Visible = false;
	}else{
		Panel6->Visible=false;
		Panel2->Visible = true;
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
	if(DeviceI < 6){
		DeviceI++;
		Panel2->Height += 40;
		MForm->Height += 40;
	}
	for(int i=0;i<DeviceI;i++){
		USBDevice[i]->Visible = true;
	}
	for(int i=DeviceI;i<6;i++){
		USBDevice[i]->Visible = false;
	}
	moHUB->Height = Panel1->Height/2;
}
//---------------------------------------------------------------------------

void __fastcall TMForm::btn_cutClick(TObject *Sender)
{
	if(DeviceI > 0 ){
		DeviceI--;
		Panel2->Height -= 40;
		MForm->Height -= 40;
	}
	for(int i=0;i<DeviceI;i++){
		USBDevice[i]->Visible = true;
	}
	for(int i=DeviceI;i<6;i++){
		USBDevice[i]->Visible = false;
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
	AnsiString cmd = "devcon6 hwids \"\*usb\\\*\"";
	AnsiString Resultdata = DosCommand(cmd);
	bool Hub=false;
	char *pch = strtok(Resultdata.c_str(), "\r\n");
	AnsiString Result;
	TStringList* NList = new TStringList();
	moHUB->Clear();
	moUSB->Clear();
	while (pch != NULL) {
		if(!strstr(pch," ")||strstr(pch,"matching device"))//�C�Ӹ˸m����
		{
			if(lan_find_inf(((AnsiString)NList->Text).c_str(), "USB20_HUB")||lan_find_inf(((AnsiString)NList->Text).c_str(), "USB30_HUB"))
			{//�P�_��hub
				for(int x=0;x<NList->Count;x++)
				{
					if(wcsstr(NList->Strings[x].c_str(), L"REV_"))
					{
						if(!savelocalinfo){
							usblist->Add((AnsiString)NList->Strings[x]);
						}
						else if(!lan_find_inf(((AnsiString)usblist->Text).c_str(),((AnsiString)NList->Strings[x]).c_str())){
							Result=(AnsiString)NList->Strings[x];
							int Infolength = Result.Length();
							if(Infolength > 38)
							{
									MForm->moHUB->Lines->Add("[HUB]"+Result.SubString(8,38));
							}
							else
							{
									MForm->moHUB->Lines->Add("[HUB]"+Result.SubString(8,Infolength));
							}
						}
						if(deviceinfo1 != ""){
							if(lan_find_inf(Result.c_str(), deviceinfo1.c_str())){
								pan_show1->Caption = "PASS";
								pan_show1->Color = clGreen;
							}
						}
						if(deviceinfo2 != ""){
							if(lan_find_inf(Result.c_str(), deviceinfo2.c_str())){
								pan_show2->Caption = "PASS";
								pan_show2->Color = clGreen;
							}
						}
						if(deviceinfo3 != ""){
							if(lan_find_inf(Result.c_str(), deviceinfo3.c_str())){
								pan_show3->Caption = "PASS";
								pan_show3->Color = clGreen;
							}
						}
						if(deviceinfo4 != ""){
							if(lan_find_inf(Result.c_str(), deviceinfo4.c_str())){
								pan_show4->Caption = "PASS";
								pan_show4->Color = clGreen;
							}
						}
						if(deviceinfo5 != ""){
							if(lan_find_inf(Result.c_str(), deviceinfo5.c_str())){
								pan_show5->Caption = "PASS";
								pan_show5->Color = clGreen;
							}
						}
						if(deviceinfo6 != ""){
							if(lan_find_inf(Result.c_str(), deviceinfo6.c_str())){
								pan_show6->Caption = "PASS";
								pan_show6->Color = clGreen;
							}
						}
						break;
					}
				}
			}
			else
			{   //USB
				for(int x=0;x<NList->Count;x++)
				{
					if(wcsstr(NList->Strings[x].c_str(), L"REV_"))
					{
						if(!savelocalinfo){
							usblist->Add((AnsiString)NList->Strings[x]);
						}
						else if(!lan_find_inf(((AnsiString)usblist->Text).c_str(),((AnsiString)NList->Strings[x]).c_str())){
							Result=(AnsiString)NList->Strings[x];
							int Infolength = Result.Length();
							if(Infolength > 38)
							{       //LAN�BAUDIO���T��
									//MForm->moUSB->Lines->Add(Result.SubString(8,38));
							}
							else
							{
									MForm->moUSB->Lines->Add(Result.SubString(8,Infolength));
							}
						}
						if(deviceinfo1 != ""){
							if(lan_find_inf(Result.c_str(), deviceinfo1.c_str())){
								pan_show1->Caption = "PASS";
								pan_show1->Color = clGreen;
							}
						}
						if(deviceinfo2 != ""){
							if(lan_find_inf(Result.c_str(), deviceinfo2.c_str())){
								pan_show2->Caption = "PASS";
								pan_show2->Color = clGreen;
							}
						}
						if(deviceinfo3 != ""){
							if(lan_find_inf(Result.c_str(), deviceinfo3.c_str())){
								pan_show3->Caption = "PASS";
								pan_show3->Color = clGreen;
							}
						}
						if(deviceinfo4 != ""){
							if(lan_find_inf(Result.c_str(), deviceinfo4.c_str())){
								pan_show4->Caption = "PASS";
								pan_show4->Color = clGreen;
							}
						}
						if(deviceinfo5 != ""){
							if(lan_find_inf(Result.c_str(), deviceinfo5.c_str())){
								pan_show5->Caption = "PASS";
								pan_show5->Color = clGreen;
							}
						}
						if(deviceinfo6 != ""){
							if(lan_find_inf(Result.c_str(), deviceinfo6.c_str())){
								pan_show6->Caption = "PASS";
								pan_show6->Color = clGreen;
							}
						}
						break;
					}
				}
			}
			NList->Clear();
		}
		else
		{
			NList->Add(pch);
		}
		pch = strtok(NULL, "\r\n");
	}


	delete NList;

}
//---------------------------------------------------------------------------

void __fastcall TMForm::Timer1Timer(TObject *Sender)
{
	btnFindDevice->Click();
	if(ckbAutoRemove->Checked&&!bTimerRunning)
	{//Auto Remove
		bTimerRunning=true;
		int numFind=0;
		int Num=0;
		for(int x=0;x<16;x++)
			if(usb_rw_info[x].zDeviceTable->Color!=clCream) Num++;
		if(Num>=edtAutoRemoveNum->Text) Removeusb->Click();
		//

		for(int x=0;x<UnRemoveDev->Count;x++)
		{
			for(int y=0;y<moUSB->Lines->Count;y++)
				if(wcsstr(moUSB->Lines->Strings[y].LowerCase().c_str(),UnRemoveDev->Strings[x].c_str())){
				 numFind++;
				}
		}
		if(numFind==0&&UnRemoveDev->Count>0)
		{
			UnRemoveDev->Clear();
			for(int x=0;x<16;x++)
			{
				if(usb_rw_info[x].zDeviceTable->Color == clGreen)
				{
					for(int y=0;y<moDisk->Lines->Count;y++){
						if (wcsstr(moDisk->Lines->Strings[y].c_str(),usb_rw_info[x].zDeviceTable->Caption.c_str()))
						{
							break;
						}
						if(y==moDisk->Lines->Count-1)
							usb_rw_info[x].zDeviceTable->Color=clCream;
					}
					if(moDisk->Lines->Count==0)
						usb_rw_info[x].zDeviceTable->Color=clCream;
				}
			}
			MForm->Refresh();
		}
		bTimerRunning=false;
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
bool TMForm::CheckDevIsRemove()
{

}


void __fastcall TMForm::ckbAutoRemoveClick(TObject *Sender)
{
	if(ckbAutoRemove->Checked)
	{
		edtAutoRemoveNum->Visible=true;
		edtAutoRemoveNum->SetFocus();

	}
	else edtAutoRemoveNum->Visible=false;
}
//---------------------------------------------------------------------------
