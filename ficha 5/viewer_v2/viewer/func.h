// MPCP: subrotinas de tratamento de imagns
// sub-rotinas em C++
void cfunc1(unsigned char *pixels, long largura, long altura);
void cfunc2(unsigned char *pixels, long largura, long altura);
void cfunc3(unsigned char *pixels, long largura, long altura);

// sub-rotinas em assembly
extern "C" {
void afunc1(unsigned char *pixels, long largura, long altura);
void afunc2(unsigned char *pixels, long largura, long altura);
void afunc3(unsigned char *pixels, long largura, long altura);
void afunc4(unsigned char *pixels, long largura, long altura);
void afunc5(unsigned char *pixels, long largura, long altura);
}

// Informação comum a todas as funções
#define BYTES_PER_PIXEL 4