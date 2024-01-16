//---------------------------------------------------------------------------
#include <StrUtils.hpp>
#include "winioctl.h"

#include "malloc.h"
//#include "cfgmgr32.h"
#include "vndrlist.h"
#include "stdio.h"
#include "SETUPAPI.H"
#include "usbioctl.h"
#ifndef USBDevConnectionInfoH
#define USBDevConnectionInfoH

#define USBTYPE_NOT_FIND_DEV		0
#define USBTYPE_HI_SPEED			1
#define USBTYPE_SUPER_SPEED			2
#define USBTYPE_SUPER_SPEED_PLUS	3
#define USBTYPE_LOW_SPEED_PLUS		4

#define IOCTL_USB_GET_NODE_CONNECTION_INFORMATION_EX_V2  \
								CTL_CODE(FILE_DEVICE_USB,  \
									USB_GET_NODE_CONNECTION_INFORMATION_EX_V2,  \
									METHOD_BUFFERED,  \
									FILE_ANY_ACCESS)
#define CTL_CODE( DeviceType, Function, Method, Access ) (                 \
    ((DeviceType) << 16) | ((Access) << 14) | ((Function) << 2) | (Method) \
)
#define FILE_DEVICE_USB         FILE_DEVICE_UNKNOWN
#define FILE_DEVICE_UNKNOWN             0x00000022
#define USB_GET_NODE_CONNECTION_INFORMATION_EX_V2   279
#define METHOD_BUFFERED                 0
#define FILE_ANY_ACCESS                 0

#define IOCTL_USB_GET_NODE_CONNECTION_INFORMATION_EX  \
                                CTL_CODE(FILE_DEVICE_USB,  \
								USB_GET_NODE_CONNECTION_INFORMATION_EX,  \
                                METHOD_BUFFERED,  \
								FILE_ANY_ACCESS)
#define USB_GET_NODE_CONNECTION_INFORMATION_EX      274

//---------------------------------------------------------------------------
class USBDevConnectionInfo
{
public:
	USBDevConnectionInfo::USBDevConnectionInfo(void);
	DWORD GetUSBType(AnsiString VID,AnsiString PID,AnsiString Path);
	DWORD GetUSBType(AnsiString USBInfo);
	bool RestartDev(AnsiString VID,AnsiString PID);
	bool DevNameGetVPID(AnsiString VID);
	AnsiString USBDevConnectionInfo::ReturnUSBData();
private:

	SECURITY_ATTRIBUTES     SA;         // Needed for Win2000
	TStringList *TListUSBDEV_CONN_INFO;
	//------------------------------------------------------------------------
	//USB Device Information Array
	struct _USB_Device_Information
	{
	  AnsiString deviceDesc;
	  AnsiString localInfo;
	  AnsiString DeviceID;
	  AnsiString devicePath;
	  AnsiString deviceSN;
	}USB_Device_Information;
	//------------------------------------------------------------

	//Define all stuctures using UCHAR or BOOLEAN so that
	//the variables are not 'aligned' by the compiler
	typedef struct _HUB_DESCRIPTOR
	{
	  UCHAR bDescriptorLength;
	  UCHAR bDescriptorType;
	  UCHAR bNumberOfPorts;
	  UCHAR wHubCharacteristics[2];
	  UCHAR bPowerOnToPowerGood;
	  UCHAR bHubControlCurrent;
	  UCHAR bRemoveAndPowerMask[64];
	}HUB_DESCRIPTOR, *PHUB_DESCRIPTOR;

	typedef struct _USBDEVICEINFO
	{
	  PUSB_NODE_INFORMATION               HubInfo;        // NULL if not a HUB
	  PCHAR                               HubName;        // NULL if not a HUB
	  PUSB_NODE_CONNECTION_INFORMATION    ConnectionInfo; // NULL if root HUB
	  PUSB_DESCRIPTOR_REQUEST             ConfigDesc;     // NULL if root HUB
	  //PSTRING_DESCRIPTOR_NODE             StringDescs;
	} USBDEVICEINFO, *PUSBDEVICEINFO;

	typedef struct _DEVICE_DESCRIPTOR
	{
	  UCHAR bLength;
	  UCHAR bDescriptorType;
	  UCHAR bcdUSB[2];
	  UCHAR bDeviceClass;
	  UCHAR bDeviceSubClass;
	  UCHAR bDeviceProtocol;
	  UCHAR bMaxPacketSize0;
	  UCHAR idVendor[2];
	  UCHAR idProduct[2];
	  UCHAR bcdDevice[2];
	  UCHAR iManufacturer;
	  UCHAR iProduct;
	  UCHAR iSerialNumber;
	  UCHAR bNumConfigurations;
	}DEVICE_DESCRIPTOR;

	typedef struct _NODE_INFORMATION
	{
	  USB_HUB_NODE                        NodeType;
	  HUB_DESCRIPTOR                      HubDescriptor;
	  BOOLEAN                             HubIsBusPowered;
	}NODE_INFORMATION, *PNODE_INFORMATION;

	typedef struct _NODE_CONNECTION_INFORMATION
	{
	  ULONG ConnectionIndex;
	  DEVICE_DESCRIPTOR DeviceDescriptor;
	  UCHAR CurrentConfigurationValue;
	  bool LowSpeed;
	  bool DeviceIsHub;
	  UCHAR DeviceAddress[2];
	  UCHAR NumberOfOpenPipes[4];
	  UCHAR ConnectionStatus[4];
	  USB_PIPE_INFO PipeList[32];
	}NODE_CONNECTION_INFORMATION;

	struct
	{
	  ULONG ConnectionIndex;
	  ULONG ActualLength;
	  WCHAR Name[256];
	}ConnectedHub;

	struct
	{
	  ULONG Length;
	  WCHAR Name[256];
	} UnicodeName;

	typedef struct _USB_NODE_CONNECTION_INFORMATION_EX {
		ULONG ConnectionIndex;  /* INPUT */
		/* usb device descriptor returned by this device
		   during enumeration */
		USB_DEVICE_DESCRIPTOR DeviceDescriptor;/* OUTPUT */
		UCHAR CurrentConfigurationValue;/* OUTPUT */
		/* values for the speed field are defined in USB200.h */
		UCHAR Speed;/* OUTPUT */
		BOOLEAN DeviceIsHub;/* OUTPUT */
		USHORT DeviceAddress;/* OUTPUT */
		ULONG NumberOfOpenPipes;/* OUTPUT */
		USB_CONNECTION_STATUS ConnectionStatus;/* OUTPUT */
		USB_PIPE_INFO PipeList[0];/* OUTPUT */
	} USB_NODE_CONNECTION_INFORMATION_EX, *PUSB_NODE_CONNECTION_INFORMATION_EX;
	typedef enum _USB_DEVICE_SPEED {
	  UsbLowSpeed,
	  UsbFullSpeed,
	  UsbHighSpeed,
	  UsbSuperSpeed
	} USB_DEVICE_SPEED;

	typedef union _USB_PROTOCOLS {
		ULONG  ul;

		struct {
			ULONG Usb110 :1;
			ULONG Usb200 :1;
			ULONG Usb300 :1;
			ULONG ReservedMBZ  :29;
		};

	} USB_PROTOCOLS, *PUSB_PROTOCOLS;
	typedef union _USB_NODE_CONNECTION_INFORMATION_EX_V2_FLAGS {
		ULONG  ul;

		struct {
			ULONG DeviceIsOperatingAtSuperSpeedOrHigher  :1;
			ULONG DeviceIsSuperSpeedCapableOrHigher  :1;
			ULONG DeviceIsOperatingAtSuperSpeedPlusOrHigher  :1;
			ULONG DeviceIsSuperSpeedPlusCapableOrHigher  :1;
			ULONG ReservedMBZ  :28;
		};

	} USB_NODE_CONNECTION_INFORMATION_EX_V2_FLAGS, *PUSB_NODE_CONNECTION_INFORMATION_EX_V2_FLAGS;
	typedef struct _USB_NODE_CONNECTION_INFORMATION_EX_V2 {
		// one based port number
		ULONG  ConnectionIndex;

		// length of the structure
		ULONG  Length;

		// On input a bitmask that indicates which USB protocols are understood by the caller
		// On output a bitmask that indicates which USB signaling protocols are supported by the port
		USB_PROTOCOLS SupportedUsbProtocols;

		// A bitmask indicating properties of the connected device or port
		USB_NODE_CONNECTION_INFORMATION_EX_V2_FLAGS Flags;
	} USB_NODE_CONNECTION_INFORMATION_EX_V2, *PUSB_NODE_CONNECTION_INFORMATION_EX_V2;

	DWORD EnumerateHostController(HANDLE HostControllerHandle,AnsiString Path);
	PCHAR WideStrToMultiStr (PWCHAR WideStr);
	PCHAR GetDriverKeyName (HANDLE Hub, ULONG ConnectionIndex);
	USHORT DisplayDeviceDescriptor (USHORT LanguageID, PUCHAR BufferPtr);
	AnsiString LookingString(AnsiString Sour, AnsiString Dest);
	void GetPortData(HANDLE HubHandle, UCHAR PortCount, int HubDepth,AnsiString Path);
	void DriverNameToDeviceDescInfo(PCHAR DriverName);
	void DisplayPipeInfo(ULONG NumPipes, USB_PIPE_INFO *PipeInfo);
	void DisplayEndpointDescriptor(PUSB_ENDPOINT_DESCRIPTOR EndpointDesc);
	bool ControlDevice(DWORD dwDevID, HDEVINFO hDevInfo);
	bool StateChange( DWORD dwNewState, DWORD dwDevID, HDEVINFO hDevInfo);
	bool CheckReltekName(AnsiString USBPath);
	AnsiString GetSpeed (HANDLE HubHandle,DWORD PortIndex);
};
#endif
