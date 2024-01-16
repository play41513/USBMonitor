# USBMonitor
 USB device identification verification and read/write test.

## Program

### USBMontior v3.1
- Notices :Copyright(c) 2018 Leno
- Compiler :Embarcadero RAD Studio 2010 Version 14.0.3615.26342
- OS :Windows 8 ver6.3 Build 9600
- Desc :
	- USB identification code matching field: USB Type can be left blank.

### USBMontior v3.0
- Notices :Copyright(c) 2018 Leno
- Compiler :Embarcadero RAD Studio 2010 Version 14.0.3615.26342
- OS :Windows 8 ver6.3 Build 9600
- Desc :
	- Added PD version information to the LOG.
	- Added trigger condition for PD Tool: Reading the specified USB identification code.

### USBMontior v2.9
- Notices :Copyright(c) 2018 Leno
- Compiler :Embarcadero RAD Studio 2010 Version 14.0.3615.26342
- OS :Windows 8 ver6.3 Build 9600
- Desc :
	- Modify the version information obtained by PD Tool to remove spaces and newline characters.
	- No longer read PD version after PASS; FAILED will have three additional attempts to read.

### USBMontior v2.8
- Notices :Copyright(c) 2022 Leno
- Compiler :Embarcadero RAD Studio 2010 Version 14.0.3615.26342
- OS :Windows 8 ver6.3 Build 9600
- Desc :
	- Generate LOG information for FAILED cases.

### USBMontior v2.7
- Notices :Copyright(c) 2021 Leno
- Compiler :Embarcadero RAD Studio 2010 Version 14.0.3615.26342
- OS :Windows 8 ver6.3 Build 9600
- Desc :
	- Increased the number of fields for USB identification code matching from 10 to 15.

### USBMontior v2.6.1
- Notices :Copyright(c) 2022 Leno
- Compiler :Embarcadero RAD Studio 2010 Version 14.0.3615.26342
- OS :Windows 8 ver6.3 Build 9600
- Desc :
	- Canceled the color distinction for USB2 and USB3 in the USB read/write functionality, all displayed as green.

### USBMontior v2.6
- Notices :Copyright(c) 2022 Leno
- Compiler :Embarcadero RAD Studio 2010 Version 14.0.3615.26342
- OS :Windows 8 ver6.3 Build 9600
- Desc :
	- VPID matching function: Modified to allow deletion of version numbers for comparison (only compares VID and PID).

### USBMontior v2.5
- Notices :Copyright(c) 2021 Leno
- Compiler :Embarcadero RAD Studio 2010 Version 14.0.3615.26342
- OS :Windows 8 ver6.3 Build 9600
- Desc :
	- Resolved the issue of some flash drives being unable to determine USB speed.
	- Added functionality to fetch PD version.

### USBMontior v2.4
- Notices :Copyright(c) 2020 Leno
- Compiler :Embarcadero RAD Studio 2010 Version 14.0.3615.26342
- OS :Windows 8 ver6.3 Build 9600
- Desc :
	- Improved program memory usage.
	- Added LOG recording functionality.

### USBMontior v2.3
- Notices :Copyright(c) 2020 Leno
- Compiler :Embarcadero RAD Studio 2010 Version 14.0.3615.26342
- OS :Windows 8 ver6.3 Build 9600
- Desc :
	- Added USB-Type detection (USB2, USB3, GEN2).
	- Flash drive read/write determines U2, U3 (U2 shows blue for successful read/write, U3 shows green).
	- UI modifications.

### USBMontior v2.2.2-6
- Notices :Copyright(c) 2019 Leno
- Compiler :Embarcadero RAD Studio 2010 Version 14.0.3615.26342
- OS :Windows 8 ver6.3 Build 9600
- Desc :
	- VID&PID, REV matching fields can input ";" (for DS-UCC5).

### USBMontior v2.2.2-5
- Notices :Copyright(c) 2019 Leno
- Compiler :Embarcadero RAD Studio 2010 Version 14.0.3615.26342
- OS :Windows 8 ver6.3 Build 9600
- Desc :
	- Added initial device path code recognition.

### USBMontior v2.2.2-4
- Notices :Copyright(c) 2018 Leno
- Compiler :Embarcadero RAD Studio 2010 Version 14.0.3615.26342
- OS :Windows 8 ver6.3 Build 9600
- Desc :
	- Changed flash drive read/write capacity to 1MB to reduce load.

### USBMontior v2.2.2-3
- Notices :Copyright(c) 2018 Leno
- Compiler :Embarcadero RAD Studio 2010 Version 14.0.3615.26342
- OS :Windows 8 ver6.3 Build 9600
- Desc :
	- Removed the method of using devcon to fetch device information, changed to using a mixture of SetupDiGetClassDevs and Regedit.
	- Removed memory space occupied by flash drive read/write buffer.

### USBMontior v2.2.2-2
- Notices :Copyright(c) 2018 Leno
- Compiler :Embarcadero RAD Studio 2010 Version 14.0.3615.26342
- OS :Windows 8 ver6.3 Build 9600
- Desc :
	- Changed to use polling method to monitor USB mounting status (previous versions had issues with losing plugout messages).

### USBMontior v2.2.2-1
- Notices :Copyright(c) 2018 Leno
- Compiler :Embarcadero RAD Studio 2010 Version 14.0.3615.26342
- OS :Windows 8 ver6.3 Build 9600
- Desc :
	- Merged 32-bit and 64-bit programs.
	- Optimized display of identification codes and comparison methods to prevent screen flickering.
	- Real-time update of disk drive names.

### USBMontior v2.2.2
- Notices :Copyright(c) 2018 Leno
- Compiler :Embarcadero RAD Studio 2010 Version 14.0.3615.26342
- OS :Windows 8 ver6.3 Build 9600
- Desc :
	- Number of fields for VID&PID matching changed from 6 to 10.

### USBMontior v2.2.1
- Notices :Copyright(c) 2018 Leno
- Compiler :Embarcadero RAD Studio 2010 Version 14.0.3615.26342
- OS :Windows 8 ver6.3 Build 9600
- Desc :
	- Added feature: Match VID&PID fields.

### USBMontior v2.1.1
- Notices :Copyright(c) 2018 Leno
- Compiler :Embarcadero RAD Studio 2010 Version 14.0.3615.26342
- OS :Windows 8 ver6.3 Build 9600
- Desc :
	- Added automatic safe removal feature for flash drives.

### USBMontior v2.1.0
- Notices :Copyright(c) 2018 Leno
- Compiler :Embarcadero RAD Studio 2010 Version 14.0.3615.26342
- OS :Windows 8 ver6.3 Build 9600
- Desc :
	- USB device identification verification and read/write test.