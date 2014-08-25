#!/usr/bin/perl -w
 no warnings;
 use File::Find ();;
 use Digest::MD5;
 use lib 'libs';
 use Msg;
 use Exporter 'import';
use open qw(:std :utf8);
use Encode qw(decode_utf8);
 
 if ( @ARGV != 1 ) {
    die "\nUse: $0 <en/es>\n\n"
      . "   <en/es>     Seleccionar idioma/Select language\n";

}

my $Hostname=`uname -n`;
chomp $Hostname;
my $SistemaOperativoC=`uname -a`;
chomp $SistemaOperativoC;
## Muchas gracias a perl en español por la ayuda y Fara por la traduccion

## Si alguien quieren ayudarme a optimizar el codigo o "programar" como se debe es bienvenido.

##
## Se debe modificar la palabra que busca en la seccion del BANNER por el que usted quiera.
## 
# Modulos

use POSIX qw(strftime);
$dia= strftime("%Y%m%d", localtime);

our $miidioma = $ARGV[0];
chomp $miidioma;
if ($miidioma eq 'es'){
our $idioma_solicitado= es;
}
else {
our $idioma_solicitado= en;
}

chomp $idioma_solicitado;
cambia_idioma($idioma_solicitado);

open (F,">> $Hostname-$dia.html");
open (R,">> $Hostname-recomendations.html");

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

print F $Msg::msg[$Msg::idioma][0];
print F $Msg::msg[$Msg::idioma][1];

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

print R $Msg::msg[$Msg::idioma][2];
print R $Msg::msg[$Msg::idioma][1];

print R "<div id=\"css3-animated-example\">\n";
print "-" x 100;

# Fase 0.0 -- InformaciÃ³el Equipo/ System information
do 'fase0.pl';

# Fase 1.0 -- Informacion de los usuarios del sistema / System users information
do 'fase1.pl';

# Fase 1.1 -- Comprobacion de Usuarios/Grupos / Users/Groups check
do 'fase11.pl'; 

# Fase 1.2 -- Verificar que no existan cuentas con password vacias / Verify that there are no accounts configured with an empty password
do 'fase12.pl'; 

# Fase 1.3 -- Verificar que no existan usuarios con ID 0 / Verify that there are no users with ID 0
do 'fase13.pl'; 

# Fase 1.4 -- Verificacion del archivo login.defs / Verify the login.defs file
do 'fase14.pl'; 

# Fase 1.5 -- Ultimos usuarios agregados / Recent added users
do 'fase15.pl'; 

# Fase 1.6 -- Configuracion PAM / PAM Configuration
do 'fase16.pl'; 

# Fase 1.7 -- Ultimos usuarios conectados / Recent user logins
do 'fase17.pl'; 

# Fase 1.8 -- Ultimos comandos ejecutados por los usuarios / Recent commands executed by users
do 'fase18.pl';

# Fase 1.9 -- Relaciones de confianza / Trust relationships
do 'fase19.pl'; 

# Fase 1.10 -- Usuarios con acceso al sistema / Users with system access
do 'fase100.pl'; 

# Fase 1.11 -- Verificar que no existan usuarios con Grupo ID 0 / Verify that there are no users with Group ID 0
do 'fase111.pl'; 

# Fase 2.0 -- Eventos mediante Syslog - AUTHPRIV / Syslog events - AUTHPRIV
do 'fase2.pl'; 

# Fase 2.1 -- Eventos mediante Rsyslog - AUTHPRIV / Rsyslog events - AUTHPRIV
do 'fase21.pl'; 


# Fase 3.0 -- Verificar permisos en archivos y directorios / Verify file and directory permissions
do 'fase3.pl'; 


# Fase 3.1 -- Verificacion de Sticky Bit / Verify Sticky Bit
do 'fase31.pl'; 

# Fase 3.2 -- Verificar Archivos con write para todos los usuarios / Verify files with write privilege for all users
do 'fase32.pl'; 

# Fase 3.3 -- Verificacion de suid/gsid / Verify suid/gsid
do 'fase33.pl'; 
	
# Fase 3.4 -- Archivos sin owner y group / Files without owner and group
do 'fase34.pl'; 


# Fase 4.0 -- Archivo de autenticacion ftp / FTP authentication file
do 'fase4.pl'; 

# Fase 5.0 -- Cierre de conexión automático / Automatic connection close
do 'fase5.pl'; 


# Fase 6.0 -- Banner personalizado / Customized banner
do 'fase6.pl'; 

# Fase 7.0 -- Verificacion de la configuracion del servicio ssh / Verify the SSH service configuration
do 'fase7.pl'; 

# Fase 8.0 -- SeLinux
do 'fase8.pl'; 

# Fase 9.0 -- IPTABLES
do 'fase9.pl'; 

# Fase 10 -- Servicios / Services
do 'fase10.pl'; 

# Fase 11 -- Procesos / Processes
do 'fase1111.pl'; 

# Fase 12 -- Conexiones / Connections
do 'fase1212.pl'; 

# Fase 13 -- Hash de binarios / Binary Hash
do 'fase1313.pl'; 

# Fase 14 -- Configuracion de Sudoers  / Sudoers configuration
do 'fase1414.pl'; 

# Fase 15 -- Cron.Daily
do 'fase1515.pl'; 

# Fase 16 -- Versiones de softwares  / Software versions
do 'fase1616.pl'; 

# Fase 17 -- Configuración de Red  / Network configuration
do 'fase1717.pl'; 

# Fase 17.1 -- Verificación de rutas / Route verification
do 'fase171.pl'; 

# Fase 17.2 -- Verificacion configuración sysctl / Sysctl configuration
do 'fase172.pl'; 


# Fase 18 -- Verificar el nivel de inittab / Verify the inittab level
do 'fase1818.pl'; 

# Fase 18.1 -- Verificar que no este activo ctrlaltdel en inittab / Verify that ctrlaltdel is not active in inittab
do 'fase181.pl'; 

# Fase 19.0 -- Verificar configuracion samba / Samba configuration
do 'fase119.pl'; 

# Fase 20.0 -- Verificar sincronización NTP / NTP sincronization
do 'fase200.pl'; 

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
print "Information: Finish\n";
print "Information: Report $Hostname-$dia.html\n";
print "Information: Recomendations: $Hostname-recomendations.html\n";
print "-" x 100;
print "\n";

print F "</body>\n</html>\n";
print R "</body>\n</html>\n";
close (F);
close (R);




