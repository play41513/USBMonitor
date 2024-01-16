//---------------------------------------------------------------------------

#ifndef Unit1H
#define Unit1H
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ExtCtrls.hpp>
#include <CheckLst.hpp>
#include <Keyboard.hpp>
#include "TeCanvas.hpp"
#include "TeeEdiGrad.hpp"
#include "TeePenDlg.hpp"
#include <ButtonGroup.hpp>
#include <Buttons.hpp>
#include <CategoryButtons.hpp>
#include <ImgList.hpp>
#include <Mask.hpp>
#include <Menus.hpp>
#include <pngimage.hpp>
#include <fstream>
#include <iostream>
#include <string>
#include "DeviceNotify.h"
#include <Registry.hpp>
#include <vector>
#include <direct.h>

const char GUID_USB_HUB[] = "{F18A0E88-C30C-11D0-8815-00A0C906BED8}";
const char GUID_USB_DEVICE[] = "{A5DCBF10-6530-11D2-901F-00C04FB951ED}";
const char GUID_USBSTOR[] = "{53F5630D-B6BF-11D0-94F2-00A0C91EFB8B}";

const AnsiString PASSWORD  = "SET";

#define BUFFER_SIZE 1024*1024	//設定每次測試的檔案大小 1M
//---------------------------------------------------------------------------
class TMForm : public TForm
{
__published:	// IDE-managed Components
	TTimer *TimerMain;
	TPopupMenu *PopupMenu1;
	TMenuItem *N1;
	TButton *CheckDISK;
	TPanel *plLeft;
	TPanel *plLoadDUTData;
	TPanel *pan6;
	TPanel *Panel15;
	TPanel *Panel16;
	TPanel *Panel17;
	TPanel *pan_show6;
	TEdit *edtNum6;
	TEdit *edit_vid6;
	TEdit *edit_pid6;
	TEdit *edit_rev6;
	TButton *btnDeleteItem6;
	TPanel *Panel9;
	TEdit *edtPassWord;
	TButton *btnSet;
	TPanel *plLoadDUTInfo;
	TButton *btnLoadDUT;
	TButton *btn_add;
	TPanel *pan2;
	TPanel *Panel12;
	TPanel *Panel13;
	TPanel *Panel14;
	TPanel *pan_show2;
	TEdit *edit_vid2;
	TEdit *edit_pid2;
	TEdit *edit_rev2;
	TEdit *edtNum2;
	TButton *btnDeleteItem2;
	TPanel *pan5;
	TPanel *Panel19;
	TPanel *Panel20;
	TPanel *Panel21;
	TPanel *pan_show5;
	TEdit *edtNum5;
	TEdit *edit_vid5;
	TEdit *edit_pid5;
	TEdit *edit_rev5;
	TButton *btnDeleteItem5;
	TPanel *pan4;
	TPanel *Panel25;
	TPanel *Panel26;
	TPanel *Panel27;
	TPanel *pan_show4;
	TEdit *edtNum4;
	TEdit *edit_vid4;
	TEdit *edit_pid4;
	TEdit *edit_rev4;
	TButton *btnDeleteItem4;
	TPanel *pan1;
	TPanel *Panel11;
	TPanel *Panel18;
	TPanel *Panel24;
	TPanel *pan_show1;
	TEdit *edtNum1;
	TEdit *edit_vid1;
	TEdit *edit_pid1;
	TEdit *edit_rev1;
	TButton *btnDeleteItem1;
	TPanel *pan3;
	TPanel *Panel31;
	TPanel *Panel32;
	TPanel *Panel33;
	TPanel *pan_show3;
	TEdit *edtNum3;
	TEdit *edit_vid3;
	TEdit *edit_pid3;
	TEdit *edit_rev3;
	TButton *btnDeleteItem3;
	TPanel *pan8;
	TPanel *Panel36;
	TPanel *Panel37;
	TPanel *Panel38;
	TPanel *pan_show7;
	TEdit *edtNum7;
	TEdit *edit_vid7;
	TEdit *edit_pid7;
	TEdit *edit_rev7;
	TButton *btnDeleteItem7;
	TPanel *pan10;
	TPanel *Panel46;
	TPanel *Panel47;
	TPanel *Panel48;
	TPanel *pan_show10;
	TEdit *edtNum10;
	TEdit *edit_vid10;
	TEdit *edit_pid10;
	TEdit *edit_rev10;
	TButton *btnDeleteItem10;
	TPanel *pan7;
	TPanel *Panel28;
	TPanel *Panel29;
	TPanel *Panel30;
	TPanel *pan_show8;
	TEdit *edtNum8;
	TEdit *edit_vid8;
	TEdit *edit_pid8;
	TEdit *edit_rev8;
	TButton *btnDeleteItem8;
	TPanel *pan9;
	TPanel *Panel41;
	TPanel *Panel42;
	TPanel *Panel43;
	TPanel *pan_show9;
	TEdit *edtNum9;
	TEdit *edit_vid9;
	TEdit *edit_pid9;
	TEdit *edit_rev9;
	TButton *btnDeleteItem9;
	TPanel *pl_DevData;
	TPanel *Panel1;
	TPanel *pl_main;
	TPanel *Panel3;
	TPanel *DEVICE01;
	TPanel *DEVICE03;
	TPanel *DEVICE05;
	TPanel *DEVICE07;
	TPanel *Panel4;
	TPanel *DEVICE16;
	TPanel *DEVICE14;
	TPanel *DEVICE12;
	TPanel *DEVICE10;
	TPanel *plUSBInfo;
	TBitBtn *btnFindDevice;
	TPanel *plAutoRemoveUSBDisk;
	TPanel *Panel7;
	TEdit *edtAutoRemoveNum;
	TEdit *edtTimeoutRemove;
	TPanel *Panel8;
	TPanel *Panel10;
	TCheckBox *ckbAutoRemoveTime;
	TButton *btnRemoveUSBDisk;
	TPanel *pl_Memo_Switch;
	TEdit *edtType1;
	TPanel *Panel23;
	TEdit *edtType2;
	TPanel *Panel34;
	TEdit *edtType3;
	TPanel *Panel35;
	TEdit *edtType4;
	TPanel *Panel39;
	TEdit *edtType5;
	TPanel *Panel40;
	TEdit *edtType6;
	TPanel *Panel44;
	TEdit *edtType7;
	TPanel *Panel45;
	TEdit *edtType8;
	TPanel *Panel49;
	TEdit *edtType9;
	TPanel *Panel6;
	TEdit *edtType10;
	TPanel *Panel50;
	TPanel *plHUB;
	TPanel *plUSB;
	TPanel *plMoDisk;
	TPanel *Panel5;
	TImage *imgLogo;
	TPanel *DEVICE02;
	TPanel *DEVICE09;
	TPanel *DEVICE04;
	TPanel *DEVICE11;
	TPanel *DEVICE13;
	TPanel *DEVICE06;
	TPanel *DEVICE08;
	TPanel *DEVICE15;
	TPanel *Panel22;
	TListBox *LBoxHUB;
	TListBox *LBoxUSB;
	TListBox *LBoxDisk;
	TTouchKeyboard *TouchKeyboard;
	TPanel *plGLPDView;
	TPanel *plGLPDResult;
	TEdit *edtGLPDVersion;
	TPanel *Panel52;
	TButton *btnDeleteItem99;
	TPanel *pan11;
	TPanel *Panel51;
	TPanel *Panel53;
	TPanel *Panel54;
	TPanel *pan_show11;
	TEdit *edtNum11;
	TEdit *edit_vid11;
	TEdit *edit_pid11;
	TEdit *edit_rev11;
	TButton *btnDeleteItem11;
	TEdit *edtType11;
	TPanel *Panel56;
	TPanel *pan12;
	TPanel *Panel55;
	TPanel *Panel57;
	TPanel *Panel58;
	TPanel *pan_show12;
	TEdit *edtNum12;
	TEdit *edit_vid12;
	TEdit *edit_pid12;
	TEdit *edit_rev12;
	TButton *btnDeleteItem12;
	TEdit *edtType12;
	TPanel *Panel60;
	TPanel *pan13;
	TPanel *Panel62;
	TPanel *Panel63;
	TPanel *Panel64;
	TPanel *pan_show13;
	TEdit *edtNum13;
	TEdit *edit_vid13;
	TEdit *edit_pid13;
	TEdit *edit_rev13;
	TButton *btnDeleteItem13;
	TEdit *edtType13;
	TPanel *Panel66;
	TPanel *pan14;
	TPanel *Panel68;
	TPanel *Panel69;
	TPanel *Panel70;
	TPanel *pan_show14;
	TEdit *edtNum14;
	TEdit *edit_vid14;
	TEdit *edit_pid14;
	TEdit *edit_rev14;
	TButton *btnDeleteItem14;
	TEdit *edtType14;
	TPanel *Panel72;
	TPanel *pan15;
	TPanel *Panel74;
	TPanel *Panel75;
	TPanel *Panel76;
	TPanel *pan_show15;
	TEdit *edtNum15;
	TEdit *edit_vid15;
	TEdit *edit_pid15;
	TEdit *edit_rev15;
	TButton *btnDeleteItem15;
	TEdit *edtType15;
	TPanel *Panel78;
	void __fastcall CheckDISKClick(TObject *Sender);
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall btnRemoveUSBDiskClick(TObject *Sender);
	void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
	void __fastcall btnSetClick(TObject *Sender);
	void __fastcall btn_addClick(TObject *Sender);
	void __fastcall FormResize(TObject *Sender);
	void __fastcall btnFindDeviceClick(TObject *Sender);
	void __fastcall TimerMainTimer(TObject *Sender);
	void __fastcall ckbAutoRemoveTimeClick(TObject *Sender);
	void __fastcall edit_vid1Change(TObject *Sender);
	void __fastcall edtNum1Change(TObject *Sender);
	void __fastcall edtNum1Exit(TObject *Sender);
	void __fastcall pl_Memo_SwitchClick(TObject *Sender);
	void __fastcall btnLoadDUTClick(TObject *Sender);
	void __fastcall edit_vid1Exit(TObject *Sender);
	void __fastcall btnDeleteItem1Click(TObject *Sender);
	void __fastcall N1Click(TObject *Sender);
	void __fastcall EnumUSB();
	void __fastcall EnumHUB();
	void __fastcall edtPassWordKeyDown(TObject *Sender, WORD &Key, TShiftState Shift);
	void __fastcall edtPassWordEnter(TObject *Sender);
	void __fastcall LBoxHUBExit(TObject *Sender);
	void __fastcall imgLogoDblClick(TObject *Sender);


private:	// User declarations
	 //
	 TWndMethod OldFormWndProc;
	 void __fastcall FormWndProc(TMessage& Message);
	 //
	 int DeviceI;
	 DWORD VPIDTimeOut;
	 bool bSaveLocalDevInfo;
	 AnsiString deviceinfo[15];
	 TStringList *TListInitUSB_Dev
		, *TListFlash_Disk
		, *UnRemoveDev
		, *TListHUB_Dev,*TListUSB_Dev;
	 //
	 int   CheckDISKVolumelabel(char Disk);
	 bool  CheckVPIDSET(TEdit * edt);
	 bool  CheckTestNum(TEdit * edt);
	 bool  CheckDevIsUSB(AnsiString PVID);
	 bool  DeviceRemove(AnsiString PVID);
	 void  CheckDevVPID(int flag);
	 void  saveinfo();
	 void  SaveINIFile();
	 void  Read_INI_File();
	 void  SynchronizeUSB();
	 char  DiskWriteRead(char Disk);
	 char* lan_find_inf(char *pData, char *pname);
	 void  CheckDiskName();
	 void  RegDriver(AnsiString DevVPID);
	 void  LocalWriteSettingLOG(bool bInit);
	 void  LocalWriteTestingLOG();
	 AnsiString  GetUSBChildPath(AnsiString Path);
	 DWORD FindDiskUSBType3(char Disk);
	 AnsiString getUSB_Rev(AnsiString DEV_PATH);
	 AnsiString Findfilemsg(AnsiString filename, AnsiString findmsg,int rownum);


	//紀錄Card測試項
	struct USB_RW_info
	{
	   AnsiString DISKName;
	   char DISKVolumelabel;
	   TPanel *zDeviceTable;
	};
	struct USB_RW_info usb_rw_info[16];

public:		// User declarations
	__fastcall TMForm(TComponent* Owner);
	DeviceNotification g_DeviceNogification;
	AnsiString CheckDevIsDuplicate(bool bHub,AnsiString DevPath);
	AnsiString gStrTestLogPath;

};
//---------------------------------------------------------------------------
extern PACKAGE TMForm *MForm;
//---------------------------------------------------------------------------
#endif
