#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <pthread.h>

void *thread_function(void *arg) {
  printf("Hilo creado con argumento: %d\n", (int)arg);
  return NULL;
}

int thread_create(void (*start_routine)(void *), void *arg) {
  pthread_t thread;
  pthread_attr_t attr;

  pthread_attr_init(&attr);
  pthread_attr_setdetachstate(&attr, PTHREAD_CREATE_DETACHED);

  int err = pthread_create(&thread, &attr, start_routine, arg);

  pthread_attr_destroy(&attr);

  return err;
}

int main() {
  pid_t pid;

  pid = fork();
  if (pid == 0) { /* proceso hijo */
    int err = thread_create(thread_function, (void *)10);
    if (err != 0) {
      printf("Error al crear el hilo: %d\n", err);
      return 1;
    }
    
    // Esperar a que el hilo termine
    sleep(1);
    
    // Salir del proceso hijo
    exit(0);
  } else if (pid > 0) { /* proceso padre */
    // Esperar a que el proceso hijo termine
    wait(NULL);
    
    printf("Proceso hijo terminado\n");
  } else {
    printf("Error al crear el proceso hijo\n");
    return 1;
  }

  return 0;
}
