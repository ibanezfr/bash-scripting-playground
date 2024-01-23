#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main() {
  int guess, actual_pid, attempts = 0;

  actual_pid = getpid();

  printf("¡Hola! Estoy pensando en un PID. ¿Puedes adivinar cuál es?\n");

  do {
    printf("Ingresa tu suposición > \n");
    scanf("%d",&guess);

    if (guess < actual_pid) {
      printf("¡Más alto!\n");
    } else if (guess > actual_pid) {
      printf("¡Más bajo!\n");
    }

    attempts++;
  } while (guess != actual_pid);

  printf("\n¡Correcto! Has adivinado el PID. Se realizaron %d intentos.\n",
         attempts);
  printf("El PID del script actual es: %d\n", actual_pid);

  return 0;
}

