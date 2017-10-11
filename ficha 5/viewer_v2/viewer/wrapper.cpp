// MPCP: invoca função para tratar imagem
// Confirma que função está definida

#include "wrapper.h"
#include <time.h>
#include <wchar.h>

void wrapper(FUNC_PTR theFunction, void* bits, long largura, long altura)
{
	if (theFunction == NULL) {
		MessageBox(NULL, L"Função não-definida.", L"Erro", MB_ICONEXCLAMATION | MB_OK);
		return;
	}
	theFunction((unsigned char *)bits, largura, altura);
	return;
}