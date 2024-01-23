#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>
#include <errno.h>

void mostrarProcesos(int opcion) {
  int cantidad;

  printf("Ingresa la cantidad de veces que quieres ejecutar fork (no más");
  printf(" de 4): ");
  scanf("%d", &cantidad);


  if (cantidad > 4) {
    printf("Por favor, no ejecutar más de 4 forks para evitar confusiones.\n");
    exit(EXIT_FAILURE);
  }

  for (int i = 0; i < cantidad; i++) {
    pid_t pid = fork();

    if (pid == -1) {
     perror("Error en fork");
      exit(EXIT_FAILURE);
    } else if (pid == 0) {
      if (opcion == 1 || opcion == 3) {
        printf("Proceso hijo creado. PID: %d\n", getpid());
      }
      exit(EXIT_SUCCESS);
    } else {
      if (opcion == 2 || opcion == 3) {
        printf("Proceso padre. PID hijo: %d\n", pid);
      }
    }
  }

}


int main() {
  int opcion;

  printf("Selecciona una opción:\n");
  printf("1. Mostrar solo procesos hijos\n");
  printf("2. Mostrar solo procesos padres\n");
  printf("3. Mostrar ambos (Padres e Hijos)\n");

  scanf("%d", &opcion);

  switch (opcion) {
    case 1:
    case 2:
    case 3:
      mostrarProcesos(opcion);
      break;
    default:
      printf("Opción no válida. Debes seleccionar 1, 2 o 3.\n");
      break;
  } 

  return 0;
}

