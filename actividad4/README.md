# Tarea 5 
## José Manuel Ibarra Pirir - 202001800
### ¿Cuántos procesos únicos son creados?
Se crean 3 procesos únicos:

- Proceso padre: El proceso que se ejecuta inicialmente.
- Proceso hijo 1: Creado por la llamada a fork() en el proceso padre.
- Proceso hijo 2: Creado por la segunda llamada a fork() en el proceso hijo 1.

### ¿Cuántos hilos únicos son creados?
Se crea 1 hilo único en el proceso hijo 1.