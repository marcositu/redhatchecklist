redhatchecklist
===============

This script is designed to perform a security evaluation against industry best practices, over RedHat and RedHat based systems, to detect configuration deviations.
It was developed due to the need to ensure that the servers within my workplace would comply with specific policies. As this tool was designed specifically for this purpose, "lynis" was not used for the task.

If anyone wants to provide assistance with optimizing/organizing or reprogramming the "code", please let me know! :) As you will see, I still lack skills on this subject.

El script tiene como objetivo realizar una evaluación sobre un Sistema RedHat o sus derivados, en busca de desviaciones de configuración contra las mejores prácticas del mercado.  El motivo de la creación del script se debió a la necesidad de cumplir ciertas normativas en los servidores donde trabajo, cabe aclarar que esta herramienta fue pensada con ese propósito y por este motivo no utilice "lynis" para la tarea.

Si alguna persona quiere ayudarme a optimizar/organizar o reprogramar el "código" es bienvenido :) ya que como verán me faltan muchos skills sobre la materia.

Usage / Procedimiento de uso
====================

1) Modify line “27” on the “/libs/fase6.pl” file, where the "$bannerpersona" variable with the "Cable" value is, with a string located in your company’s customized banner.

2) Modify line “33” of the “/libs/fase7.pl” file, where the "ListenAddress" variable with the '10.246' value is, with the IP addresses that should be configured.

2) Copy the redhatchecklist.pl script and the /libs/ folder to the server that you will be analyzing.

3) Execute the following with root privileges:
[server]# perl redhatchecklist.pl

4) Then, copy both “html” reports to the same folder in which we have the following files/directories:
- /src/
- /vendor/
- demo.css
- sprite.png

1) Copiar al servidor el script  "redhatchecklist.pl" y la carpeta /libs/.

2) Modificar la linea "27" del archvio /libs/fase6.pl donde se encuentra la variable "$bannerpersona" con el valor "Cable" por algún string que se encuentra en el banner personalizado de su Compañia.

Modificar la linea "33" del archvio /libs/fase7.pl donde se encuentra la variable "ListenAddress" con el valor '10.246' por las direcciones IP que deben estar configuradas.

2) Debemos copiar al servidor que sera analizando nuestro script redhatchecklist.pl y la carpeta /libs/

3) Ejecutar con permisos de root el script.

[server]# perl redhatchecklist.pl

4) Luego debemos copiar los 2 reportes "html" al mismo directorio donde tenemos los siguientes archivos/diretorios:
- /src/
- /vendor/
- demo.css
- sprite.png

Further information / Más información
====================

For further information please visit wiki: https://github.com/marcositu/redhatchecklist/wiki

Para mayor información visitar la wiki: https://github.com/marcositu/redhatchecklist/wiki
