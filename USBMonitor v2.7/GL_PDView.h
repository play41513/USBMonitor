//---------------------------------------------------------------------------

#ifndef GL_PDViewH
#define GL_PDViewH
#include <vcl.h>

#define STEP_CHECK_DEV_ONLINE 	1
#define STEP_CHECK_VERSION 		2
#define STEP_READ_VERSION 		3
//---------------------------------------------------------------------------
class GL_PDView
{
public:
	GL_PDView::GL_PDView();
	AnsiString GetGLPDVersion(DWORD dwTimeOut);
private:
	HANDLE handleThread;
};
extern DWORD WINAPI ThreadExecute(LPVOID Param);
#endif
