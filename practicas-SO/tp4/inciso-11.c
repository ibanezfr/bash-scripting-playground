#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>
#include <sys/types.h>

int main() {
  pid_t pid;

  pid = fork();

  if (pid < 0) {
    fprintf(stderr, "Error al crear el proceso hijo\n");
    return 1;
  } else if (pid == 0) {
    printf("Soy el proceso hijo, PID: %d\n", getpid());
    system("ls -la");
  } else {
    printf("\nSoy el proceso padre, PID: %d. Mi hijo es: %d\n", getpid(), pid);
    system("mkdir MisDocumentos");
    system("touch MisDocumentos/procesos");
    wait(NULL);
    printf("Proceso hijo completado\n");
  }

  return 0;
}

