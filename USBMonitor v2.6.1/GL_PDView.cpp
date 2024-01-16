//---------------------------------------------------------------------------


#pragma hdrstop

#include "GL_PDView.h"

//---------------------------------------------------------------------------

#pragma package(smart_init)
AnsiString DosCommand(AnsiString sCmdline,DWORD dwTimeout);
AnsiString CheckVersionFile(AnsiString astrMsgCMD);
AnsiString astrResult;
bool       bThreadEnd;
DWORD 	   gDWTimeOut;
GL_PDView::GL_PDView()
{
	handleThread = NULL;
}
AnsiString GL_PDView::GetGLPDVersion(DWORD dwTimeOut)
{
	astrResult = "";
	bThreadEnd = false;
	gDWTimeOut = dwTimeOut;
	if(handleThread == NULL)
		handleThread = CreateThread(0, 1024, ThreadExecute, NULL, 0,NULL);
	while(!bThreadEnd)
		Application->ProcessMessages();
	handleThread = NULL;
	return astrResult;
}
DWORD WINAPI ThreadExecute(LPVOID Param)
{
	AnsiString astrMsgCMD   = "";
	DWORD dwTimeOut;
	DWORD dwStep = STEP_CHECK_DEV_ONLINE;
	while(true)
	{
		switch(dwStep)
		{
			case STEP_CHECK_DEV_ONLINE:
				dwStep = STEP_CHECK_VERSION;
				if(dwStep == STEP_CHECK_VERSION)
				{
					dwTimeOut = GetTickCount()+gDWTimeOut;
				}
				break;
			case STEP_CHECK_VERSION:
				astrMsgCMD = DosCommand("GL_FW_Version.exe -pd",1000);
				dwStep = STEP_READ_VERSION;
				break;
			case STEP_READ_VERSION:
				astrResult = CheckVersionFile(astrMsgCMD);
				if(astrResult == "")
				{
					if(GetTickCount() < dwTimeOut)
						dwStep = STEP_CHECK_VERSION;
					else
					{
						bThreadEnd = true;
						return 1;
                    }
				}
				else
				{
					bThreadEnd = true;
					return 1;
				}
				break;
		}
	}
	return 1;
}
AnsiString CheckVersionFile(AnsiString astrMsgCMD)
{
	AnsiString PDVer = "";
	if(astrMsgCMD.Pos("PD"))
	{
		PDVer = astrMsgCMD.Delete(1,astrMsgCMD.Pos(":")).Trim();
		PDVer = PDVer.SubString(1,PDVer.Pos("-")-1);
	}
	return PDVer.Trim();
}

AnsiString DosCommand(AnsiString sCmdline,DWORD dwTimeout)
{
	PROCESS_INFORMATION proc = {0}; //關於進程資訊的一個結構
	long ret;
	bool sPipe;
	STARTUPINFOA start = {0};
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
	sPipe=::CreatePipe(&hReadPipe, &hWritePipe,&sa, 0); //創建管道
	if (!sPipe)
	{
	sOutput="CreatePipe failed. Error: "+AnsiString(GetLastError());
	//memoMsg->Lines->Add("CreatePipe failed. Error: "+AnsiString(GetLastError()));
	return sOutput;
	}
	start.cb = sizeof(STARTUPINFOA);
	start.dwFlags = STARTF_USESTDHANDLES | STARTF_USESHOWWINDOW;
	start.hStdOutput = hWritePipe;
	start.hStdError = hWritePipe;
	start.wShowWindow = SW_HIDE;
	sBuffer = sCmdline;
	ret =::CreateProcessA(0, sBuffer.c_str(), &sa, &sa, TRUE, NORMAL_PRIORITY_CLASS, 0, 0, &start, &proc);
	if (ret == 0)
	{
	sOutput="Bad command or filename";
	//memoMsg->Lines->Add("Bad command or filename");
	return sOutput;
	}
	::CloseHandle(hWritePipe);
	DWORD dw = WaitForSingleObject(proc.hProcess, dwTimeout);
	if(dw == WAIT_TIMEOUT)
	{
		::CloseHandle(proc.hProcess);
		::CloseHandle(proc.hThread);
		::CloseHandle(hReadPipe);
		return "";
	}
	do
	{
	memset(cBuffer,'\0',sizeof(cBuffer));
	ret = ::ReadFile(hReadPipe, &cBuffer, 255, &lngBytesRead, 0);
	//替換字串
	for(unsigned long i=0; i< lngBytesRead; i++){
		if(cBuffer[i] == '\0'){
			cBuffer[i] = ' ';
		}else if(cBuffer[i] == '\n'){
			cBuffer[i] = ' ';
		}
	}
	sBuffer=StrPas(cBuffer);
	sOutput = sOutput+sBuffer;
	Application->ProcessMessages();

	} while (ret != 0 );
	::CloseHandle(proc.hProcess);
	::CloseHandle(proc.hThread);
	::CloseHandle(hReadPipe);
	return sOutput;
}