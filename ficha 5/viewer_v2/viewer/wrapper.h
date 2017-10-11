#ifndef _WRAPPER_H_
#define _WRAPPER_H_
#include <windows.h>
#include <wincodec.h>
#include <windowsx.h>
#include <commdlg.h>
#include "Viewer.h"
void wrapper(FUNC_PTR theFunction, void* bits, long largura, long altura);
#endif