#!/usr/bin/perl -w
 no warnings;
 use File::Find ();;
 use Digest::MD5;
 use lib 'libs';
my $Hostname=`hostname`;
chomp $Hostname;
## Muchas gracias a perl en español por la ayuda
## Si alguien quieren ayudarme a optimizar el codigo o "programar" como se debe es bienvenido.

##
## Se debe modificar la palabra que busca en la seccion del BANNER por el que usted quiera.
## 
# Modulos
use Term::ANSIColor qw(:constants);
use POSIX qw(strftime);
$dia= strftime("%Y%m%d", localtime);

open (F,">> $Hostname-$dia.html");
open (R,">> $Hostname-$dia-recomendaciones.html");

print F "<!DOCTYPE html>\n";
print F "<html lang=\"es\">\n";
print F "<head>\n";
print F "<meta charset=\"utf-8\">";
print F "<title>Revision de Configuracion - RedHat </title>\n";
print F "<link rel=\"stylesheet\" href=\"demo.css\">\n";
print F "<meta name=\"viewport\" content=\"width=device-width\">\n";
print F "<script>document.documentElement.className = \"js\";</script>\n";
print F "<script src=\"vendor/jquery-1.8.1.js\"></script>\n";
print F "<script src=\"vendor/json2.js\"></script>\n";
print F "<script src=\"src/jquery.collapse.js\"></script>\n";
print F "<script src=\"src/jquery.collapse_storage.js\"></script>\n";
print F "<script src=\"src/jquery.collapse_cookie_storage.js\"></script>\n";
print F "</head>\n";
print F "<body>\n";
print F "<h1>An&aacute;lisis de seguridad - Informe</h1>";
print F "<p>Cabe aclarar que si algunos items estan vacios significa que la configuraci&oacute;n esta correcta. <a href=\"$Hostname-$dia-recomendaciones.html\"><button type=\"button\" class=\"button-warning pure-button\">Recomendaciones</button></a></p>";
print F "<div id=\"css3-animated-example\">\n";

print R "<!DOCTYPE html>\n";
print R "<html lang=\"es\">\n";
print R "<head>\n";
print R "<meta charset=\"utf-8\">";
print R "<title>Recomendaciones de Configuracion - RedHat </title>\n";
print R "<link rel=\"stylesheet\" href=\"demo.css\">\n";
print R "<meta name=\"viewport\" content=\"width=device-width\">\n";
print R "<script>document.documentElement.className = \"js\";</script>\n";
print R "<script src=\"vendor/jquery-1.8.1.js\"></script>\n";
print R "<script src=\"vendor/json2.js\"></script>\n";
print R "<script src=\"src/jquery.collapse.js\"></script>\n";
print R "<script src=\"src/jquery.collapse_storage.js\"></script>\n";
print R "<script src=\"src/jquery.collapse_cookie_storage.js\"></script>\n";
print R "</head>\n";
print R "<body>\n";
print R "<h1>An&aacute;lisis de seguridad - Recomendaciones</h1>\n";
print R "<p>Cabe aclarar que si algunos items estan vacios significa que la configuraci&oacute;n esta correcta. <a href=\"$Hostname-$dia.html\"><button type=\"button\" class=\"button-warning pure-button\">Informe</button></a></p>";
print R "<div id=\"css3-animated-example\">\n";
print "-" x 100;
print BOLD, YELLOW, "Sistema Operativo:", RESET . " $SistemaOperativo\n";
print BOLD, YELLOW, "Release del Kernel:", RESET . " $Release\n";
print BOLD, YELLOW, "Hostname:", RESET . " $Hostname\n";
print BOLD, YELLOW, "Datos Adicionales:", RESET . " $SistemaOperativoC\n";
print "\n";

# Fase 0.0 -- InformaciÃ³el Equipo
require "fase0.pl";

# Fase 1.0 -- Listado de los usuarios del sistema
require "fase1.pl";

# Fase 1.1 -- Comprobacion de Usuarios/Grupos
require "fase11.pl"; 

# Fase 1.2 -- Verificar que no existan cuentas con password vacias
require "fase12.pl"; 

# Fase 1.3 -- Verificar que no existan usuarios con ID 0
require "fase13.pl"; 

# Fase 1.4 -- Verificacion del archivo login.defs
require "fase14.pl"; 


# Fase 1.5 -- Ultimos usuarios agregados
require "fase15.pl"; 


# Fase 1.6 -- Configuracion PAM
require "fase16.pl"; 

# Fase 1.7 -- Ultimos usuarios conectados
require "fase17.pl"; 

# Fase 1.8 -- Ultimos comandos ejecutados por los usuarios
require "fase18.pl"; 

# Fase 1.9 -- Relaciones de confianza
require "fase19.pl"; 


# Fase 1.9 -- Relaciones de confianza
require "fase19.pl"; 

# Fase 2.0 -- Eventos mediante Syslog - AUTHPRIV
require "fase2.pl"; 

# Fase 2.1 -- Eventos mediante Rsyslog - AUTHPRIV
require "fase21.pl"; 

# Fase 3.0 -- Verificar permisos en archivos y directorios
require "fase3.pl"; 

# Fase 3.1 -- Verificacion de Sticky Bit
require "fase31.pl"; 

# Fase 3.2 -- Verificar Archivos con write para todos los usuarios
require "fase32.pl"; 

# Fase 3.3 -- Verificacion de suid/gsid
require "fase33.pl"; 
	
# Fase 3.4 -- Archivos sin owner y group
require "fase34.pl"; 

# Fase 4.0 -- Archivo de autenticacion ftp
require "fase4.pl"; 

# Fase 5.0 -- Cierre de conexión automático
require "fase5.pl"; 

# Fase 6.0 -- Banner personalizado
require "fase6.pl"; 

# Fase 7.0 -- Verificacion de la configuracion del servicio ssh
require "fase7.pl"; 

# Fase 8.0 -- SeLinux
require "fase8.pl"; 

# Fase 9.0 -- IPTABLES
require "fase9.pl"; 

# Fase 10.0 -- Servicios
require "fase10.pl"; 

# Fase 11.0 -- Procesos
require "fase1111.pl"; 

# Fase 12.0 -- Conexiones
require "fase1212.pl"; 

# Fase 13.0 -- Hash de binarios
require "fase1313.pl"; 

# Fase 14.0 -- Configuracion de Sudoers 
require "fase1414.pl"; 

# Fase 15.0 -- Cron.Daily
require "fase1515.pl"; 

# Fase 16.0 -- Versiones de softwares
require "fase1616.pl"; 

# Fase 17.0 -- Configuración de Red
require "fase1717.pl"; 

# Fase 17.1 -- Verificación de rutas
require "fase171.pl"; 

# Fase 17.2 -- Verificacion configuración sysctl
require "fase172.pl"; 

# Fase 18.0 -- Verificar el nivel de inittab
require "fase1818.pl"; 

# Fase 18.1 -- Verificar que no este activo ctrlaltdel en inittab
require "fase1818.pl"; 

# Fase 19.0 -- Verificar configuracion samba
require "fase119.pl"; 

# Fase 20.0 -- Verificar sincronización NTP
require "fase200.pl"; 

print F "
 <script>
        \$(\"#css3-animated-example\").collapse({
          accordion: true,
          persist: true,
          open: function() {
            this.addClass(\"open\");
            this.css({ height: this.children().outerHeight() });
          },
          close: function() {
            this.css({ height: \"0px\" });
            this.removeClass(\"open\");
          }
        });
      </script>
";  


print R "
 <script>
        \$(\"#css3-animated-example\").collapse({
          accordion: true,
          persist: true,
          open: function() {
            this.addClass(\"open\");
            this.css({ height: this.children().outerHeight() });
          },
          close: function() {
            this.css({ height: \"0px\" });
            this.removeClass(\"open\");
          }
        });
      </script>
";   


print F "</div>\n";
print R "</div>\n";
print "-" x 100;
print "\n";
print BOLD, YELLOW, "Informacion:", RESET . " Se da por finalizado el proceso de chequeo\n";
print BOLD, YELLOW, "Informacion:", RESET . " El reporte fue salvado con el nombre: $Hostname-$dia.html\n";
print BOLD, YELLOW, "Informacion:", RESET . " El reporte de las recomendaciones fue salvado con el nombre: $Hostname-$dia-recomendaciones.html\n";
print "-" x 100;
print "\n";

print F "</body>\n</html>\n";
print R "</body>\n</html>\n";
close (F);
close (R);



