#include <stdio.h>
#include <stdlib.h>


void imprimir(int V[10]);
void ordenar(int V[10]);

int main() {
  int vector[10];
  int i;

  for (i = 0; i < 10; i++) {
     printf("Ingrese número %d > ", i + 1);
     scanf("%d", &vector[i]);
  }

  imprimir(vector);

  ordenar(vector);

  imprimir(vector);

  exit(0);
}

void ordenar(int V[10]) {
  int i,j;

  for ( i = 0; i < 9; i++) {
      for ( j = i + 1; j <= 9; j++) {
        int aux;
        if(V[i] > V[j]) {
          aux = V[i];
          V[i] = V[j];
          V[j] = aux;
        }
      }
    }
}


void imprimir(int V[10]) {
  int i;

  for (i = 0; i < 10; i++) {
     if ( i == 0) {
       printf("\n[ ");
     }
     if ( i == 9) {
       printf("%d ]\n\n", V[i]);
     }
     else {
     printf("%d, ", V[i]);
     }
  }
}

