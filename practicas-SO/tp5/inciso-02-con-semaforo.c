#include <stdio.h>
#include <pthread.h>
#include <semaphore.h>

#define ITERATIONS 10000

int contador = 0;
sem_t semaforo;

void *incrementar(void *arg) {
	for (int i = 0;i < ITERATIONS; ++i) {
		sem_wait(&semaforo);
		contador++;
		sem_post(&semaforo);
	}
	pthread_exit(NULL);
}

void *decrementar(void *arg){
	for (int i = 0;i < ITERATIONS;++i) {
		sem_wait(&semaforo);
		contador--;
		sem_post(&semaforo);
	}
	pthread_exit(NULL);
}

int main() {
	sem_init(&semaforo, 0, 1);

	pthread_t hiloIncrementar, hiloDecrementar;

	pthread_create(&hiloIncrementar, NULL, incrementar, NULL);
	pthread_create(&hiloDecrementar, NULL, decrementar, NULL);

	pthread_join(hiloIncrementar, NULL);
	pthread_join(hiloDecrementar, NULL);

	sem_destroy(&semaforo);
	
	// Comentado para poder ejecutar bash script verificador 
	//printf("Valor final del contador: %d\n", contador);
	
	printf("%d\n", contador);

	return 0;
}

