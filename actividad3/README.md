# Tarea 3 
## José Manuel Ibarra Pirir - 202001800
### Paso 1
Primero ubicarse en el lugar donde vamos a crear el script, se recomienda utilizar la ruta **/usr/local/bin/**.

Crear dentro de esa carpeta un archivo *.sh*, donde se van a colocar el script del mensaje.
```
sudo nano tarea3.sh
```
Colocar dentro del archivo el codigo que muestra el mensaje
```
#!/bin/bash

while true; do
    echo "¡Hola! La fecha y hora actual es: $(date)"
    sleep 1
done
```

### Paso 2
Ahora con el script creado, se le deben de otorgar los permisos suficientes para que pueda ejecutarse.
```
chmod 777 /usr/local/bin/tarea3.sh
```

### Paso 3
Ahora debemos ingresar a la ruta **/etc/systemd/system/**
Una vez dentro creamos un archivo con nombre Tarea3.service que contendrá lo siguiente:
```
[Unit]
Description=202001800 Tarea3

[Service]
User=jmaibarra
ExecStart=/usr/local/bin/tarea3.sh
Restart=always

[Install]
WantedBy=multi-user.target
```

### Paso 4
Ahora con el archivo creado debemos recargar los servidores para que encuentre el que acabamos de crear
```
sudo systemctl daemon-reload  
```

### Paso 5
Después habilitamos el servicio
```
sudo systemctl enable Tarea.service   
```

### Paso 6
Ahora podemos iniciar el servicio
```
sudo systemctl start Tarea3.service  
```

### Paso 7
Finalmente para ver que esté funcionando podemos ejecutar el siguiente comando para ver el log
```
sudo systemctl status Actividad3.service    
```