#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

void crearProceso() {
  pid_t pid_hijo = fork();

  if (pid_hijo == 0) {
      printf("Soy el hijo, Nro de mi ProcessID: %d, Mi Padre es %d\n", getpid(),
      getppid());
  } else if (pid_hijo > 0) {
      wait(NULL);
      printf("Soy el padre, Nro mi ProcessID: %d, Mi Padre es %d\n", getpid(),
      getppid());
  } else {
      printf("Error al crear el proceso hijo.\n");
  }

}

int main() {
  crearProceso();
  return 0;
}

