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
#include <fstream>
#include <iostream>
#include <string>
#include "DeviceNotify.h"
using namespace std;

const char GUID_USB_HUB[] = "{F18A0E88-C30C-11D0-8815-00A0C906BED8}";
const char GUID_USB_DEVICE[] = "{A5DCBF10-6530-11D2-901F-00C04FB951ED}";
const char GUID_USBSTOR[] = "{53F5630D-B6BF-11D0-94F2-00A0C91EFB8B}";
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
	TButton *btn_hubinfo;
	TButton *btn_usbinfo;
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
	TMaskEdit *edit_pid6;
	TMaskEdit *edit_vid6;
	TMaskEdit *edit_rev6;
	TMaskEdit *edit_rev2;
	TMaskEdit *edit_pid2;
	TMaskEdit *edit_vid2;
	TMemo *moDisk;
	TCheckBox *chb_compar;
	TCheckBox *chb_usb;
	TCheckBox *chb_disk;
	TPanel *pan5;
	TPanel *Panel19;
	TPanel *Panel20;
	TPanel *Panel21;
	TPanel *pan_show5;
	TMaskEdit *edit_pid5;
	TMaskEdit *edit_vid5;
	TMaskEdit *edit_rev5;
	TPanel *pan4;
	TPanel *Panel25;
	TPanel *Panel26;
	TPanel *Panel27;
	TPanel *pan_show4;
	TMaskEdit *edit_pid4;
	TMaskEdit *edit_vid4;
	TMaskEdit *edit_rev4;
	TPanel *pan1;
	TPanel *Panel11;
	TPanel *Panel18;
	TPanel *Panel24;
	TPanel *pan_show1;
	TMaskEdit *edit_rev1;
	TMaskEdit *edit_pid1;
	TMaskEdit *edit_vid1;
	TButton *btn_add;
	TButton *btn_cut;
	TPanel *pan3;
	TPanel *Panel31;
	TPanel *Panel32;
	TPanel *Panel33;
	TPanel *pan_show3;
	TMaskEdit *edit_pid3;
	TMaskEdit *edit_vid3;
	TMaskEdit *edit_rev3;
	TBitBtn *btnFindDevice;
	TTimer *Timer1;
	void __fastcall CheckDISKClick(TObject *Sender);
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall RemoveusbClick(TObject *Sender);
	void __fastcall btn_hubinfoClick(TObject *Sender);
	void __fastcall btn_usbinfoClick(TObject *Sender);
	void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
	void __fastcall btn_setClick(TObject *Sender);
	void __fastcall chb_comparClick(TObject *Sender);
	void __fastcall chb_usbClick(TObject *Sender);
	void __fastcall chb_diskClick(TObject *Sender);
	void __fastcall btn_addClick(TObject *Sender);
	void __fastcall btn_cutClick(TObject *Sender);
	void __fastcall FormResize(TObject *Sender);
	void __fastcall btnFindDeviceClick(TObject *Sender);
	void __fastcall Timer1Timer(TObject *Sender);

private:	// User declarations
	 TWndMethod OldFormWndProc;
	 bool UnRemove_Now;
	 void __fastcall FormWndProc(TMessage& Message);
	 char __fastcall TMForm::DiskWriteRead(char Disk);
	 int __fastcall TMForm::CheckDISKVolumelabel(char Disk);
	 bool __fastcall TMForm::DeviceRemove(AnsiString PVID);
	 AnsiString __fastcall DosCommand(AnsiString sCmdline);
	 char* lan_find_inf(char *pData, char *pname);
	 void __fastcall saveinfo();
	 void __fastcall saveset();
	 void __fastcall loadset();
	 AnsiString Findfilemsg(AnsiString filename, AnsiString findmsg,
	int rownum);
	 bool savelocalinfo;
	 bool SetMode;
	 TStringList *hublist, *usblist, *devicelist, *UnRemoveDev;

	 AnsiString deviceinfo1, deviceinfo2, deviceinfo3, deviceinfo4, deviceinfo5, deviceinfo6;
	//����Card���ն�
	struct USB_RW_info
   {
	   AnsiString DISKName;
	   char DISKVolumelabel;
	   TPanel *zDeviceTable;
   };
	struct USB_RW_info usb_rw_info[16];

public:		// User declarations
	__fastcall TMForm(TComponent* Owner);
	TPanel *USBDevice[6];
	int DeviceI;
	int myformH;
	DeviceNotification g_DeviceNogification;

};
//---------------------------------------------------------------------------
extern PACKAGE TMForm *MForm;
//---------------------------------------------------------------------------
#endif
