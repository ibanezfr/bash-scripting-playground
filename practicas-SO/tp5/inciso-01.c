#include <stdio.h>
#include <pthread.h>
#include <semaphore.h>

// Definición del semáforo
sem_t semaphore;

// Función que imprime la frase del hilo 1
void *hilo1(void *arg) {
	sem_wait(&semaphore); // Espeera a que el semáforo sea 0
	printf("Primero aprendo lenguaje C\n");
	sem_post(&semaphore); // Aumenta en 1 el valor del semáforo
	pthread_exit(NULL);
}

// Función que imprime la frase del hilo 2
void *hilo2(void *arg) {
	sem_wait(&semaphore); // Espera que semáforo sea 0.
	printf("Segundo trataré de aprender Semáforos\n");
	sem_post(&semaphore); // Aumenta en 1 el semáforo.
	pthread_exit(NULL);
}

int main() {
	// Inicializa el semáforo en 0
	sem_init(&semaphore, 0, 1);

	pthread_t tid1, tid2;

	pthread_create(&tid1, NULL, hilo1, NULL);
	pthread_create(&tid2, NULL, hilo2, NULL);

	pthread_join(tid1, NULL);
	pthread_join(tid2, NULL);

	sem_destroy(&semaphore);

	return 0;
}

