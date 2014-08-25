#!/usr/bin/perl -w
 my $Hostname=`uname -n`;
chomp $Hostname;
my $SistemaOperativoC=`uname -a`;
chomp $SistemaOperativoC;


    package Msg;
    use Exporter 'import';
     no warnings;
use open qw(:std :utf8);
use Encode qw(decode_utf8);
    ### Lista de idiomas
    use constant {
        es    => 0,
        en     => 1,
    };
	
     
 our @msg = (  
        [
            "<h1>Análisis de seguridad - Informe</h1>", #fase - msg0
            "<p>Cabe aclarar que si algunos items estan vacios significa que la configuración esta correcta. <a href=\"$Hostname-recomendaciones.html\"><button type=\"button\" class=\"button-warning pure-button\">Recomendaciones</button></a></p>",#fase - msg1
			"<h1>Análisis de seguridad - Recomendaciones</h1>\n",#fase - msg2
			"\nFase 0.0 -- Información del Equipo\n",#fase0 - msg3
			"<h3>Fase 0.0 -- Información del Equipo</h3>",#fase0 - msg4
			"\nFase 1.0 -- Informacion de los usuarios del sistema\n",#fase1 - msg5
			"<h3>Fase 1.0 -- Informacion de los usuarios del sistema</h3>\n", #fase1 - msg6
			"Información de los usuarios del sistema", #fase1 - msg7
			"<p>Se recomienda analizar si los usuarios listado son los correctos</p>",#fase1 - msg8
			"\nFase 1.1 -- Comprobacion de Usuarios/Grupos \n",#fase1.1 - msg9
			"<h3>Fase 1.1 -- Comprobacion de Usuarios/Grupos</h3>\n",#fase1.1 - msg10
			"<p>Recomendamos analizar si los grupos creados y la asignación de los usuarios es la requerida.\n</p>\n",#fase1.1 - msg11
			"\nFase 1.2 -- Verificar que no existan cuentas sin contraseña\n",#fase1.2 - msg12
			"<h3>Fase 1.2 -- Verificar que no existan cuentas sin contraseña</h3>\n",#fase1.2 - msg13
			"Fase 1.3 -- Verificar que no existan usuarios con ID 0\n",#fase1.3 - msg14
			"<h3>Fase 1.3 -- Verificar que no existan usuarios con ID 0</h3>\n",#fase1.3 - msg15
			"\nFase 1.4 -- Verificación del archivo login.defs\n",#fase1.4 - msg16
			"<h3>Fase 1.4 -- Verificación del archivo login.defs</h3>\n",#fase1.4 - msg17
			"\nFase 1.5 -- Ultimos usuarios agregados\n",#fase1.5 - msg18
			"<h3>Fase 1.5 -- Ultimos usuarios agregados</h3>\n",#fase1.5 - msg19
			"<p>En el caso que existan usuarios agregados en el ultimo periodo, verificar que haya sido un requerimiento del servicio a prestar.</p>",#fase1.5 - msg20
			"\nFase 1.6 -- Configuración PAM\n",#fase1.6 - msg21
			"<h3>Fase 1.6 -- Configuración PAM</h3>\n",#fase1.6 - msg22
			"\nEl parámetro MINLEN no se encuentra configurado\n",#fase1.6 - msg23
			"<p class=\"negativo\">Negativo: El parámetro minlen no se encuentra configurado</p>\n",#fase1.6 - msg24
			"<p>Recomendamos configurar el parámetro minlen con el valor 8</p>\n",#fase1.6 - msg25
			"\nEl parámetro RETRY no se encuentra configurado\n",#fase1.6 - msg26
			"<p class=\"negativo\">Negativo: El parámetro RETRY no se encuentra configurado</p>\n",#fase1.6 - msg27
			"<p>Recomendamos configurar el parámetro RETRY con el valor 3</p>\n",#fase1.6 - msg28
			"\nEl parámetro UCREDIT no se encuentra configurado\n",#fase1.6 - msg29
			"<p class=\"negativo\">Negativo: El parámetro UCREDIT no se encuentra configurado</p>\n",#fase1.6 - msg30
			"<p>Recomendamos configurar el parámetro UCREDIT con el valor -1</p>\n",#fase1.6 - msg31
			"\nEl parámetro DCREDIT no se encuentra configurado\n",#fase1.6 - msg32
			"<p class=\"negativo\">Negativo: El parámetro DCREDIT no se encuentra configurado</p>\n",#fase1.6 - msg33
			"<p>Recomendamos configurar el parámetro DCREDIT con el valor -1</p>\n",#fase1.6 - msg34
			"\nEl parámetro LCREDIT no se encuentra configurado\n",#fase1.6 - msg35
			"<p class=\"negativo\">Negativo: El parámetro LCREDIT no se encuentra configurado</p>\n",#fase1.6 - msg36
			"<p>Recomendamos configurar el parámetro LCREDIT con el valor -1</p>\n",#fase1.6 - msg37
			"\nEl parámetro OCREDIT no se encuentra configurado\n",#fase1.6 - msg38
			"<p class=\"negativo\">Negativo: El parámetro OCREDIT no se encuentra configurado</p>\n",#fase1.6 - msg39
			"<p>Recomendamos configurar el parámetro OCREDIT con el valor -1</p>\n",#fase1.6 - msg40
			"\nEl parámetro DIFOK no se encuentra configurado\n",#fase1.6 - msg41
			"<p class=\"negativo\">Negativo: El parámetro DIFOK no se encuentra configurado</p>\n",#fase1.6 - msg42
			"<p>Recomendamos configurar el parámetro DIFOK con el valor 2</p>\n",#fase1.6 - msg43
			"\nFase 1.7 -- Ultimos usuarios conectados\n",#fase1.7 - msg44
			"<h3>Fase 1.7 -- Últimos usuarios conectados</h3>\n",#fase1.7 - msg45
			"<p>Verificar que las direcciones IP correspondan a los administradores del servidor</p>\n",#fase1.7 - msg46
			"\nFase 1.8 -- Ultimos comandos ejecutados por los usuarios\n",#fase1.8 - msg47
			"<h3>Fase 1.8 -- Últimos comandos ejecutados por los usuarios</h3>\n",#fase1.8 - msg48
			"<p>Verificar que los comandos ejecutados sean propios de la administración del servidor</p>\n",#fase1.8 - msg49
			"\nFase 1.9 -- Relaciones de confianza\n",#fase1.9 - msg50
			"<h3>Fase 1.9 -- Relaciones de confianza</h3>\n",#fase1.9 - msg51
			"<p>En el caso que existen relaciones de confianza, verificar que sean las requeridas.</p>\n",#fase1.9 - msg52
			"\nFase 1.10 -- Usuarios con acceso al sistema\n",#fase1.10 - msg53
			"<h3>Fase 1.10 -- Usuarios con acceso al sistema</h3>\n",#fase1.10 - msg54
			"<p>Verificar que los usuarios nombrados en el informe sean los requerimientos para la administración del servidor.</p>\n",#fase1.10 - msg55
			"\nFase 1.11 -- Verificar que no existan usuarios con Grupo ID 0\n",#fase1.11 - msg56
			"<h3>Fase 1.11 -- Verificar que no existan usuarios con Grupo ID 0</h3>\n",#fase1.11 - msg57
			"\nFase 2.0 -- Eventos mediante Rsyslog - AUTHPRIV\n",#fase2 - msg58
			"<h3>Fase 2.0 -- Eventos mediante Rsyslog - AUTHPRIV</h3>\n",#fase2 - msg59
			"No esta habilitada la captura de eventos del sistema operativo mediante syslog\n",#fase2 - msg60
			"<p class=\"negativo\">Negativo: No esta habilitada la captura de eventos del sistema operativo mediante syslog</p>\n",#fase2 - msg61
			"<p>Se recomienda habilitar la captura de eventos del sistema operativo mediante syslog</p>\n",#fase2 - msg62
			"\nFase 2.1 -- Eventos mediante Syslog - AUTHPRIV\n",#fase2.1 - msg63
			"<h3>Fase 2.1 -- Eventos mediante Syslog - AUTHPRIV</h3>\n",#fase2.1 - msg64
			"No esta habilitada la captura de eventos del sistema operativo mediante Rsyslog\n",#fase2.1 - msg65
			"<p class=\"negativo\">Negativo: No esta habilitada la captura de eventos del sistema operativo mediante Rsyslog</p>\n",#fase2.1 - msg66
			"<p>Se recomienda habilitar la captura de eventos del sistema operativo mediante Rsyslog</p>\n",#fase2.1 - msg67
			"\nFase 3.0 -- Verify file and directory permissions\n",#fase3 - msg68
			"<h3>Fase 3.0 -- Verificar permisos en archivos y directorios</h3>\n",#fase3 - msg69
			"\nFase 3.1 -- Verificacion de Sticky Bit\n",#fase3.1 - msg70
			"<h3>Fase 3.1 -- Verificacion de Sticky Bit</h3>\n",#fase3.1 - msg71
			"\nFase 3.2 -- Verificar archivos/directorios con permisos de escritura para todos los usuarios\n",#fase3.2 - msg72
			"<h3>Fase 3.2 -- Verificar archivos/directorios con permisos de escritura para todos los usuarios</h3>\n",#fase3.2 - msg73
			"\nFase 3.3 -- Verificacion de suid/gsid\n",#fase3.3 - msg74
			"<h3>Fase 3.3 -- Verificacion de suid/gsid</h3>\n",#fase3.3 - msg75
			"\nFase 3.4 -- Archivos sin owner y group\n",#fase3.4 - msg76
			"<h3>Fase 3.4 -- Archivos sin owner y group</h3>\n",#fase3.4 - msg77
			"\nFase 4.0 -- Archivo de autenticacion ftp\n",#fase4 - msg78
			"<h3>Fase 4.0 -- Archivo de autenticacion ftp</h3>\n",#fase4 - msg79
			"\nFase 5.0 -- Cierre de conexión automático\n",#fase5 - msg80
			"<h3>Fase 5.0 -- Cierre de conexión automático</h3>\n",#fase5 - msg81
			"\nEl archivo /etc/profile no contiene la variable TMOUT configurada\n",#fase5 - msg82
			"<p class=\"negativo\">Negativo: El archivo /etc/profile no contiene la variable TMOUT configurada</p>\n",#fase5 - msg83
			"<p>Recomendamos configurar el par&aacute;metro TMOUT en el archivo /etc/profile</p>\n",#fase5 - msg84
			"\nFase 6.0 -- Banner personalizado\n",#fase6 - msg85
			"<h3>Fase 6.0 -- Banner personalizado</h3>\n",#fase6 - msg86
			"\nEl banner no se encuentra personalizado\n",#fase6 - msg87
			"<p class=\"negativo\">El banner no se encuentra personalizado</p>\n",#fase6 - msg88
			"<p>Recomendamos personalizar el banner del servidor</p>\n",#fase6 - msg89
			"\nFase 7.0 -- Verificacion de la configuracion del servicio ssh\n",#fase7 - msg90
			"<h3>Fase 7.0 -- Verificacion de la configuracion del servicio ssh</h3>\n",#fase7 - msg91
			"\nFase 8.0 -- SeLinux\n",#fase8 - msg92
			"<h3>Fase 8.0 -- SeLinux</h3>\n",#fase8 - msg93
			"\nSeLinux se encuentra desactivado\n",#fase8 - msg94
			"<p class=\"negativo\">SeLinux se encuentra desactivado</p>\n",#fase8 - msg95
			"<p>Se recomienda configurar y activar SeLinux</p>\n",#fase8 - msg96
			"\nFase 9.0 -- IPTABLES\n",#fase9 - msg97
			"<h3>Fase 9.0 -- IPTABLES</h3>\n",#fase9 - msg98
			"<p>Se recomienda analizar las listas de acceso</p>\n",#fase9 - msg99
			"\nFase 10.0 -- Servicios\n",#fase10 - msg100
			"<h3>Fase 10.0 -- Servicios</h3>\n",#fase10 - msg101
			"<p>Se recomienda analizar los servicios activos</p>\n",#fase10 - msg102
			"\nFase 11.0 -- Procesos\n",#fase11- msg103
			"<h3>Fase 11.0 -- Procesos</h3>\n",#fase11- msg104
			"<p>Se recomienda analizar si los procesos activos son los esperados</p>\n",#fase11 - msg105
			"\nFase 12.0 -- Conexiones\n",#fase12 - msg106
			"<h3>Fase 12.0 -- Conexiones</h3>\n",#fase12 - msg107
			"<p>Se recomienda analizar si las conexiones son las esperadas</p>\n",#fase12 - msg108
			"\nFase 13.0 -- Hash de binarios\n",#fase13 - msg109
			"<h3>Fase 13.0 -- Hash de binarios</h3>\n",#fase13 - msg110
			"<p>Se recomienda analizar los hash listados en el informe en el sitio de Virus Total</p>\n",#fase13 - msg111
			"\nFase 14.0 -- Configuración de Sudoers\n",#fase14 - msg112
			"<h3>Fase 14.0 -- Configuración de Sudoers </h3>\n",#fase14 - msg113
			"<p>Se recomienda analizar si la configuración de sudoers sea la esperada</p>\n",#fase14 - msg114
			"\nFase 15.0 -- Cron.Daily\n",#fase15 - msg115
			"<h3>Fase 15.0 -- Cron.Daily</h3>\n",#fase15 - msg116
			"<p>Se recomienda analizar si los archivos situados en el crond.daily son los esperados</p>\n",#fase15 - msg117
			"\nFase 16.0 -- Versiones de softwares\n",#fase16 - msg118
			"<h3>Fase 16.0 -- Versiones de softwares</h3>\n",#fase16 - msg119
			"<p>Se recomienda analizar si las versiones de los softwares listados son las ultimas y si se encuentran fuera de problemas de seguridad</p>",#fase16 - msg120
			"\nFase 17.0 -- Configuración de Red\n",#fase17 - msg121
			"<h3>Fase 17.0 -- Configuración de Red</h3>\n",#fase17 - msg122
			"<p>Se recomienda analizar si la configuración de red es la esperada</p>\n",#fase17 - msg123
			"\nFase 17.1 -- Verificación de rutas\n",#fase17.1 - msg124
			"<h3>Fase 17.1 -- Verificación de rutas</h3>\n",#fase17.1 - msg125
			"<p>Se recomienda analizar si la configuración de las rutas es la correcta</p>\n",#fase17.1 - msg126
			"\nFase 17.2 -- Verificacion configuración sysctl\n",#fase17.2 - msg127
			"<h3>Fase 17.2 -- Verificacion configuración sysctl</h3>",#fase17.2 - msg128
			"\nFase 18.0 -- Verificar el nivel de inittab\n",#fase18 - msg129
			"<h3>Fase 18.0 -- Verificar el nivel de inittab</h3>\n",#fase18 - msg130
			"\nFase 18.1 -- Verificar que no este activo ctrlaltdel en inittab\n",#fase18.1 - msg131
			"<h3>Fase 18.1 -- Verificar que no este activo ctrlaltdel en inittab</h3>\n",#fase18.1 - msg132
			"\nFase 19.0 -- Verificar configuración samba\n",#fase19 - msg133
			"<h3>Fase 19.0 -- Verificar configuración samba</h3>\n",#fase19 - msg134
			"<p>Se recomienda analizar si la configuración de SMB es la esperada</p>\n",#fase19 - msg135
			"<p>Samba no se encuentra configurado</p>\n",#fase19 - msg136
			"\nFase 20.0 -- Verificar sincronización NTP\n",#fase20 - msg137
			"<h3>Fase 20.0 -- Verificar sincronización NTP</h3>\n",#fase20 - msg138
			"\nSe encuentra sincronizado localmente\n",#fase20 - msg139
			"<p>Se encuentra sincronizado localmente</p>",#fase20 - msg140
			"\nSe encuentra sincronizado por un servidor remoto\n",#fase20 - msg141
			"<p>Se encuentra sincronizado por un servidor remoto</p>",#fase20 - msg142
			"\nNo se encuentra sincronizado\n",#fase20 - msg143
			"<p class=\"negativo\">Negativo: No se encuentra sincronizado</p>\n",#fase20 - msg144
			"<p>Se recomienda que el servidor se encuentra sincronizado por el NTP Server de la Empresa</p>\n",#fase20 - msg145

        ],
        [
            "<h1>Security analysis - Report</h1>",#fase - msg0
            "<p>Take into account, that if some items are empty, it means that the configuration is correct. <a href=\"$Hostname-recomendations.html\"><button type=\"button\" class=\"button-warning pure-button\">Recomendations</button></a></p>",#fase - msg1
			"<h1>Security analysis - Recomendations</h1>",#fase - msg2
			"\nFase 0.0 -- System information\n",#fase0 - msg3
			"<h3>Fase 0.0 -- System information</h3>",#fase0 - msg4
			"\nFase 1.0 -- System users information\n",#fase1 - msg5
			"<h3>Fase 1.0 -- System users information</h3>\n", #fase1 - msg6
			"System users information", #fase1 - msg7
			"<p>It is recommended to analyze if the users configuration is as expected</p>\n",#fase1 - msg8
			"\nFase 1.1 -- Users/Groups check\n",#fase1.1 - msg9
			"<h3>Fase 1.1 -- Users/Groups check</h3>\n",#fase1.1 - msg10
			"<p>It is recommended to analyze the groups created and the username assigned\n</p>\n",#fase1.1 - msg11
			"\nFase 1.2 -- Verify there are no accounts without passwords\n",#fase1.2 - msg12
			"<h3>Fase 1.2 -- Verify there are no accounts without passwords</h3>\n",#fase1.2 - msg13
			"\nFase 1.3 -- Verify that there are no users with ID 0\n",#fase1.3 - msg14
			"<h3>Fase 1.3 -- Verify that there are no users with ID 0</h3>\n",#fase1.3 - msg15
			"\nFase 1.4 -- Verify the login.defs file\n",#fase1.4 - msg16
			"<h3>Fase 1.4 -- Verify the login.defs file</h3>\n",#fase1.4 - msg17
			"\nFase 1.5 -- Recent added users\n",#fase1.5 - msg18
			"<h3>Fase 1.5 -- Recent added users</h3>\n",#fase1.5 - msg19
			"<p>If any user account is detected in the last period, please verify that is referred to a service requirement</p>",#fase1.5 - msg20
			"\nFase 1.6 -- PAM Configuration\n",#fase1.6 - msg21
			"<h3>Fase 1.6 -- PAM Configuration</h3>\n",#fase1.6 - msg22
			"\nThe MINLEN parameter does not exist\n",#fase1.6 - msg23
			"<p class=\"negativo\">The MINLEN parameter does not exist</p>\n",#fase1.6 - msg24
			"<p>The recommended value for the MINLEN parameter is 8</p>\n",#fase1.6 - msg25
			"\nThe RETRY parameter does not exist\n",#fase1.6 - msg26
			"<p class=\"negativo\">The RETRY parameter does not exist</p>\n",#fase1.6 - msg27
			"<p>The recommended value for the RETRY parameter is 3</p>\n",#fase1.6 - msg28
			"\nThe UCREDIT parameter does not exist\n",#fase1.6 - msg29
			"<p class=\"negativo\">The UCREDIT parameter does not exist</p>\n",#fase1.6 - msg30
			"<p>The recommended value for the UCREDIT parameter is -1</p>\n",#fase1.6 - msg31
			"\nThe DCREDIT parameter does not exist\n",#fase1.6 - msg32
			"<p class=\"negativo\">The DCREDIT parameter does not exist</p>\n",#fase1.6 - msg33
			"<p>The recommended value for the DCREDIT parameter is -1</p>\n",#fase1.6 - msg34
			"\nThe LCREDIT parameter does not exist\n",#fase1.6 - msg35
			"<p class=\"negativo\">The LCREDIT parameter does not exist</p>\n",#fase1.6 - msg36
			"<p>The recommended value for the LCREDIT parameter is -1</p>\n",#fase1.6 - msg37
			"\nThe OCREDIT parameter does not exist\n",#fase1.6 - msg38
			"<p class=\"negativo\">The OCREDIT parameter does not exist</p>\n",#fase1.6 - msg39
			"<p>The recommended value for the OCREDIT parameter is -1</p>\n",#fase1.6 - msg40
			"\nThe DIFOK parameter does not exist\n",#fase1.6 - msg41
			"<p class=\"negativo\">The DIFOK parameter does not exist</p>\n",#fase1.6 - msg42
			"<p>The recommended value for the DIFOK parameter is 2</p>\n",#fase1.6 - msg43
			"\nFase 1.7 -- Recent user logins\n",#fase17 - msg44
			"<h3>Fase 1.7 -- Recent user logins</h3>\n",#fase1.7 - msg45
			"<p>Verify that the IP addresses correspond to the server administrators</p>\n",#fase1.7 - msg46
			"\nFase 1.8 --  Recent commands executed by users\n",#fase1.8 - msg47
			"<h3>Fase 1.8 -- Recent commands executed by users</h3>\n",#fase1.8 - msg48
			"<p>Verify that the commands listed on the report are required for the server’s administration</p>\n",#fase1.8 - msg49
			"\nFase 1.9 -- Trust relationships\n",#fase1.9 - msg50
			"<h3>Fase 1.9 -- Trust relationships</h3>\n",#fase1.9 - msg51
			"<p>It is recommended to analyze if the Trust relationships</p>\n",#fase1.9 - msg52
			"\nFase 1.10 -- Users with system access\n",#fase1.10 - msg53
			"<h3>Fase 1.10 -- Users with system access</h3>\n",#fase1.10 - msg54
			"<p>Verify that the users listed on the report are required for the server’s administration</p>\n",#fase1.10 - msg55
			"\nFase 1.11 -- Verify that there are no users with Group ID 0\n",#fase1.11 - msg56
			"<h3>Fase 1.11 -- Verify that there are no users with Group ID 0</h3>\n",#fase1.11 - msg57
			"\nFase 2.0 -- Syslog events - AUTHPRIV\n",#fase2 - msg58
			"<h3>Fase 2.0 -- Syslog events - AUTHPRIV</h3>\n",#fase2 - msg59
			"The OS event capture through syslog is not enabled\n",#fase2 - msg60
			"<p class=\"negativo\">Negative: The OS event capture through syslog is not enabled</p>\n",#fase2 - msg61
			"<p>It is recommended to capture audit events from the OS using syslog</p>\n",#fase2 - msg62	
			"\nFase 2.1 -- Rsyslog events - AUTHPRIV\n",#fase2.1 - msg63
			"<h3>Fase 2.1 -- Rsyslog events - AUTHPRIV</h3>\n",#fase2.1 - msg64
			"The OS event capture through syslog is not enabled\n",#fase2.1 - msg65
			"<p class=\"negativo\">Negative: The OS event capture through Rsyslog is not enabled</p>\n",#fase2.1 - msg66
			"<p>It is recommended to capture audit events from the OS using Rsyslog</p>\n",#fase2.1- msg67
			"\nFase 3.0 -- Verify file and directory permissions\n",#fase3 - msg68
			"<h3>Fase 3.0 -- Verify file and directory permissions</h3>\n",#fase3 - msg69
			"\nFase 3.1 -- Verify Sticky Bit\n",#fase3.1 - msg70
			"<h3>Fase 3.1 -- Verify Sticky Bit</h3>\n",#fase3.1 - msg71
			"\nFase 3.2 -- Verify files with write privilege for all users\n",#fase3.2 - msg72
			"<h3>Fase 3.2 -- Verify files with write privilege for all users</h3>\n",#fase3.2 - msg73
			"\nFase 3.3 -- Verify suid/gsid\n",#fase3.3 - msg74
			"<h3>Fase 3.3 -- Verify suid/gsid</h3>\n",#fase3.3 - msg75
			"\nFase 3.4 -- Files without owner and group\n",#fase3.4 - msg76
			"<h3>Fase 3.4 -- Files without owner and group</h3>\n",#fase3.4 - msg77
			"\nFase 4.0 -- FTP authentication file\n",#fase4 - msg78
			"<h3>Fase 4.0 -- FTP authentication file</h3>\n",#fase4 - msg79
			"\nFase 5.0 -- Automatic connection close\n",#fase5 - msg80
			"<h3>Fase 5.0 -- Automatic connection close</h3>\n",#fase5 - msg81
			"\nThe variable TMOUT is not configured in /etc/profile\n",#fase5 - msg82
			"<p class=\"negativo\">Negative: The variable TMOUT is not configured in /etc/profile</p>\n",#fase5 - msg83
			"<p>It is recommended to configure the TMOUT parameter in the file\n",#fase5 - msg84
			"\nFase 6.0 -- Customized banner\n",#fase6 - msg85
			"<h3>Fase 6.0 -- Customized banner</h3>\n",#fase6 - msg86
			"\nA default banner is in place\n",#fase6 - msg87
			"<p class=\"negativo\">A default banner is in place</p>\n",#fase6 - msg88
			"<p>It is recommended to customize the server’s banner</p>\n",#fase6 - msg89
			"\nFase 7.0 -- Verify the SSH service configuration\n",#fase7 - msg90
			"<h3>Fase 7.0 -- Verify the SSH service configuration</h3>\n",#fase7 - msg91
			"\nFase 8.0 -- SeLinux\n",#fase8 - msg92
			"<h3>Fase 8.0 -- SeLinux</h3>\n",#fase8 - msg93
			"\nSeLinux does not configurate\n",#fase8 - msg94
			"<p class=\"negativo\">SeLinux does not configurate</p>\n",#fase8 - msg95
			"<p>It is recommended to configure SeLinux</p>\n",#fase8 - msg96
			"\nFase 9.0 -- IPTABLES\n",#fase9 - msg97
			"<h3>Fase 9.0 -- IPTABLES</h3>\n",#fase9 - msg98
			"<p>It is recommended to analyze the listed access</p>\n",#fase9 - msg99
			"\nFase 10.0 -- Services\n",#fase10 - msg100
			"<h3>Fase 10.0 -- Services</h3>\n",#fase10 - msg101
			"<p>It is recommended to analyze the active services</p>\n",#fase10 - msg102
			"\nFase 11.0 -- Processes\n",#fase11- msg103
			"<h3>Fase 11.0 -- Processes</h3>\n",#fase11- msg104
			"<p>It is recommended to analyze the active processes</p>\n",#fase11 - msg105
			"\nFase 12.0 -- Connections\n",#fase12 - msg106
			"<h3>Fase 12.0 -- Connections</h3>\n",#fase12 - msg107
			"<p>It is recommended to analyze if the files in crond.daily are as expected</p>\n",#fase12 - msg108
			"\nFase 13.0 -- Hash de binarios\n",#fase13 - msg109
			"<h3>Fase 13.0 -- Binary Hash</h3>\n",#fase13 - msg110
			"<p>It is recommended to analyze the listed hashes with the Virus Total website</p>\n",#fase13 - msg111
			"\nFase 14.0 -- Sudoers configuration\n",#fase14 - msg112
			"<h3>Fase 14.0 -- Sudoers configuration</h3>\n",#fase14 - msg113
			"<p>It is recommended to analyze the listed sudoers configuration</p>\n",#fase14 - msg114
			"\nFase 15.0 -- Cron.Daily\n",#fase15 - msg115
			"<h3>Fase 15.0 -- Cron.Daily</h3>\n",#fase15 - msg116
			"<p>It is recommended to analyze if the files in crond.daily are as expected</p>\n",#fase15 - msg117
			"\nFase 16.0 -- Software versions\n",#fase16 - msg118
			"<h3>Fase 16.0 -- Software versions</h3>\n",#fase16 - msg119
			"<p>It is recommended to analyze if the listed software versions are the latest available branches and if no security issues have been reported for them</p>",#fase16 - msg120
			"\nFase 17.0 -- Network configuration\n",#fase17 - msg121
			"<h3>Fase 17.0 -- Network configuration</h3>\n",#fase17 - msg122
			"<p>It is recommended to analyze if the network configuration is as expected</p>\n",#fase17 - msg123
			"\nFase 17.1 -- Route verification\n",#fase17.1 - msg124
			"<h3>Fase 17.1 -- Route verification</h3>\n",#fase17.1 - msg125
			"<p>It is recommended to analyze the listed routes</p>\n",#fase17.1 - msg126
			"\nFase 17.2 -- Verify the Sysctl configuration\n",#fase17.2 - msg127
			"<h3>Fase 17.2 -- Verify the Sysctl configuration</h3>",#fase17.2 - msg128
			"\nFase 18.0 -- Verify the inittab level\n",#fase18 - msg129
			"<h3>Fase 18.0 -- Verify the inittab level</h3>\n",#fase18 - msg130
			"\nFase 18.1 -- Verify that ctrlaltdel is not active in inittab\n",#fase18.1 - msg131
			"<h3>Fase 18.1 -- Verify that ctrlaltdel is not active in inittab</h3>\n",#fase18.1 - msg132
			"\nFase 19.0 -- Samba configuration\n",#fase19 - msg133
			"<h3>Fase 19.0 -- Samba configuration</h3>\n",#fase19 - msg134
			"<p>It is recommended to analyze if the samba configuration is as expected</p>\n",#fase19 - msg135
			"<p>Samba does not configurate</p>\n",#fase19 - msg136
			"\nFase 20.0 -- NTP sincronization\n",#fase20 - msg137
			"<h3>Fase 20.0 -- NTP sincronization</h3>\n",#fase20 - msg138
			
			"\nThe Server is locally Syncronized\n",#fase20 - msg139
			"<p>The Server is locally Syncronized</p>",#fase20 - msg140
			"\nThe Server is syncronized by Remote Server\n",#fase20 - msg141
			"<p>The Server is syncronized by Remote Server</p>",#fase20 - msg142
			"\nThe Server is not syncronized\n",#fase20 - msg143
			"<p class=\"negativo\">Negative: The Server is not syncronized</p>\n",#fase20 - msg144
			"<p>It is recommended to synchronize the analyzed server with the companies NTP server</p>\n",#fase20 - msg145
        ],
    );
	
	
     
    our $idioma = es;                 # Idioma por defecto
     
    sub cambia_idioma { $idioma = $_[0] }   # Cambiar de idioma
     
    sub msg { $msg[$idioma][$_[0]] }        # Devolver mensaje
     
    our @EXPORT = qw(&cambia_idioma &msg);  # Exportación
     
    push @EXPORT, map { s/^Msg:://; $_ } keys %constant::declared;