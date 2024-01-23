#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>
#include <stdlib.h>

int main() {
  pid_t pid_h1 = fork();

  if (pid_h1 == 0) {
    for (int i = 1; i <= 3; i++) {
      pid_t pid_hijos = fork();

      if (pid_hijos == 0) {
        printf("Hijo 1%d (pid: %d)\n", i, getpid());
        _exit(0);
      }
    }

    for (int i = 1;i <= 3;i++) {
      wait(NULL);
    }

    _exit(0);
  }else {
    printf("Padre (pid: %d) ejecutando script de Linux\n",getpid());
    system("../../article-banner.sh");

    pid_t pid_h3 = fork();

    if (pid_h3 == 0) {
      execl("/bin/ls", "ls", "-l", (char *)NULL);
      perror("execl");
      _exit(1);
    } else {
      wait(NULL);
    }
  }

  return 0;
}

