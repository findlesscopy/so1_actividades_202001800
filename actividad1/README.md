# TIpos de Kernel y sus diferencias

### Kernel monolítico: 
Es un Kernel de gran tamaño que puede gestionar todas las tareas. Se encarga de la gestión de memoria y procesos, así como de la comunicación entre los procesos y el soporte de las diferentes funciones de los drivers y el hardware. Los sistemas operativos que recurren al Kernel monolítico son Linux, OS X y Windows.
- Todas las funciones del sistema operativo se ejecutan en el espacio del núcleo.
- Un solo bloque de código maneja todas las operaciones del sistema.
- Alta eficiencia en términos de velocidad de ejecución y acceso a recursos.
### Microkernel: 
Los Kernel que están diseñados con pequeños tamaños tienen una clara función: evitar el colapso total del sistema en caso de un fallo. Para cumplir con todas las tareas como un Kernel monolítico cuenta con diferentes módulos. Es curioso, pero hasta ahora solo el Mach de OS X es el único que utiliza el microkernel.
- Divide las funciones del sistema operativo en pequeños módulos que se ejecutan en el espacio del usuario.
- Solo un conjunto mínimo de funciones, como la gestión de memoria y la comunicación entre procesos, permanecen en el núcleo.
- Mayor modularidad y capacidad de actualización.
### Kernel híbrido: 
Combinación entre el microkernel y el Kernel monolítico. Nos encontramos ante un Kernel grande, pero compacto y que puede ser modulado y otras partes del mismo Kernel pueden cargarse de manera dinámica. Es utilizado en Linux y OS X. 
- Combina características de los kernels monolíticos y microkernels.
- Algunas funciones del sistema operativo se ejecutan en el espacio del núcleo, mientras que otras se ejecutan en el espacio de usuario.
- Busca equilibrar la eficiencia del kernel monolítico con la modularidad del microkernel.

### Diferencias
- Los kernels monolíticos tienden a ser más eficientes en términos de rendimiento
- Mientras que los microkernels ofrecen mayor modularidad y son más resistentes a fallos.
- Los kernels híbridos buscan combinar lo mejor de ambos enfoques.
- La elección del tipo de kernel depende de los requisitos y objetivos del sistema operativo específico.

# User vs Kernel Mode
### User
- En este modo, un programa en ejecución tiene acceso a un conjunto limitado de recursos y privilegios.
- Las operaciones realizadas en modo usuario están restringidas a acciones que no afectan directamente al funcionamiento del sistema operativo o al hardware.
- Los programas en modo usuario no tienen acceso directo al hardware ni pueden ejecutar instrucciones privilegiadas.

### Kernel Mode
- En este modo, un programa (generalmente el kernel del sistema operativo) tiene acceso completo a todos los recursos y privilegios del sistema.
- El modo kernel permite la ejecución de instrucciones privilegiadas y el acceso directo al hardware.
- Las operaciones críticas del sistema operativo, como la gestión de memoria, la programación de tareas y el manejo de interrupciones, se realizan en modo kernel.

La transición entre el modo usuario y el modo kernel se produce durante la ejecución de una ***interrupción o una excepción***. Cuando un programa en modo usuario requiere realizar una operación que requiere privilegios elevados, como acceder a hardware o realizar una operación de E/S (Entrada/Salida), se produce una transición al modo kernel. La interrupción o excepción activa el kernel, que realiza la operación necesaria y luego devuelve el control al modo usuario.

# Interupts vs Traps
Las interrupciones (interrupts) y las trampas (traps) son mecanismos utilizados en los sistemas operativos para manejar eventos y cambiar el flujo de ejecución de un programa. Aunque ambos involucran cambios en la secuencia de ejecución, hay diferencias clave entre ellos:

### Interrupciones
- Son eventos externos al procesador que requieren atención inmediata. Estos eventos pueden ser generados por hardware o por otros dispositivos conectados al sistema.
- Las interrupciones pueden provenir de dispositivos de hardware, como temporizadores, teclados, ratones, discos, etc.
- Cuando se produce una interrupción, el procesador detiene temporalmente la ejecución del programa actual y transfiere el control a un manejador de interrupciones específico en el sistema operativo. Después de manejar la interrupción, el control puede regresar al programa original.
- Las interrupciones pueden tener niveles de prioridad, lo que significa que algunas interrupciones pueden interrumpir a otras dependiendo de su nivel de importancia.

### Trampas
- Las trampas son eventos generados internamente por el propio programa en ejecución. También se conocen como excepciones o interrupciones de software.
- Las trampas son provocadas por instrucciones específicas dentro del código del programa o por situaciones excepcionales, como la división por cero o el acceso a una ubicación de memoria no válida.
- Cuando se produce una trampa, el control se transfiere a un manejador de trampas, generalmente parte del sistema operativo. A diferencia de las interrupciones, las trampas se generan internamente y no provienen de eventos externos.
- Las trampas se utilizan para manejar eventos o condiciones especiales en el software, como errores o llamadas al sistema operativo.
