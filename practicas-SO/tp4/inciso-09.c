#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>


int main() {
  pid_t child_pid, grandchild_pid;
  int status;

  child_pid = fork();

  if (child_pid == 0) {
    printf("Proceso Hijo 1: \n");
    printf("Hijo - ID: %d, Padre ID: %d, Abuelo ID: %d\n", getpid(), getppid(),
           getpgrp());

    grandchild_pid = fork();

    if (grandchild_pid == 0) {
      printf("Proceso Hijo 2: \n");
      printf("Hijo - ID: %d, Padre ID: %d, Abuelo ID: %d\n", getpid(), getppid(), getpgrp());
    }
  } else {
    waitpid(child_pid, &status, 0);
    printf("Padre - ID: %d, Abuelo ID: %d\n", getpid(), getpgrp());
  }

return 0;
}

