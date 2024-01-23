#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main() {
  pid_t pid;

  pid = fork();

  if (pid < 0) {
    fprintf(stderr, "Error al crear el proceso hijo\n");
    return 1;
  } else if (pid > 0) {
    printf("Soy el padre, mi PID es %d\n", getpid());
  } else {
    for (int i = 1;i <= 3;i++) {
      printf("Soy el hijo,mi PID es %d, creando proceso %d\n", getpid());
      fork();

      if (i == 1) {
        break;
      }
    }
  }


  printf("Proceso con PID %d terminado\n", getpid());

  return 0;
}

