// MPCP: função 1 para tratamento de imagens
// 
#include "func.h"
#include <windows.h>
#include <wincodec.h>
#include <windowsx.h>
#include <commdlg.h>
#include <stdio.h>

// Cada pixel ocupa 4 bytes: (MSB) Transparência | Vermelho | Verde | Azul  (LSB)
// Cada componente é representado por número sem sinal (unsigned char)
// Valor mínimo: 0; Valor máximo: 255

typedef unsigned int media_t;
//typedef unsigned char media_t;

// Conversão para níveis de cinzento
// Cada componente RGB é tornada igual à média das comopnentes
void cfunc1(unsigned char *pixels, long largura, long altura)
{
	unsigned char *linha;
	
	for (int j = 0; j < altura; j++) {
		linha = pixels + (j*largura*BYTES_PER_PIXEL);
		for (int i = 0; i < largura*BYTES_PER_PIXEL; i += BYTES_PER_PIXEL) {
			media_t media;					// calcular média; não usar variáveis "unsigned char"
											// para evitar overflow!
			media = (media_t) linha[i] + (media_t) linha[i+1] + (media_t) linha[i+2];
			media = media / 3;
			linha[i] = (unsigned char) media;		// Azul (B)
			linha[i+1] = (unsigned char) media;     // Verde (G)
			linha[i+2] = (unsigned char) media;		// Vermelho (R)
			linha[i+3] = 255;					    // transparência
		}
	}
	// MessageBox(NULL, L"Função 1 invocada!", L"Função 1", MB_ICONEXCLAMATION | MB_OK);
	return;
}

/* 
			linha[i] = 0;		// Azul (B)
			linha[i+1] = 0;     // Verde (G)
			linha[i+2] = 255;   // Vermelho (R)
			linha[i+3] = 0;		// transparência
*/