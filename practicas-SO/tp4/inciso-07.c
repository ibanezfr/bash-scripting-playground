#include <stdio.h>
#include <unistd.h>

int main() {
  pid_t pid = fork();

  if (pid == 0) {
    printf("Soy el hijo\n");
  } else if (pid > 0) {
    printf("Soy el padre\n");
  } else {
    fprintf(stderr, "Error al crear el proceso hijo\n");
    return 1;
  }

  return 0;
}

