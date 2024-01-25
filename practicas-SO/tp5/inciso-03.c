#include <stdio.h>
#include <pthread.h>
#include <semaphore.h>

sem_t semaphore;

void* hilo1(void* arg) {
	sem_wait(&semaphore);
	printf("Hola desde el Hilo 1\n");
	sem_post(&semaphore);
	pthread_exit(NULL);
}

void* hilo2(void* arg) {
	sem_wait(&semaphore);
	printf("Hola desde el Hilo 2\n");
	sem_post(&semaphore);
	pthread_exit(NULL);
}

int main() {

	sem_init(&semaphore, 0, 1);

	pthread_t thread_id1, thread_id2;

	pthread_create(&thread_id1, NULL, hilo1, NULL);
	pthread_create(&thread_id2, NULL, hilo2, NULL);

	pthread_join(thread_id1, NULL);
	pthread_join(thread_id2, NULL);

	sem_destroy(&semaphore);

	return 0;
}

