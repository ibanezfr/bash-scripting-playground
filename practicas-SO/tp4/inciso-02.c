#include <stdio.h>
#include <stdlib.h>

int main() {
  int vector[10];
  int i, j;

  for (i = 0; i < 10; i++) {
     printf("Ingrese número %d > ", i + 1);
     scanf("%d", &vector[i]);
  }

  for ( i = 0; i < 9; i++) {
    for ( j = i + 1; j <= 9; j++) {
      int aux;
      if(vector[i] > vector[j]) {
        aux = vector[i];
        vector[i] = vector[j];
        vector[j] = aux;
      }
    }
  }

  for (i = 0; i < 10; i++) {
     if ( i == 0) {
       printf("\n[ ");
     }
     if ( i == 9) {
       printf("%d ]\n\n", vector[i]);
     }
     else {
     printf("%d, ", vector[i]);
     }
  }

  exit(0);
}

