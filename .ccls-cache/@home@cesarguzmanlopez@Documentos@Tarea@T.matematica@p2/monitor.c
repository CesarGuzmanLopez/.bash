#include "parson.h"
#include<stdio.h>
#include <signal.h>
#include<stdlib.h>
#include <unistd.h>
void handler(int signum) {
  printf("Recibí la señal %d\n", signum);
}

int main() {
  struct sigaction action_sigint;
  action_sigint.sa_handler = handler; // Establecer la función handler como manejador
  sigemptyset(&action_sigint.sa_mask); // No bloquear ninguna señal
  action_sigint.sa_flags = 0; // No usar banderas especiales
  sigaction(SIGINT, &action_sigint, NULL); // Asociar la estructura act con la señal SIGINT
  while(1) {
    printf("Esperando una señal...\n");
    sleep(1);
  }
  return 0;
}
