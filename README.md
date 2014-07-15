redhatchecklist
===============

El script tiene como objetivo realizar una evaluación sobre un Sistema RedHat o sus derivados, en busca de desviaciones de configuración contra las mejores prácticas del mercado.  El motivo de la creación del script se debió a la necesidad de cumplir ciertas normativas en los servidores donde trabajo, cabe aclarar que esta herramienta fue pensada con ese propósito y por este motivo no utilice "lynis" para la tarea.

Procedimiento de uso
====================

1) Debemos ejecutar el script en el servidor a analizar, se debe tener permisos de root en el mismo.
[server]# perl redhatchecklist.pl

2) Luego debemos copiar los 2 reportes "html" al mismo directorio donde tenemos los siguientes archivos/diretorios:
- src
- vendor
- demo.css
- sprite.png
