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
#include <fstream>
#include <iostream>
#include <string>
#include "DeviceNotify.h"
#include <Registry.hpp>

const char GUID_USB_HUB[] = "{F18A0E88-C30C-11D0-8815-00A0C906BED8}";
const char GUID_USB_DEVICE[] = "{A5DCBF10-6530-11D2-901F-00C04FB951ED}";
const char GUID_USBSTOR[] = "{53F5630D-B6BF-11D0-94F2-00A0C91EFB8B}";
#define BUFFER_SIZE 1024*1024	//設定每次測試的檔案大小 1M
//---------------------------------------------------------------------------
class TMForm : public TForm
{
__published:	// IDE-managed Components
	TMemo *moHUB;
	TPanel *Panel1;
	TPanel *Panel2;
	TButton *Removeusb;
	TButton *CheckDISK;
	TPanel *Panel3;
	TPanel *DEVICE01;
	TPanel *DEVICE02;
	TPanel *DEVICE03;
	TPanel *DEVICE04;
	TPanel *DEVICE05;
	TPanel *DEVICE06;
	TPanel *DEVICE07;
	TPanel *DEVICE08;
	TPanel *Panel4;
	TPanel *DEVICE16;
	TPanel *DEVICE15;
	TPanel *DEVICE14;
	TPanel *DEVICE13;
	TPanel *DEVICE12;
	TPanel *DEVICE11;
	TPanel *DEVICE10;
	TPanel *DEVICE09;
	TPanel *Panel5;
	TMemo *moUSB;
	TPanel *pan6;
	TPanel *pan2;
	TPanel *Panel9;
	TEdit *edit_password;
	TButton *btn_set;
	TPanel *Panel12;
	TPanel *Panel13;
	TPanel *Panel14;
	TPanel *Panel15;
	TPanel *Panel16;
	TPanel *Panel17;
	TPanel *pan_show2;
	TPanel *pan_show6;
	TMemo *moDisk;
	TCheckBox *chb_compar;
	TCheckBox *chb_usb;
	TCheckBox *chb_disk;
	TPanel *pan5;
	TPanel *Panel19;
	TPanel *Panel20;
	TPanel *Panel21;
	TPanel *pan_show5;
	TPanel *pan4;
	TPanel *Panel25;
	TPanel *Panel26;
	TPanel *Panel27;
	TPanel *pan_show4;
	TPanel *pan1;
	TPanel *Panel11;
	TPanel *Panel18;
	TPanel *Panel24;
	TPanel *pan_show1;
	TButton *btn_add;
	TPanel *pan3;
	TPanel *Panel31;
	TPanel *Panel32;
	TPanel *Panel33;
	TPanel *pan_show3;
	TBitBtn *btnFindDevice;
	TTimer *Timer1;
	TPanel *Panel6;
	TPanel *Panel7;
	TEdit *edtAutoRemoveNum;
	TCheckBox *ckbAutoRemoveTime;
	TEdit *edtTimeoutRemove;
	TPanel *Panel8;
	TPanel *Panel10;
	TEdit *edtNum1;
	TEdit *edit_vid1;
	TEdit *edit_pid1;
	TEdit *edit_rev1;
	TEdit *edit_vid2;
	TEdit *edit_pid2;
	TEdit *edit_rev2;
	TEdit *edtNum2;
	TEdit *edtNum3;
	TEdit *edtNum4;
	TEdit *edtNum5;
	TEdit *edtNum6;
	TEdit *edit_vid3;
	TEdit *edit_vid4;
	TEdit *edit_vid5;
	TEdit *edit_vid6;
	TEdit *edit_pid3;
	TEdit *edit_pid4;
	TEdit *edit_pid5;
	TEdit *edit_pid6;
	TEdit *edit_rev3;
	TEdit *edit_rev4;
	TEdit *edit_rev5;
	TEdit *edit_rev6;
	TPanel *pl_Memo_Switch;
	TPanel *pl_DevData;
	TPanel *pl_main;
	TButton *btnLoadDUT;
	TPanel *Panel22;
	TButton *btnDeleteItem1;
	TButton *btnDeleteItem2;
	TButton *btnDeleteItem3;
	TButton *btnDeleteItem4;
	TButton *btnDeleteItem5;
	TButton *btnDeleteItem6;
	void __fastcall CheckDISKClick(TObject *Sender);
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall RemoveusbClick(TObject *Sender);
	void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
	void __fastcall btn_setClick(TObject *Sender);
	void __fastcall chb_comparClick(TObject *Sender);
	void __fastcall chb_usbClick(TObject *Sender);
	void __fastcall chb_diskClick(TObject *Sender);
	void __fastcall btn_addClick(TObject *Sender);
	void __fastcall FormResize(TObject *Sender);
	void __fastcall btnFindDeviceClick(TObject *Sender);
	void __fastcall Timer1Timer(TObject *Sender);
	void __fastcall ckbAutoRemoveTimeClick(TObject *Sender);
	void __fastcall edit_vid1Change(TObject *Sender);
	void __fastcall edtNum1Change(TObject *Sender);
	void __fastcall edtNum1Exit(TObject *Sender);
	void __fastcall pl_Memo_SwitchClick(TObject *Sender);
	void __fastcall btnLoadDUTClick(TObject *Sender);
	void __fastcall edit_vid1Exit(TObject *Sender);
	void __fastcall btnDeleteItem1Click(TObject *Sender);

private:	// User declarations
	 //
	 TWndMethod OldFormWndProc;
	 void __fastcall FormWndProc(TMessage& Message);
	 //
	 int DeviceI;
	 int VPIDTimeOut;
	 bool UnRemove_Now;
	 bool savelocalinfo;
	 AnsiString deviceinfo1, deviceinfo2, deviceinfo3, deviceinfo4, deviceinfo5, deviceinfo6;
	 TStringList *usblist, *devicelist, *UnRemoveDev;
	 //
	 int  CheckDISKVolumelabel(char Disk);
	 bool  CheckVPIDSET(TEdit * edt);
	 bool  CheckTestNum(TEdit * edt);
	 bool  CheckDevIsUSB(AnsiString PVID);
	 bool  DeviceRemove(AnsiString PVID);
	 void  CheckDevVPID(int flag);
	 void  saveinfo();
	 void  saveset();
	 void  loadset();
	 char  DiskWriteRead(char Disk);
	 char* lan_find_inf(char *pData, char *pname);

	 AnsiString DosCommand(AnsiString sCmdline);
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

};
//---------------------------------------------------------------------------
extern PACKAGE TMForm *MForm;
//---------------------------------------------------------------------------
#endif
