#include <stdio.h>
#include <pthread.h>

#define ITERATIONS 10000

int contador = 0;

void *incrementar(void *arg){
	for (int i = 0;i < ITERATIONS;++i) {
		contador++;
	}
	pthread_exit(NULL);
}

void *decrementar(void *arg){
	for (int i = 0;i < ITERATIONS;++i) {
		contador--;
	}
	pthread_exit(NULL);
}

int main() {

	pthread_t hilo_incremento, hilo_decremento;

	pthread_create(&hilo_incremento, NULL, incrementar, NULL);
	pthread_create(&hilo_decremento, NULL, decrementar, NULL);

	pthread_join(hilo_incremento, NULL);
	pthread_join(hilo_decremento, NULL);

	//printf("El valor final del contador es: %d\n", contador);

	printf("%d\n", contador);

	return 0;
}

