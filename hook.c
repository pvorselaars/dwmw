#include <Windows.h>

HWND dwmw;

__declspec(dllexport) LRESULT CALLBACK hookProc (int code, WPARAM wparam, LPARAM lparam)
{
	if (!dwmw) {
		dwmw = FindWindowW(L"dwmw", NULL);
	}

	if (code == HCBT_CREATEWND) {
		SendNotifyMessageW(dwmw, HCBT_CREATEWND, wparam, lparam);
	}

	return CallNextHookEx(NULL, code, wparam, lparam);
}
