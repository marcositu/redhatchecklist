#!/usr/bin/perl -w
 no warnings;
 use File::Find ();
 use Digest::MD5;
 
## Muchas gracias a perl en español por la ayuda
## Si alguien quieren ayudarme a optimizar el codigo o "programar" como se debe es bienvenido.

##
## Se debe modificar la palabra que busca en la seccion del BANNER por el que usted quiera.
## 
# Modulos
use Term::ANSIColor qw(:constants);
use POSIX qw(strftime);
$dia= strftime("%Y%m%d", localtime);

 
# Variables Globales
my $SistemaOperativo=`uname`;
chomp $SistemaOperativo;
my $Release=`uname -r`;
chomp $Release;
my $Hostname=`hostname`;
chomp $Hostname;
my $SistemaOperativoC=`uname -a`;
chomp $SistemaOperativoC;
 
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


# ----------------------------------------------------------------------------------------
# Fase 0.0 -- Información del Equipo
# ----------------------------------------------------------------------------------------
print "-" x 100;
print " \nFase 0.0 -- Información del Equipo\n";
print F "<h3>Fase 0.0 -- Informaci&oacute;n del Equipo</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";
print "-" x 100;

print F "<p><b>Sistema Operativo:</b> $SistemaOperativo</p>";
print F "<p><b>Release del Kernel:</b> $Release</p>";
print F "<p><b>Hostname:</b> $Hostname</p>";
print F "<p><b>Datos Adicionales:</b> $SistemaOperativoC</p>";

print F "</div>\n";
print F "</div>\n";

print R "<h3>Fase 0.0 -- Informaci&oacute;n del Equipo</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";
print "-" x 100;

print R "<p><b>Sistema Operativo:</b> $SistemaOperativo</p>";
print R "<p><b>Release del Kernel:</b> $Release</p>";
print R "<p><b>Hostname:</b> $Hostname</p>";
print R "<p><b>Datos Adicionales:</b> $SistemaOperativoC</p>";

print R "</div>\n";
print R "</div>\n";



# ----------------------------------------------------------------------------------------
# Fase 1.0 -- Listado de los usuarios del sistema
# ----------------------------------------------------------------------------------------
print "-" x 100;
print " \nFase 1.0 -- Listado de los usuarios del sistema\n";
print F "<h3>Fase 1.0 -- Listado de los usuarios del sistema</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "<h3>Fase 1.0 -- Listado de los usuarios del sistema</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";

print "-" x 100;
open(USER,"/etc/passwd");

while (<USER>) {
       ($linea)=split(/\n/,$_,1); (@userdata)=split(/:/,$linea);
       $gid=$userdata[2];
       $username=$userdata[0];
print BOLD, WHITE, "\nInformacion:", RESET . " Usuario: $username\n";
print F"<p>$username</p>\n";
}

print R"<p>Se recomienda tener solamente los usuarios que va a ser utilizados</p>\n";
close(USER);
print F "</div>\n";
print F "</div>\n";

print R "</div>\n";
print R "</div>\n";


# ----------------------------------------------------------------------------------------
# Fase 1.1 -- Comprobacion de Usuarios/Grupos
# ----------------------------------------------------------------------------------------

print "-" x 100;
print " \nFase 1.1 -- Comprobacion de Usuarios/Grupos \n";
print F "<h3>Fase 1.1 -- Comprobacion de Usuarios/Grupos</h3>\n";
print R "<h3>Fase 1.1 -- Comprobacion de Usuarios/Grupos</h3>\n";
print "-" x 100;
use diagnostics;
print F "<div>\n";
print F "<div class=\"content\">\n";
print R "<div>\n";
print R "<div class=\"content\">\n";

### Leemos todos los usuarios
my %usuarios;
setpwent();                                                 ## Inicio de acceso al fichero passwd
while ( my($nombre,$passwd,$uid,$gid) = getpwent() ) {      ## Bucle por todos los usuarios
    $usuarios{$uid} = [ $nombre, $passwd, $gid ];
}
endpwent();                                                 ## Fin de acceso al fichero passwd

### Leemos todos los grupos
my %grupos;
setgrent();                                                 ## Inicio de acceso al fichero /etc/group
while ( my($nombre,$passwd,$gid,$miembros) = getgrent() ) { ## Bucle para todos los grupos
    $grupos{$gid} = [ $nombre, $passwd, $miembros ];
}
endgrent();                                                 ## Fin de acceso al fichero /etc/group

## Los usuarios pertenecen a un grupo (el grupo por defecto). La relación con ese grupo no
## suele estar reflejada en el fichero /etc/group.
## Aquí añadimos el usuario al conjunto de usuarios de su grupo por defecto.
## El efecto es igual que llamar al programa 'groups', que devuelve todos los grupos a los que
## pertenece el usuario
for my $uid ( keys %usuarios ) {
    my $gid = $usuarios{$uid}->[2];
    my $miembros_del_grupo = $grupos{$gid}->[2];
    if (!$miembros_del_grupo) {
        $grupos{$gid}->[2] = $usuarios{$uid}->[0];
    }
    elsif ($gid !~ /\b$miembros_del_grupo\b/) {
        $grupos{$gid}->[2] = join " ", $miembros_del_grupo, $usuarios{$uid}->[0];
    }
}

#use Data::Dumper;
#print Dumper \%usuarios;
#print Dumper \%grupos;

## Para cada usuario
for my $uid ( keys %usuarios ) {
    my $nombre = $usuarios{$uid}->[0];
    #print "Usuario: $nombre\n";

    ## Para todos los grupos de ese usuario
    for my $gid ( keys %grupos ) {
        next if $grupos{$gid}->[2] !~ /\b$nombre\b/;
        #print "\tGrupo: $gid, $grupos{$gid}->[0]\n";

        if ($gid < 500) {
        	 print BOLD, WHITE, "\nInformacion:", RESET . " El usuario $nombre pertenece al grupo $grupos{$gid}->[0] ($gid)\n";
             print F "<p>El usuario $nombre pertenece al grupo $grupos{$gid}->[0] ($gid)\n</p>\n";

        }
    }
}
print F "</div>\n";
print F "</div>\n";

print R "<p>Recomendamos analizar si los grupos creados y la asignaci&oacute;n de los usuarios es la requerida.\n</p>\n";
print R "</div>\n";
print R "</div>\n";

# ----------------------------------------------------------------------------------------
# Fase 1.2 -- Verificar que no existan cuentas con password vacias
# ----------------------------------------------------------------------------------------

print "-" x 100;
print " \nFase 1.2 -- Verificar que no existan cuentas con password vacias\n";
print F "  <h3>Fase 1.2 -- Verificar que no existan cuentas con password vacias</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "  <h3>Fase 1.2 -- Verificar que no existan cuentas con password vacias</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";


print "-" x 100;

open(SINPASSWD,"/etc/shadow");

while (<SINPASSWD>) {
       ($linea)=split(/\n/,$_,1); (@userdata)=split(/:/,$linea);
       $user=$userdata[0];
       $passwd=$userdata[1];
        if ($passwd eq "" || $passwd eq "NP") {
        print BOLD, RED, "\nNegativo:", RESET . " El usuario $user no tiene una contraseña asignada\n";
        print F "<p class=\"negativo\">El usuario $user no tiene una contrase&ntilde;a asignada</p>\n";
		print R "<p>El usuario $user no tiene una contrase&ntilde;a asignada. Recomendamos que se le asigne una contrase&ntilde;a al usuario.</p>\n";
        }
}
print F "</div>\n";
print F "</div>\n";
print R "</div>\n";
print R "</div>\n";
close (SINPASSWD);



# ----------------------------------------------------------------------------------------
# Fase 1.3 -- Verificar que no existan usuarios con ID 0
# ----------------------------------------------------------------------------------------

print "-" x 100;
print " \nFase 1.3 -- Verificar que no existan usuarios con ID 0\n";
print F "  <h3>Fase 1.3 -- Verificar que no existan usuarios con ID 0</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "  <h3>Fase 1.3 -- Verificar que no existan usuarios con ID 0</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";

print "-" x 100;

open(ID0PASSWD,"/etc/passwd");

while (<ID0PASSWD>) {
       ($linea)=split(/\n/,$_,1); (@userdata)=split(/:/,$linea);
       $user=$userdata[0];
       $id0=$userdata[2];
	   
	   if ($user ne "root")
	   {
			if ($id0 == 0) {
				print BOLD, RED, "\nNegativo:", RESET . " Negativo: El usuario $user  tiene definido ID 0\n";
				print F "<p class=\"negativo\">El usuario $user  tiene definido ID 0</p>\n";
				print R "<p>El usuario $user  tiene definido ID 0. Recomendamos analizar si los permisos asignados son los correctos</p>\n";
			}
		}
}


print F "</div>\n";
print F "</div>\n";

print R "</div>\n";
print R "</div>\n";
close (ID0PASSWD);


# ----------------------------------------------------------------------------------------
# Fase 1.4 -- Verificacion del archivo login.defs
# ----------------------------------------------------------------------------------------

print "-" x 100;
print " \nFase 1.4 -- Verificacion del archivo login.defs\n";
print F "  <h3>Fase 1.4 -- Verificaci&oacute;n del archivo login.defs</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "  <h3>Fase 1.4 -- Verificaci&oacute;n del archivo login.defs</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";

print "-" x 100;

    # Valores correctos esperados
    my %valores_correctos_de = (

        login_defs  => {
                        fichero    => '/etc/login.defs',
                        patron     => qr/^ (\S+) \s+ (\S+) $/xi,
                        parametros => {
                                        PASS_MAX_DAYS => 90,
                                        PASS_MIN_DAYS =>     7,
                                        PASS_WARN_AGE =>     7,
                                        UMASK  =>     '077',
                                        LOGIN_RETRIES  =>     3,
                                        LOGIN_TIMEOUT  =>     60,
                                        ENCRYPT_METHOD  =>     'SHA512',
										PASS_WARN_AGE =>     28,
										PASS_MIN_LEN  =>     6,
                                      },
                       },

    );

    # Arrancamos los anÃ¡sis
    analiza($valores_correctos_de{login_defs});

    # Subrutina que analiza
    sub analiza {
        my $hash_ref = shift;
        my($fichero, $regex, $valores_correctos_ref) = @{$hash_ref}{'fichero','patron','parametros'};

        # Leemos el fichero a un hash segÃºmo lo indique la expresiÃ³egular
        my %valor_actual_de;
        open my $fh, q[<], $fichero;
        while (<$fh>) {
            if (/$regex/) {
                $valor_actual_de{ $1 } = $2;
            }
        }

        close $fh;

        # Comprobamos los valores correctos
        for my $parametro (sort keys %$valores_correctos_ref) {
            if (exists $valor_actual_de{$parametro}) {
                if ($valor_actual_de{$parametro} eq $valores_correctos_ref->{$parametro}) {
                    #print BOLD, GREEN, 'Positivo: ', RESET, "El valor del parametro $parametro es correcto\n";
                }
                else {
                    print BOLD, RED  . '\nNegativo: '. RESET, "El valor del parametro $parametro es incorrecto: [$valor_actual_de{$parametro}]\n";
						print F "<p class=\"negativo\">Negativo: El valor $valor_actual_de{$parametro} del par&aacute;metro $parametro es incorrecto</p>\n";
						print R "<p>El valor $valor_actual_de{$parametro} del par&aacute;metro $parametro es incorrecto. Recomendamos configurar el par&aacute;metro con el valor $valores_correctos_ref->{$parametro}</p>\n";
                       
                }
            }
			else {
                print BOLD . '\nNo existe ' . RESET, "el parametro $parametro en $fichero\n";
				print F "<p class=\"negativo\">Negativo: El par&aacute;metro $parametro no existe</p>\n";
				print R "<p>El par&aacute;metro $parametro no existe. Recomendamos que se configure dicho par&aacute;metro.</p>\n";
            }
			
          }
    }


print F "</div>\n";
print F "</div>\n";

print R "</div>\n";
print R "</div>\n";


# ----------------------------------------------------------------------------------------
# Fase 1.5 -- Ultimos usuarios agregados
# ----------------------------------------------------------------------------------------

print "-" x 100;
print " \nFase 1.5 -- Ultimos usuarios agregados\n";
print F "  <h3>Fase 1.5 -- Ultimos usuarios agregados</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "  <h3>Fase 1.5 -- Ultimos usuarios agregados</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";
print "-" x 100;



$CONEXIONESCHECK=`diff -i --ignore-space-change  /etc/passwd- /etc/passwd | grep ">" | cut -d: -f1 | sed "s/> //g"`;
print BOLD, WHITE, "\nInformacion:", RESET . " $CONEXIONESCHECK\n";
print F"<p>$CONEXIONESCHECK</p>\n";
print R "<p>En el caso que existan usuarios agregados en el ultimo periodo, verificar que haya sido un requerimiento del servicio a prestar.</p>";		


print F "</div>\n";
print F "</div>\n";
print R "</div>\n";
print R "</div>\n";



# ----------------------------------------------------------------------------------------
# Fase 1.6 -- Configuracion PAM
# ----------------------------------------------------------------------------------------

print "-" x 100;
print " \nFase 1.6 -- Configuracion PAM\n";
print F "  <h3>Fase 1.6 -- Configuraci&oacute;n PAM</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "  <h3>Fase 1.6 -- Configuraci&oacute;n PAM</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";


print "-" x 100;

$CMDMINLEN=`grep -e password /etc/pam.d/system-auth | grep minlen | cut -d= -f2 | cut -d " " -f1`;
$CMRETRY=`grep -e password /etc/pam.d/system-auth | grep retry | cut -d= -f2 | cut -d " " -f1`;
$CMDUCREDIT=`grep -e password /etc/pam.d/system-auth | grep ucredit | cut -d= -f2 | cut -d " " -f1`;
$CMDDCREDIT=`grep -e password /etc/pam.d/system-auth | grep dcredit | cut -d= -f2 | cut -d " " -f1`;
$CMDLCREDIT=`grep -e password /etc/pam.d/system-auth | grep lcredit | cut -d= -f2 | cut -d " " -f1`;
$CMDOCREDIT=`grep -e password /etc/pam.d/system-auth | grep ocredit | cut -d= -f2 | cut -d " " -f1`;
$CMDDIFOK=`grep -e password /etc/pam.d/system-auth | grep difok | cut -d= -f2 | cut -d " " -f1`;


if  ($CMDMINLEN eq ""){
        print BOLD, RED, "\nNegativo:", RESET . " El parametro minlen no se encuentra configurado\n";
        print F "<p class=\"negativo\">Negativo: El par&aacute;metro minlen no se encuentra configurado</p>\n";
		print R "<p>Recomendamos configurar el par&aacute;metro minlen con el valor 8</p>\n";
    }
elsif ($CMDMINLEN == 8){
}

else {
		print BOLD, RED, "\nNegativo:", RESET . " El valor $CMDMINLEN del parametro minlen se encuentra mal configurado\n";
        print F "<p class=\"negativo\">Negativo: El valor $CMDMINLEN del par&aacute;metro minlen se encuentra mal configurado</p>\n";
		print R "<p>Recomendamos configurar el valor 8 en el par&aacute;metro minlen</p>\n";
}



if  ($CMRETRY eq ""){
        print BOLD, RED, "\nNegativo:", RESET . " El parametro retry no se encuentra configurado\n";
        print F "<p class=\"negativo\">Negativo: El par&aacute;metro retry no se encuentra configurado</p>\n";
		print R "<p>Recomendamos configurar el par&aacute;metro retry con el valor 3</p>\n";
    }
elsif ($CMRETRY == 3){
}

else {
		print BOLD, RED, "\nNegativo:", RESET . " El valor $CMRETRY del parametro retry se encuentra mal configurado\n";
        print F "<p class=\"negativo\">Negativo: El valor $CMRETRY del par&aacute;metro retry se encuentra mal configurado</p>\n";
		print R "<p>Recomendamos configurar el valor 3 en el par&aacute;metro retry</p>\n";
}
    
	
if  ($CMDUCREDIT eq ""){
        print BOLD, RED, "\nNegativo:", RESET . " El parametro ucredit no se encuentra configurado\n";
        print F "<p class=\"negativo\">Negativo: El par&aacute;metro ucredit no se encuentra configurado</p>\n";
		print R "<p>Recomendamos configurar el par&aacute;metro ucredit con el valor -1</p>\n";
    }
elsif ($CMDUCREDIT == -1){
}

else {
		print BOLD, RED, "Negativo:", RESET . " El valor $CMDUCREDIT del parametro ucredit se encuentra mal configurado\n";
        print F "<p class=\"negativo\">Negativo: El valor $CMDUCREDIT del par&aacute;metro ucredit se encuentra mal configurado</p>\n";
		print R "<p>Recomendamos configurar el valor -1 en el par&aacute;metro ucredit</p>\n";
}

if  ($CMDDCREDIT eq ""){
        print BOLD, RED, "\nNegativo:", RESET . " El parametro dcredit no se encuentra configurado\n";
        print F "<p class=\"negativo\">Negativo: El par&aacute;metro dcredit no se encuentra configurado</p>\n";
		print R "<p>Recomendamos configurar el par&aacute;metro dcredit con el valor -1</p>\n";
    }
elsif ($CMDDCREDIT == -1){
}

else {
		print BOLD, RED, "\nNegativo:", RESET . " El valor $CMDDCREDIT del parametro dcredit se encuentra mal configurado\n";
        print F "<p class=\"negativo\">Negativo: El valor $CMDDCREDIT del par&aacute;metro dcredit se encuentra mal configurado</p>\n";
		print R "<p>Recomendamos configurar el valor -1 en el par&aacute;metro dcredit</p>\n";
}

if  ($CMDLCREDIT eq ""){
        print BOLD, RED, "\nNegativo:", RESET . " El parametro lcredit no se encuentra configurado\n";
        print F "<p class=\"negativo\">Negativo: El par&aacute;metro lcredit no se encuentra configurado</p>\n";
		print R "<p>Recomendamos configurar el par&aacute;metro lcredit con el valor -1</p>\n";
    }
elsif ($CMDLCREDIT == -1){
}

else {
		print BOLD, RED, "\nNegativo:", RESET . " El valor $CMDLCREDIT del parametro lcredit se encuentra mal configurado\n";
        print F "<p class=\"negativo\">Negativo: El valor $CMDLCREDIT del par&aacute;metro lcredit se encuentra mal configurado</p>\n";
		print R "<p>Recomendamos configurar el valor -1 en el par&aacute;metro lcredit</p>\n";
}



if  ($CMDOCREDIT eq ""){
        print BOLD, RED, "\nNegativo:", RESET . " El parametro ocredit no se encuentra configurado\n";
        print F "<p class=\"negativo\">Negativo: El par&aacute;metro ocredit no se encuentra configurado</p>\n";
		print R "<p>Recomendamos configurar el par&aacute;metro ocredit con el valor -1</p>\n";
    }
elsif ($CMDOCREDIT == -1){
}

else {
		print BOLD, RED, "\nNegativo:", RESET . " El valor $CMDOCREDIT del parametro ocredit se encuentra mal configurado\n";
        print F "<p class=\"negativo\">Negativo: El valor $CMDOCREDIT del par&aacute;metro ocredit se encuentra mal configurado</p>\n";
		print R "<p>Recomendamos configurar el valor -1 en el par&aacute;metro ocredit</p>\n";
}



if  ($CMDDIFOK eq ""){
        print BOLD, RED, "\nNegativo:", RESET . " El parametro difok no se encuentra configurado\n";
        print F "<p class=\"negativo\">Negativo: El par&aacute;metro difok no se encuentra configurado</p>\n";
		print R "<p>Recomendamos configurar el par&aacute;metro difok con el valor 2</p>\n";
    }
elsif ($CMDDIFOK == 2){
}

else {
		print BOLD, RED, "\nNegativo:", RESET . " El valor $CMDDIFOK del parametro difok se encuentra mal configurado\n";
        print F "<p class=\"negativo\">Negativo: El valor $CMDDIFOK del par&aacute;metro difok se encuentra mal configurado</p>\n";
		print R "<p>Recomendamos configurar el valor 2 en el par&aacute;metro difok</p>\n";
}



print F "</div>\n";
print F "</div>\n";


print R "</div>\n";
print R "</div>\n";


# ----------------------------------------------------------------------------------------
# Fase 1.7 -- Ultimos usuarios conectados
# ----------------------------------------------------------------------------------------

print "-" x 100;
print " \nFase 1.7 -- Ultimos usuarios conectados\n";
print F "  <h3>Fase 1.7 -- &Uacute;ltimos usuarios conectados</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "  <h3>Fase 1.7 -- &Uacute;ltimos usuarios conectados</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";

print "-" x 100;

$ULTIMOSCHECK=`last  > /tmp/last_check.txt`;
                
# Leer un fichero de texto
my $filename = '/tmp/last_check.txt';
open INFILE,$filename;
my $linea;
while ( $linea = <INFILE>) {
    chomp($linea); 
    print BOLD, WHITE, "\nInformacion:", RESET . " $linea\n";
print F"<p>$linea</p>\n";
} 
close INFILE;

unlink '/tmp/last_check.txt';			

print F "</div>\n";
print F "</div>\n";

print R "<p>Verificar que las direcciones IP correspondan a los administradores del servidor</p>\n";
print R "</div>\n";
print R "</div>\n";

# ----------------------------------------------------------------------------------------
# Fase 1.8 -- Ultimos comandos ejecutados por los usuarios
# ----------------------------------------------------------------------------------------

print "-" x 100;
print " \nFase 1.8 -- Ultimos comandos ejecutados por los usuarios\n";
print F "  <h3>Fase 1.8 -- &Uacute;ltimos comandos ejecutados por los usuarios</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "  <h3>Fase 1.8 -- &Uacute;ltimos comandos ejecutados por los usuarios</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";
print "-" x 100;

open(SINPASSWD,"/etc/shadow");
while (<SINPASSWD>) {
       ($linea)=split(/\n/,$_,1); (@userdata)=split(/:/,$linea);
       $user=$userdata[0];
       $passwd=$userdata[1];

        if ($passwd =~ m/^\$/ ) {
                $filename = `grep -e "^$user" /etc/passwd | awk -F: {'print \$6'}`;
                chomp ($filename);
                $filename= "$filename/.bash_history";
                if( -e $filename){
                        open INFILE,$filename;
                        my $linea;
                        while ( $linea = <INFILE>) {
                                chomp($linea);
								print BOLD, WHITE, "\nInformacion:", RESET . " $user:\n$linea\n";
                                print F"<p><b>$user:</b>\n$linea</p>\n";
                        }
                }
        }
}
close (SINPASSWD);
close (INFILE);



close (SINPASSWD);
close (SINPASSWD2);		

print F "</div>\n";
print F "</div>\n";

print R "<p>Verificar que los comandos ejecutados sean propios de la administraci&oacute;n del servidor</p>\n";


print R "</div>\n";
print R "</div>\n";

# ----------------------------------------------------------------------------------------
# Fase 1.9 -- Relaciones de confianza
# ----------------------------------------------------------------------------------------

print "-" x 100;
print " \nFase 1.9 -- Relaciones de confianza\n";
print F "  <h3>Fase 1.9 -- Relaciones de confianza</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "  <h3>Fase 1.9 -- Relaciones de confianza</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";
print "-" x 100;

open(SINPASSWD,"/etc/shadow");
while (<SINPASSWD>) {
       ($linea)=split(/\n/,$_,1); (@userdata)=split(/:/,$linea);
       $user=$userdata[0];
       $passwd=$userdata[1];

        if ($passwd =~ m/^\$/ ) {
                $filename = `grep -e "^$user" /etc/passwd | awk -F: {'print \$6'}`;
                chomp ($filename);
                $filename= "$filename/.rhosts";
                if( -e $filename){
                        open INFILE,$filename;
                        my $linea;
                        while ( $linea = <INFILE>) {
                                chomp($linea);
								print BOLD, WHITE, "\nInformacion:", RESET . " usuario:$user / archivo: $filename / contenido: $linea<\n";
                                print F"<p><b>usuario:$user</b> / <b>archivo</b>:$filename / <b>contenido</b>:$linea</p>\n";
                        }
                }
        }
}
close (SINPASSWD);
close (INFILE);
close (SINPASSWD2);		

print F "</div>\n";
print F "</div>\n";


print R "<p>En el caso que existen relaciones de confianza, verificar que sean las requeridas.</p>\n";
print R "</div>\n";
print R "</div>\n";

# ----------------------------------------------------------------------------------------
# Fase 1.10 -- Usuarios con acceso al sistema
# ----------------------------------------------------------------------------------------
print "-" x 100;
print " \nFase 1.10 -- Usuarios con acceso al sistema\n";
print F "<h3>Fase 1.10 -- Usuarios con acceso al sistema</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "<h3>Fase 1.10 -- Usuarios con acceso al sistema</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";
print "-" x 100;

open(USER,"/etc/passwd");

while (<USER>) {
       ($linea)=split(/\n/,$_,1); (@userdata)=split(/:/,$linea);
       $tieneshell=$userdata[6];
       chomp ($tieneshell);
        $username=$userdata[0];
        chomp ($username);
       $gid=$userdata[2];
       chomp ($gid);
       if ($username ne "root" && $username ne "halt" && $username ne "sync" && $username ne "shutdown")
       {
       if ($tieneshell ne "/sbin/nologin" && $tieneshell ne "/bin/false" && $tieneshell ne "/usr/sbin/nologin")
        {
		open(SINPASSWD,"/etc/shadow");
		while (<SINPASSWD>) {
       ($linea)=split(/\n/,$_,1); (@userdata)=split(/:/,$linea);
	   $user=$userdata[0];
       $passwd=$userdata[1];
	   if ($username eq $user)
	   {
		if ($passwd ne "*" && $passwd ne "!" && $passwd ne "!!") {
        print BOLD, WHITE, "\nInformacion:", RESET . " Usuario: $user\n";
		print F"<p>$user</p>\n";
        }
	   }
	   
}

        }

      }


}


close (SINPASSWD);
close(USER);

print R "<p>Verificar que los usuarios nombrados en el informe sean los requerimientos para la administraci&oacute;n del servidor.</p>\n";

print F "</div>\n";
print F "</div>\n";

print R "</div>\n";
print R "</div>\n";

# ----------------------------------------------------------------------------------------
# Fase 2.0 -- Eventos mediante Syslog - AUTHPRIV
# ----------------------------------------------------------------------------------------

print "-" x 100;
print " \nFase 2.0 -- Eventos mediante Syslog - AUTHPRIV\n";
print F "  <h3>Fase 2.0 -- Eventos mediante Syslog - AUTHPRIV</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "  <h3>Fase 2.0 -- Eventos mediante Syslog - AUTHPRIV</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";


print "-" x 100;
my $aux=0;
my $archivo="/etc/syslog.conf";
chomp $file;
if  (`grep -v '^#' $archivo | grep -c '^authpriv'` ==  0){
    my $aux=1;
        print BOLD, RED, "Negativo:", RESET . " No esta habilitado la captura de eventos del sistema operativo mediante syslog\n";
        print F "<p class=\"negativo\">Negativo: No esta habilitado la captura de eventos del sistema operativo mediante syslog</p>\n";
		print R "<p>Se recomienda habilitar la captura de eventos del sistema operativo mediante syslog</p>\n";
    }
    else{
        #print  BOLD, GREEN, "Positivo:", RESET . " Esta seteado la captura de eventos del sistema operativo mediante syslog\n";
        #print F "<p class=\"positivo\">Positivo: Esta seteado la captura de eventos del sistema operativo mediante syslog</p>\n";
 
        }

if ("$aux" =="0"){
print BOLD, RED, "\nNegativo:", RESET . " El archivo $archivo no existe";
print F "<p class=\"negativo\">Negativo: El archivo $archivo no existe</p>\n";
print R "<p>El archivo $archivo no existe</p>\n";
 } 
		
		
print F "</div>\n";
print F "</div>\n";		

print R "</div>\n";
print R "</div>\n";	

print "-" x 100;



# ----------------------------------------------------------------------------------------
# Fase 2.1 -- Eventos mediante Rsyslog - AUTHPRIV
# ----------------------------------------------------------------------------------------


print " \nFase 2.1 -- Eventos mediante Rsyslog - AUTHPRIV\n";
print F "  <h3>Fase 2.1 -- Eventos mediante Rsyslog - AUTHPRIV</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "  <h3>Fase 2.1 -- Eventos mediante Rsyslog - AUTHPRIV</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";

print "-" x 100;
my $aux=0;
my $archivo="/etc/rsyslog.conf";
if  (`grep -v '^#' $archivo | grep -c '^authpriv'` ==  0){
    my $aux=1;
        print BOLD, RED, "\nNegativo:", RESET . " No esta habilitado la captura de eventos del sistema operativo mediante rsyslog\n";
		print F "<p class=\"negativo\">Negativo: No esta habilitado la captura de eventos del sistema operativo mediante rsyslog</p>\n";
		print R "<p>Se recomienda habilitar la captura de eventos del sistema operativo mediante syslog</p>\n";
    }
    else{
        #print BOLD, GREEN, "Positivo:", RESET . " Esta seteado la captura de eventos del sistema operativo mediante rsyslog\n";
        #print F "<p class=\"positivo\">Positivo: Esta seteado la captura de eventos del sistema operativo mediante rsyslog</p>\n";
 
          }
if ("$aux" =="0"){
print BOLD, RED, "\nNegativo:", RESET . " El archivo $archivo no existe";
print F "<p class=\"negativo\">Negativo: El archivo $archivo no existe</p>\n";
print R "<p>El archivo $archivo no existe</p>\n";
 } 
 
print F "</div>\n";
print F "</div>\n";	 

print R "</div>\n";
print R "</div>\n";	 

# ----------------------------------------------------------------------------------------
# Fase 3.0 -- Verificar permisos en archivos y directorios
# ----------------------------------------------------------------------------------------


print"\n----------------------------------------------------------------------------------------------------------------\n";
print " \nFase 3.0 -- Verificar permisos en archivos y directorios\n";
print F "  <h3>Fase 3.0 -- Verificar permisos en archivos y directorios</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "  <h3>Fase 3.0 -- Verificar permisos en archivos y directorios</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";


print "-" x 100;
my @archivos = ("/etc/passwd", "/etc/shadow", "/etc/group", "/etc/hosts", "/etc/fstab", "/etc/mtab", "/etc/inittab", "/etc/exports", "/etc/profile", "/etc/inetd.conf", "/etc/crontab", "/etc/hosts.allow", "/etc/hosts.deny", "/etc/ld.so.conf", "/etc/modules", "/etc/motd", "/etc/profile", "/etc/securetty", "/etc/syslog.conf");
foreach $varb (@archivos){

if (-e $varb){

$comando = (split " ",( qx(ls -l $varb ))[0] )[2];
chomp $comando;
if ( "$comando"  eq "root" ){
#print BOLD, GREEN, "Positivo:", RESET . " El archivo $varb tiene como owner root\n";
#print F "<p class=\"positivo\">Positivo: El archivo $varb tiene como owner root</p>\n";
 }
else
{
print BOLD, RED, "\nNegativo:", RESET . " El archivo $varb tiene como owner $comando\n";
print F "<p class=\"negativo\">Negativo: El archivo $varb tiene como owner $comando</p>\n";
print R "<p>Se recomienda analizar el owner del archivo $varb ya que tiene como owner $comando</p>\n";
}
}
}
my @directorios = ("/bin", "/boot", "/dev",  "/etc", "/etc/cron.daily", "/etc/cron.hourly", "/etc/cron.monthly", "/etc/cron.weekly", "/home/", "/lib/", "/mnt/", "/root/", "/sbin/", "/tmp/", "/usr/", "/usr/bin/", "/usr/sbin/", "/var/");

foreach $varb (@directorios){
if (-e $varb){

$comando1 = (split " ",( qx(ls -ld $varb ))[0] )[2];
chomp $comando1;
if ( "$comando1"  eq "root" ){
	
#print BOLD, GREEN, "Positivo:", RESET . " El directorio $varb tiene como owner root\n";
#print F "<p class=\"positivo\">Positivo: El directorio $varb tiene como owner root</p>\n";
        }
else
{
print BOLD, RED, "\nNegativo:", RESET . " El directorio $varb tiene como owner $comando1\n";
print F "<p class=\"negativo\">Negativo: El directorio $varb tiene como owner $comando1</p>\n";
print R "<p>Se recomienda analizar el owner del directorio $varb ya que tiene como owner $comando1</p>\n";
}
}
}

my @archivos1 = ("/etc/pam.conf", "/etc/named.conf", "/etc/ftpaccess", "/etc/ftpusers", "/etc/bashrc", "/etc/aliases", "/etc/passwd", "/etc/group", "/etc/hosts", "/etc/fstab", "/etc/mtab", "/etc/inittab", "/etc/exports", "/etc/profile", "/etc/inetd.conf", "/etc/crontab", "/etc/hosts.allow", "/etc/hosts.deny", "/etc/inetd.conf", "/etc/ld.so.conf", "/etc/modules", "/etc/motd", "/etc/profile", "/etc/securetty", "/etc/syslog.conf");

foreach $varb (@archivos1){
if (-e $varb){

$comando2 = (split " ",( qx(ls -l $varb ))[0] )[0];
chomp $comando2;
if ( "$comando2"  eq "-rw-r--r--" ){
#print BOLD, GREEN, "Positivo:", RESET . " El archivo $varb tiene como permisos -rw-r--r--\n";
#print F "<p class=\"positivo\">Positivo: El archivo $varb tiene como permisos -rw-r--r--</p>\n";
        }
else
{
print BOLD, RED, "\nNegativo:", RESET . " El archivo $varb tiene como permisos $comando2\n";
print F "<p class=\"negativo\">Negativo: El archivo $varb tiene como permisos $comando2</p>\n";
print R "<p>Se recomienda analizar los permisos del archivo $varb ya que tiene como permisos $comando2</p>\n";
}
}
}

my @directorios1 = ("/bin", "/boot", "/dev",  "/etc", "/etc/cron.daily", "/etc/cron.hourly", "/etc/cron.monthly", "/etc/cron.weekly", "/home/", "/lib/", "/mnt/", "/root/", "/sbin/", "/tmp/", "/usr/", "/usr/bin/", "/usr/sbin/", "/var/");

foreach $varb (@directorios1){
if (-e $varb){

$comando3 = (split " ",( qx(ls -ld $varb ))[0] )[0];
chomp $comando3;
if ( "$comando3"  eq "drwxr-xr-x" ){
#print BOLD, GREEN, "Positivo:", RESET . " El directorio $varb tiene como permisos drwxr-xr-x\n";
#print F "<p class=\"positivo\">Positivo: El directorio $varb tiene como permisos drwxr-xr-x</p>\n";
        }
else
{
print BOLD, RED, "\nNegativo:", RESET . " El directorio $varb tiene como permisos $comando3\n";
print F "<p class=\"negativo\">Negativo: El directorio $varb tiene como permisos $comando3</p>\n";
print R "<p>Se recomienda analizar los permisos del directorio $varb ya que tiene como permisos $comando3</p>\n";
}
}
}

my @archivos4 = ("/etc/shadow");

foreach $varb (@archivos4){
if (-e $varb){
$comando4 = (split " ",( qx(ls -l $varb ))[0] )[0];
chomp $comando4;
if ( "$comando4"  eq "-rw-r-----" ){
#print BOLD, GREEN, "Positivo:", RESET . " El archivo $varb tiene como permisos -rw-r-----\n";
#print F "<p class=\"positivo\">Positivo: El archivo $varb tiene como permisos -rw-r-----</p>\n";
        }
else
{
print BOLD, RED, "\nNegativo:", RESET . " El archivo $varb tiene como permisos $comando4\n";
print F "<p class=\"negativo\">Negativo: El archivo $varb tiene como permisos $comando4</p>\n";
}
}
}

print F "</div>\n";
print F "</div>\n";	

print R "</div>\n";
print R "</div>\n";	

# ----------------------------------------------------------------------------------------
# Fase 3.1 -- Verificacion de Sticky Bit
# ----------------------------------------------------------------------------------------


print "-" x 100;
print " \nFase 3.1 -- Verificacion de Sticky Bit\n";
print F "<h3>Fase 3.1 -- Verificacion de Sticky Bit</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "<h3>Fase 3.1 -- Verificacion de Sticky Bit</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";

print "-" x 100;
use vars qw/*name *dir *prune/;
*name   = *File::Find::name;
*dir    = *File::Find::dir;
*prune  = *File::Find::prune;

sub wanted;


# Traverse desired filesystems
File::Find::find({wanted => \&wanted}, '/');


sub wanted {
    my ($dev,$ino,$mode,$nlink,$uid,$gid);

    (($dev,$ino,$mode,$nlink,$uid,$gid) = lstat($_)) and
    !($File::Find::prune |= ($dev != $File::Find::topdev)) and
    -d _ and
    (
        (($mode & 01000) == 01000)
    ) and
    
print BOLD, WHITE, "\nInformacion:",RESET . " Se detecto sticky bit en $name\n" and
print F "<p class=\"negativo\">Informacion: Directorio con sticky bit $name</p>\n" and
print R "<p>Verificar si el permiso de sticky bit del directorio $name es requerido.</p>\n";
}

print F "</div>\n";
print F "</div>\n";	

print R "</div>\n";
print R "</div>\n";	

print "-" x 100;


# ----------------------------------------------------------------------------------------
# Fase 3.2 -- Verificar Archivos con write para todos los usuarios
# ----------------------------------------------------------------------------------------


print " \nFase 3.1 -- Verificar archivos/directorios con permisos de escritura para todos los usuarios\n";
print F "<h3>Fase 3.2 -- Verificar archivos/directorios con permisos de escritura para todos los usuarios</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "<h3>Fase 3.2 -- Verificar archivos/directorios con permisos de escritura para todos los usuarios</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";

print "-" x 100;
use vars qw/*name *dir *prune/;
*name   = *File::Find::name;
*dir    = *File::Find::dir;
*prune  = *File::Find::prune;

sub wanted1;

# Traverse desired filesystems
File::Find::find({wanted => \&wanted1}, '/');

sub wanted1 {
    my ($dev,$ino,$mode,$nlink,$uid,$gid);

    (($dev,$ino,$mode,$nlink,$uid,$gid) = lstat($_)) and
    !($File::Find::prune |= ($dev != $File::Find::topdev)) and
    -f _ and
    (
        (($mode & 02) == 02) and
        ! (($mode & 01000) == 01000)
    ) and

    print BOLD,RED, "\nNegativo:", RESET . " Archivo/Directorio con permisos de escritura para todos los usuarios $name\n" and
print F "<p class=\"negativo\">Negativo: Archivo/Directorio con permisos de escritura para todos los usuarios $name</p>\n" and
print R "<p>Verificar si el permisos de escritura para todos los usuarios del $name es el requerido</p>\n";
}

print F "</div>\n";
print F "</div>\n";	

print R "</div>\n";
print R "</div>\n";	



# ----------------------------------------------------------------------------------------
# Fase 3.3 -- Verificacion de suid/gsid
# ----------------------------------------------------------------------------------------


print "-" x 100;
print " \nFase 3.3 -- Verificacion de suid/gsid\n";
print F "<h3>Fase 3.3 -- Verificacion de suid/gsid</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "<h3>Fase 3.3 -- Verificacion de suid/gsid</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";

print "-" x 100;
# for the convenience of &wanted calls, including -eval statements:
use vars qw/*name *dir *prune/;
*name   = *File::Find::name;
*dir    = *File::Find::dir;
*prune  = *File::Find::prune;

sub wanted2;

# Traverse desired filesystems
File::Find::find({wanted => \&wanted2}, '/');

sub wanted2 {
    my ($dev,$ino,$mode,$nlink,$uid,$gid);

    (($dev,$ino,$mode,$nlink,$uid,$gid) = lstat($_)) and
    !($File::Find::prune |= ($dev != $File::Find::topdev)) and
    (
        (($mode & 04000) == 04000)
        ||
        (($mode & 02000) == 02000)
    ) and
    -f _ and

         print BOLD, WHITE, "\nInformacion:", RESET . " Se detecto suid/gsid en $name\n" and
         print F "<p class=\"negativo\">Informacion: Se detecto suid/gsid en $name</p>\n" and
		 print F "<p>Verificar si el permiso de suid/gsid en $name es el requerido</p>\n"
        }

print F "</div>\n";
print F "</div>\n";			

print R "</div>\n";
print R "</div>\n";			


# ----------------------------------------------------------------------------------------
# Fase 3.4 -- Archivos sin owner y group
# ----------------------------------------------------------------------------------------


print "-" x 100;
print " \nFase 3.4 -- Archivos sin owner y group\n";
print F "<h3>Fase 3.4 -- Archivos sin owner y group</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "<h3>Fase 3.4 -- Archivos sin owner y group</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";

print "-" x 100;
use vars qw/*name *dir *prune/;
*name   = *File::Find::name;
*dir    = *File::Find::dir;
*prune  = *File::Find::prune;

sub wanted3;

my (%uid, %user);
while (my ($name, $pw, $uid) = getpwent) {
    $uid{$name} = $uid{$uid} = $uid;
}

my (%gid, %group);
while (my ($name, $pw, $gid) = getgrent) {
    $gid{$name} = $gid{$gid} = $gid;
}


# Traverse desired filesystems
File::Find::find({wanted => \&wanted3}, '/');

sub wanted3 {
    my ($dev,$ino,$mode,$nlink,$uid,$gid);

    (($dev,$ino,$mode,$nlink,$uid,$gid) = lstat($_)) and
    !($File::Find::prune |= ($dev != $File::Find::topdev)) and
    !exists $uid{$uid}
    ||
    !exists $gid{$gid} and

        print BOLD, RED, "\nNegativo:", RESET . " Archivo sin owner/group $name\n" and
		print F "<p class=\"negativo\">Negativo: Archivo sin owner/group $name</p>\n" and
		print R "<p>Asignarle un owner/group a $name</p>\n"
        }
print F "</div>\n";
print F "</div>\n";	


print R "</div>\n";
print R "</div>\n";	

# ----------------------------------------------------------------------------------------
# Fase 4.0 -- Archivo de autenticacion ftp
# ----------------------------------------------------------------------------------------


print "-" x 100;
print " \nFase 4.0 -- Archivo de autenticacion ftp\n";
print F "<h3>Fase 4.0 -- Archivo de autenticacion ftp</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "<h3>Fase 4.0 -- Archivo de autenticacion ftp</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";


print "-" x 100;
use vars qw/*name *dir *prune/;
*name   = *File::Find::name;
*dir    = *File::Find::dir;
*prune  = *File::Find::prune;

sub wanted5;

File::Find::find({wanted => \&wanted5}, '/');


sub wanted5 {
    /^\.netrc\z/s and
print BOLD, RED, "\nNegativo:", RESET . " Archivo de autenticacion ftp $name\n" and
print F "<p class=\"negativo\">Negativo: Archivo de autenticacion ftp $name</p>\n" and
print R "<p>Verificar si el archivos de autenticacion ftp $name es requerido</p>\n";
        }


print F "</div>\n";
print F "</div>\n";	

print R "</div>\n";
print R "</div>\n";	
		
# ----------------------------------------------------------------------------------------
# Fase 5.0 -- Cierre de conexión automático
# ----------------------------------------------------------------------------------------
		
print "-" x 100;
print " \nFase 5.0 -- Cierre de conexión automático\n";
print F "<h3>Fase 5.0 -- Cierre de conexi&oacute;n autom&aacute;tico</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "<h3>Fase 5.0 -- Cierre de conexi&oacute;n autom&aacute;tico</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";


print "-" x 100;

if  (`grep -v '^#' /etc/profile | grep -c '^export TMOUT'` ==  0){
        print BOLD, RED, "\nNegativo:", RESET . " el archivo /etc/profile no contiene la variable TMOUT configurada\n";
        print F "<p class=\"negativo\">Negativo: El archivo /etc/profile no contiene la variable TMOUT configurada</p>\n";
		print R "<p>Recomendamos configurar el par&aacute;metro TMOUT en el archivo /etc/profile</p>\n";
    }
    else{
        #print  BOLD, GREEN, "Positivo:", RESET . " El archivo /etc/profile contiene la variable TMOUT configurada\n";
        #print F "<p> El archivo /etc/profile contiene la variable TMOUT configurada</p>\n";
 
          }
		  
print F "</div>\n";
print F "</div>\n";	

print R "</div>\n";
print R "</div>\n";	



# ----------------------------------------------------------------------------------------
# Fase 6.0 -- Banner personalizado
# ----------------------------------------------------------------------------------------
print "-" x 100;
print " \nFase 6.0 -- Banner personalizado\n";
print F "<h3>Fase 6.0 -- Banner personalizado</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";


print R "<h3>Fase 6.0 -- Banner personalizado</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";


print "-" x 100;

$bannerpersona= `head -n2  /etc/issue | grep Cablevis`;

if($bannerpersona eq ""){
print BOLD, RED, "\nNegativo:", RESET . " El banner no se encuentra personalizado\n";
print F "<p class=\"negativo\">El banner no se encuentra personalizado</p>\n";
print R "<p>Recomendamos personalizar el banner del servidor.</p>\n";

}

print F "</div>\n";
print F "</div>\n";

print R "</div>\n";
print R "</div>\n";


# ----------------------------------------------------------------------------------------
# Fase 7.0 -- Verificacion de la configuracion del servicio ssh
# ----------------------------------------------------------------------------------------

print "-" x 100;
print " \nFase 7.0 -- Verificacion de la configuracion del servicio ssh\n";
print F "  <h3>Fase 7.0 -- Verificacion de la configuracion del servicio ssh</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "  <h3>Fase 7.0 -- Verificacion de la configuracion del servicio ssh</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";


print "-" x 100;

 # Valores correctos esperados
    my %valores_correctos_de = (
     
                        sshd_config => {
                        fichero    => '/etc/ssh/sshd_config',
                        patron     => qr/^ (\S+) \s* (\S+) $/xi,
                        parametros => {
                                        ListenAddress               => '10.246',
                                        PermitRootLogin             =>  'no',
                                        PasswordAuthentication      =>  'yes',
										Protocol      =>  2,
										Banner      =>  '/etc/issue',
										X11Forwarding      =>  'no',
										MaxAuthTries      =>  3,
										IgnoreRhosts      =>  'yes',
										HostbasedAuthentication      =>  'no',
										PermitEmptyPasswords      =>  'no',
										PermitUserEnvironment      =>  'no',
										ClientAliveInterval      =>  300,
										ClientAliveCountMax      =>  0,
                                      },
                       },
    );
     
    # Arrancamos los análisis
    analiza($valores_correctos_de{sshd_config});
     
    # Subrutina que analiza
    sub analiza {
        my $hash_ref = shift;
        my($fichero, $regex, $valores_correctos_ref) = @{$hash_ref}{'fichero','patron','parametros'};
     
        # Leemos el fichero a un hash según cómo lo indique la expresión regular
        my %valor_actual_de;
        open my $fh, q[<], $fichero;
        while (<$fh>) {
            if (/$regex/) {
                $valor_actual_de{ $1 } = $2;
            }
        }
     
        close $fh;
     
        # Comprobamos los valores correctos
        for my $parametro (sort keys %$valores_correctos_ref) {
            if (exists $valor_actual_de{$parametro}) {
                if ($valor_actual_de{$parametro} eq $valores_correctos_ref->{$parametro}) {
                    #print BOLD, GREEN, 'Positivo: ', RESET, "El valor del parametro $parametro es correcto\n";
                }
                else {
                    print
                        BOLD, RED  , '\nNegativo: ', RESET,
                        "El valor del parametro $parametro es incorrecto: ",
                        "$valor_actual_de{$parametro}\n",
                        ;
					print F "<p class=\"negativo\">Negativo: El valor $valor_actual_de{$parametro} del par&aacute;metro $parametro es incorrecto</p>\n";
					print R "<p>Recomendamos configurar el valor $valores_correctos_ref->{$parametro} del par&aacute;metro $parametro</p>\n";
                }
            }
           else {
                print BOLD . '\nNo existe ' . RESET, "El parametro $parametro\n";
				print F "<p class=\"negativo\">Negativo: El par&aacute;metro $parametro no existe</p>\n";
				print R "<p>Recomendamos configurar el par&aacute;metro $parametro con el valor $valores_correctos_ref->{$parametro} </p>\n";
            }
        }
    }
	
	$CHECKAllowUsers=`grep "^AllowUsers" /etc/ssh/sshd_config`;
    if ($CHECKAllowUsers eq "")
	{
	print BOLD . '\nNo existe ' . RESET, "El par&aacute;metro AllowUsers no existe en el archivo /etc/ssh/sshd_config\n";
	print F "<p class=\"negativo\">Negativo: El par&aacute;metro AllowUsers no existe</p>\n";	
	print R "<p>Se recomienda configurar el par&aacute;metro AllowUsers</p>\n";	
	}
	else 
	{
	print F"<p class=\"informacion\">$CHECKAllowUsers</p>\n"; 
	}
	
	$CHECKGroups=`grep "^AllowGroups" /etc/ssh/sshd_config`;
    if ($CHECKGroups eq "")
	{
	print BOLD . '\nNo existe ' . RESET, "El par&aacute;metro AllowGroups no existe en el archivo /etc/ssh/sshd_config\n";
	print F "<p class=\"negativo\">Negativo: El par&aacute;metro AllowGroups no existe</p>\n";	
	print R "<p>Se recomienda configurar el par&aacute;metro AllowGroups</p>\n";
	}
	else 
	{
	print F"<p class=\"informacion\">$CHECKGroups</p>\n"; 
	}
	
	$CHECKDenyUsers=`grep "^DenyUsers" /etc/ssh/sshd_config`;
    if ($CCHECKDenyUsers eq "")
	{
	print BOLD . '\nNo existe ' . RESET, "El par&aacute;metro DenyUsers no existe en el archivo /etc/ssh/sshd_config\n";
	print F "<p class=\"negativo\">Negativo: El par&aacute;metro DenyUsers no existe</p>\n";	
	print R "<p>Se recomienda configurar el par&aacute;metro DenyUsers</p>\n";
	}
	else 
	{
	print F"<p class=\"informacion\">$CHECKDenyUsers</p>\n"; 
	}
	
	$CHECKDenyGroups=`grep "^DenyGroups" /etc/ssh/sshd_config`;
    if ($CHECKDenyGroups eq "")
	{
	print BOLD . '\nNo existe ' . RESET, "El par&aacute;metro DenyGroups no existe en el archivo /etc/ssh/sshd_config\n";
	print F "<p class=\"negativo\">Negativo: El par&aacute;metro DenyGroups no existe</p>\n";	
	print R "<p>Se recomienda configurar el par&aacute;metro DenyGroups</p>\n";
	}
	else 
	{
	print F"<p class=\"informacion\">$CHECKDenyGroups</p>\n"; 
	}
	
	
	

print F "</div>\n";
print F "</div>\n";

print R "</div>\n";
print R "</div>\n";


# ----------------------------------------------------------------------------------------
# Fase 8.0 -- SeLinux
# ----------------------------------------------------------------------------------------

print "-" x 100;
print " \nFase 8.0 -- SeLinux\n";
print F "  <h3>Fase 8.0 -- SeLinux</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "  <h3>Fase 8.0 -- SeLinux</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";


print "-" x 100;

$selinuxon= `/usr/sbin/sestatus`;

if($selinuxon =~ /disabled/){
print BOLD, RED, "\nNegativo:", RESET . " SeLinux se encuentra desactivado\n";
print F "<p class=\"negativo\">SeLinux se encuentra desactivado</p>\n";

}

print R "<p>Se recomienda configurar el y activar SeLinux</p>\n";
print F "</div>\n";
print F "</div>\n";

print R "</div>\n";
print R "</div>\n";
close (SELINUXCFG);


# ----------------------------------------------------------------------------------------
# Fase 9.0 -- IPTABLES
# ----------------------------------------------------------------------------------------

print "-" x 100;
print " \nFase 9.0 -- IPTABLES\n";
print F "  <h3>Fase 9.0 -- IPTABLES</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "  <h3>Fase 9.0 -- IPTABLES</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";


print "-" x 100;

$IPTABLELIST=`/sbin/iptables -L > /tmp/iptables_check.txt`;
                
# Leer un fichero de texto
my $filename = '/tmp/iptables_check.txt';
open INFILE,$filename;
my $linea;
while ( $linea = <INFILE>) {
    chomp($linea); 
    print BOLD, WHITE, "\nInformacion:", RESET . " $linea\n";
print F"<p>$linea</p>\n";
} 
close INFILE;

unlink '/tmp/iptables_check.txt';			


print R "<p>Se recomienda analizar las listas de acceso</p>\n";

print F "</div>\n";
print F "</div>\n";

print R "</div>\n";
print R "</div>\n";

# ----------------------------------------------------------------------------------------
# Fase 10.0 -- Servicios
# ----------------------------------------------------------------------------------------

print "-" x 100;
print " \nFase 10.0 -- Servicios\n";
print F "  <h3>Fase 10.0 -- Servicios</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "  <h3>Fase 10.0 -- Servicios</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";

print "-" x 100;

$SERVICIOSCHECK=`/sbin/chkconfig --list > /tmp/servicios_check.txt`;
                
# Leer un fichero de texto
my $filename = '/tmp/servicios_check.txt';
open INFILE,$filename;
my $linea;
while ( $linea = <INFILE>) {
    chomp($linea); 
    print BOLD, WHITE, "\nInformacion:", RESET . " $linea\n";
print F"<p>$linea</p>\n";
} 
close INFILE;

unlink '/tmp/servicios_check.txt';			

print F "</div>\n";
print F "</div>\n";



# ----------------------------------------------------------------------------------------
# Fase 11.0 -- Procesos
# ----------------------------------------------------------------------------------------

print "-" x 100;
print " \nFase 11.0 -- Procesos\n";
print F "  <h3>Fase 11.0 -- Procesos</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";
print "-" x 100;

$PROCESOSCHECK=`ps -fea > /tmp/procesos_check.txt`;
                
# Leer un fichero de texto
my $filename = '/tmp/procesos_check.txt';
open INFILE,$filename;
my $linea;
while ( $linea = <INFILE>) {
    chomp($linea); 
    print BOLD, WHITE, "\nInformacion:", RESET . " $linea\n";
print F"<p>$linea</p>\n";
} 
close INFILE;

unlink '/tmp/procesos_check.txt';			


print R "<p>Se recomienda analizar si los servicios activos son los esperados</p>\n";
print F "</div>\n";
print F "</div>\n";

print R "</div>\n";
print R "</div>\n";



# ----------------------------------------------------------------------------------------
# Fase 12.0 -- Conexiones
# ----------------------------------------------------------------------------------------

print "-" x 100;
print " \nFase 12.0 -- Conexiones\n";
print F "  <h3>Fase 12.0 -- Conexiones</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "  <h3>Fase 12.0 -- Conexiones</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";

print "-" x 100;

$CONEXIONESCHECK=`/usr/sbin/lsof -i  > /tmp/conexiones_check.txt`;
                
# Leer un fichero de texto
my $filename = '/tmp/conexiones_check.txt';
open INFILE,$filename;
my $linea;
while ( $linea = <INFILE>) {
    chomp($linea); 
    print BOLD, WHITE, "\nInformacion:", RESET . " $linea\n";
print F"<p>$linea</p>\n";
} 
close INFILE;

unlink '/tmp/conexiones_check.txt';			

print R "<p>Se recomienda analizar si las conexiones son las esperadas</p>\n";

print F "</div>\n";
print F "</div>\n";

print R "</div>\n";
print R "</div>\n";


# ----------------------------------------------------------------------------------------
# Fase 13.0 -- Hash de binarios
# ----------------------------------------------------------------------------------------

print "-" x 100;
print " \nFase 13.0 -- Hash de binarios\n";
print F "  <h3>Fase 13.0 -- Hash de binarios</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "  <h3>Fase 13.0 -- Hash de binarios</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";

print "-" x 100;

use Digest::MD5;

sub md5sum
{
  my $file = shift;
  my $digest = "";
  eval{
    open(FILE, $file);
    my $ctx = Digest::MD5->new;
    $ctx->addfile(*FILE);
    $digest = $ctx->hexdigest;
    close(FILE);
  };
  if($@){
    print $@;
    return "";
  }
  return $digest;
}

my @archivos = ("/usr/sbin/ping6","/usr/sbin/ethtool","/usr/sbin/groupadd","/usr/sbin/groupdel","/usr/sbin/groupmod","/usr/sbin/hald","/usr/sbin/logrotate","/usr/sbin/lsof","/usr/sbin/luseradd","/usr/sbin/mtr","/usr/sbin/NetworkManager","/usr/sbin/ntpd","/usr/sbin/ntptime","/usr/sbin/tcpd","/usr/sbin/sshd","/usr/sbin/sendmail","/usr/sbin/rpcinfo","/usr/sbin/tcpdump","/usr/sbin/useradd","/usr/sbin/userdel","/usr/sbin/usermod","/usr/sbin/visudo","/sbin/arp","/sbin/chkconfig","/sbin/hwclock","/sbin/dhclient","/sbin/e2fsck","/sbin/ethtool","/sbin/halt","/sbin/ifconfig","/sbin/init","/sbin/ip","/sbin/iptables","/sbin/iwconfig","/sbin/lspci","/sbin/lsmod","/sbin/lsusb","/sbin/mke2fs","/sbin/mkfs","/sbin/portmap","/sbin/route","/sbin/rmmod","/sbin/service","/sbin/tc","/sbin/tune2fs","/sbin/tune2fs","/sbin/vconfig");

foreach $varb (@archivos){

my $fname = $varb;
my $md5 =  md5sum($fname);

if($md5 ne ""){
                print $md5." ".$fname."\n";
				print BOLD, WHITE, "\nInformacion:", RESET . $md5." ".$fname."\n";
				print F"<p>$md5 $fname</p>\n";
        }
		
}


print R "<p>Se recomienda analizar los hash listados en el informe en el sitio de Virus Total</p>\n";

print F "</div>\n";
print F "</div>\n";

print R "</div>\n";
print R "</div>\n";



# ----------------------------------------------------------------------------------------
# Fase 14.0 -- Configuracion de Sudoers 
# ----------------------------------------------------------------------------------------

print "-" x 100;
print " \nFase 14.0 -- Configuracion de Sudoers\n";
print F "  <h3>Fase 14.0 -- Configuraci&oacute;n de Sudoers </h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "  <h3>Fase 14.0 -- Configuraci&oacute;n de Sudoers </h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";

print "-" x 100;

$SUDOCHECK=`grep -v "#" /etc/sudoers | sed '/^[ ]*\$/d'  > /tmp/sudousers_check.txt`;
                
# Leer un fichero de texto
my $filename = '/tmp/sudousers_check.txt';
open INFILE,$filename;
my $linea;
while ( $linea = <INFILE>) {
    chomp($linea); 
    print BOLD, WHITE, "\nInformacion:", RESET . " $linea\n";
print F "<p>$linea</p>\n";
} 
close INFILE;

unlink '/tmp/sudousers_check.txt';			


print R "<p>Se recomienda analizar si la configuraci&oacute;n de sudoers sea la esperada</p>\n";
print F "</div>\n";
print F "</div>\n";

print R "</div>\n";
print R "</div>\n";


# ----------------------------------------------------------------------------------------
# Fase 15.0 -- Cron.Daily
# ----------------------------------------------------------------------------------------

print "-" x 100;
print " \nFase 15.0 -- Cron.Daily\n";
print F "  <h3>Fase 15.0-- Cron.Daily</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "  <h3>Fase 15.0-- Cron.Daily</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";

print "-" x 100;

$dirtoget="/etc/cron.daily/";
opendir(IMD, $dirtoget) || die("Cannot open directory");
@thefiles= readdir(IMD);
closedir(IMD);


foreach $f (@thefiles)
{
 unless ( ($f eq ".") || ($f eq "..") )
 {
 print BOLD, WHITE, "\nInformacion:", RESET . " /etc/cron.daily/$f\n";
 print F "<p>/etc/cron.daily/$f</p>\n";
 }
}
	
print R "<p>Se recomienda analizar si los archivos situados en el crond.daily son los esperados.</p>\n";
print F "</div>\n";
print F "</div>\n";

print R "</div>\n";
print R "</div>\n";

# ----------------------------------------------------------------------------------------
# Fase 16.0 -- Versiones de softwares
# ----------------------------------------------------------------------------------------

print "-" x 100;
print " \nFase 16.0 -- Versiones de softwares\n";
print F "  <h3>Fase 16.0 -- Versiones de softwares</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";


print R "  <h3>Fase 16.0 -- Versiones de softwares</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";

print "-" x 100;

$SSHSLCHECK=`ssh -V &> /tmp/sshversion_check.txt`;
$OPENSSLCHECK=`openssl version`;
# Leer un fichero de texto
my $filename = '/tmp/sshversion_check.txt';
open INFILE,$filename;
my $linea;
while ( $linea = <INFILE>) {
    chomp($linea); 
    print BOLD, WHITE, "\nInformacion:", RESET . " $linea\n";
print F "<p>$linea</p>\n";
} 
close INFILE;


 print BOLD, WHITE, "\nInformacion:", RESET . " $OPENSSLCHECK\n";
 print F "<p>$OPENSSLCHECK</p>\n";

unlink 'sshversion_check.txt';		

print R "<p>Se recomienda analizar si las versiones de los softwares listados son las ultimas y si se encuentran fuera de problemas de seguridad.</p>\n";

print F "</div>\n";
print F "</div>\n";

print R "</div>\n";
print R "</div>\n";


# ----------------------------------------------------------------------------------------
# Fase 17.0 -- Configuración de Red
# ----------------------------------------------------------------------------------------

print "-" x 100;
print " \nFase 17.0 -- Configuración de Red\n";
print F "  <h3>Fase 17.0 -- Configuraci&oacute;n de Red</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "  <h3>Fase 17.0 -- Configuraci&oacute;n de Red</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";

print "-" x 100;

$REDCHECK=`/sbin/ip addr show &> /tmp/redcheck_check.txt`;


# Leer un fichero de texto
my $filename = '/tmp/redcheck_check.txt';
open INFILE,$filename;
my $linea;
while ( $linea = <INFILE>) {
    chomp($linea); 
    print BOLD, WHITE, "\nInformacion:", RESET . " $linea\n";
print F "<p>$linea</p>\n";
} 
close INFILE;

unlink '/tmp/redcheck_check.txt';		

print R "<p>Se recomienda analizar si la configuraci&oacute;n de red es la esperada.</p>\n";


print F "</div>\n";
print F "</div>\n";

print R "</div>\n";
print R "</div>\n";


# ----------------------------------------------------------------------------------------
# Fase 17.1 -- Rutas
# ----------------------------------------------------------------------------------------

print "-" x 100;
print " \nFase 17.1 -- Rutas\n";
print F "  <h3>Fase 17.1 -- Rutas</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "  <h3>Fase 17.1 -- Rutas</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";

print "-" x 100;

$REDCHECK=`/sbin/ip route show &> /tmp/rutascheck_check.txt`;


# Leer un fichero de texto
my $filename = '/tmp/rutascheck_check.txt';
open INFILE,$filename;
my $linea;
while ( $linea = <INFILE>) {
    chomp($linea); 
    print BOLD, WHITE, "\nInformacion:", RESET . " $linea\n";
print F "<p>$linea</p>\n";
} 
close INFILE;

unlink '/tmp/rutascheck_check.txt';		

print R "<p>Se recomienda analizar si la configuraci&oacute;n de ruteo es la esperada.</p>\n";

print F "</div>\n";
print F "</div>\n";

print R "</div>\n";
print R "</div>\n";


# ------------------------------------------------- ---------------------------------------
# Fase 17.2 -- Verificacion configuración sysctl
# ----------------------------------------------------------------------------------------

print "-" x 100;
print " \nFase 17.2 -- Verificacion configuración sysctl\n";
print F "  <h3>Fase 17.2 -- Verificacion configuración sysctl</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "  <h3>Fase 17.2 -- Verificacion configuración sysctl</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";

print "-" x 100;

    # Valores correctos esperados
    my %valores_correctos_de = (

        login_defs  => {
                        fichero    => '/etc/sysctl.conf',
                        patron     => qr/^ (\S+) \s* = \s* (\S+) $/xi,
                        parametros => {
                                        net.ipv4.ip_forward => 0,
                                        net.ipv4.conf.all.send_redirects =>     0,
                                        net.ipv4.conf.default.send_redirects =>     0,
                                        net.ipv4.tcp_max_syn_backlog  =>     1080,
                                        net.ipv4.icmp_echo_ignore_broadcasts  =>     1,
                                        net.ipv4.conf.all.accept_source_route  =>     0,
                                        net.ipv4.conf.all.accept_redirects  =>     0,
										net.ipv4.conf.all.secure_redirects =>     0,
										net.ipv4.conf.all.log_martians =>     1,
										net.ipv4.conf.default.accept_source_route =>     0,
										net.ipv4.conf.default.accept_redirects =>     0,
										net.ipv4.conf.default.secure_redirects =>     0,
										net.ipv4.icmp_echo_ignore_broadcasts =>     1,
										net.ipv4.icmp_ignore_bogus_error_responses =>     1,
										net.ipv4.tcp_syncookies =>     1,
										net.ipv4.conf.all.rp_filter =>     1,
										net.ipv4.conf.default.rp_filter =>     1,
										net.ipv4.tcp_timestamps =>     0,
                                      },
                       },

    );

    # Arrancamos los anÃ¡sis
    analiza($valores_correctos_de{login_defs});

    # Subrutina que analiza
    sub analiza {
        my $hash_ref = shift;
        my($fichero, $regex, $valores_correctos_ref) = @{$hash_ref}{'fichero','patron','parametros'};

        # Leemos el fichero a un hash segÃºmo lo indique la expresiÃ³egular
        my %valor_actual_de;
        open my $fh, q[<], $fichero;
        while (<$fh>) {
            if (/$regex/) {
                $valor_actual_de{ $1 } = $2;
            }
        }

        close $fh;

        # Comprobamos los valores correctos
        for my $parametro (sort keys %$valores_correctos_ref) {
            if (exists $valor_actual_de{$parametro}) {
                if ($valor_actual_de{$parametro} eq $valores_correctos_ref->{$parametro}) {
                    #print BOLD, GREEN, 'Positivo: ', RESET, "El valor del parametro $parametro es correcto\n";
                }
                else {
                    print BOLD, RED  . '\nNegativo: '. RESET, "El valor del parametro $parametro es incorrecto: [$valor_actual_de{$parametro}]\n";
						print F "<p class=\"negativo\">Negativo: El valor $valor_actual_de{$parametro} del par&aacute;metro $parametro es incorrecto</p>\n";
						print R "<p>El valor $valor_actual_de{$parametro} del par&aacute;metro $parametro es incorrecto. Recomendamos configurar el par&aacute;metro con el valor $valores_correctos_ref->{$parametro}</p>\n";
                       
                }
            }
			else {
                print BOLD . '\nNo existe ' . RESET, "el parametro $parametro en $fichero\n";
				print F "<p class=\"negativo\">Negativo: El par&aacute;metro $parametro no existe</p>\n";
				print R "<p>El par&aacute;metro $parametro no existe. Recomendamos que se configure dicho par&aacute;metro.</p>\n";
            }
			
          }
    }


print F "</div>\n";
print F "</div>\n";

print R "</div>\n";
print R "</div>\n";



# ----------------------------------------------------------------------------------------
# Fase 18.0 -- Verificar el nivel de inittab
# ----------------------------------------------------------------------------------------

print "-" x 100;
print " \nFase 18.0 -- Verificar el nivel de inittab\n";
print F "  <h3>Fase 18.0 -- Verificar el nivel de inittab</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "  <h3>Fase 18.0 -- Verificar el nivel de inittab</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";

print "-" x 100;

$REDCHECK=`grep ':initdefault' /etc/inittab | cut -d: -f2 &> /tmp/initcheck_check.txt`;


# Leer un fichero de texto
my $filename = '/tmp/initcheck_check.txt';
open INFILE,$filename;
my $linea;
while ( $linea = <INFILE>) {
    chomp($linea); 
	if ($linea != 3){
	print BOLD, RED, "\nNegativo:", RESET . " El valor $linea del par&aacute;metro initdefault es incorrecto\n";
	print F "<p class=\"negativo\">Negativo: El valor $linea del par&aacute;metro initdefault es incorrecto</p>\n";
	print R"<p>Se recomienda configurar el valor 3 sobre el par&aacute;metro initdefault</p>\n";

	}
} 
close INFILE;

unlink '/tmp/initcheck_check.txt';		

print F "</div>\n";
print F "</div>\n";

print R "</div>\n";
print R "</div>\n";


# ----------------------------------------------------------------------------------------
# Fase 18.1 -- Verificar que no este activo ctrlaltdel en inittab
# ----------------------------------------------------------------------------------------

print "-" x 100;
print " \nFase 18.1 -- Verificar que no este activo ctrlaltdel en inittab\n";
print F "  <h3>Fase 18.1 -- Verificar que no este activo ctrlaltdel en inittab</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "  <h3>Fase 18.1 -- Verificar que no este activo ctrlaltdel en inittab</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";

print "-" x 100;

$REDCHECK=`grep -e "^ca" /etc/inittab | cut -d: -f3 &> /tmp/initctrlcheck_check.txt`;

# Leer un fichero de texto
my $filename = '/tmp/initctrlcheck_check.txt';
open INFILE,$filename;
my $linea;
while ( $linea = <INFILE>) {
    chomp($linea); 
	if ($linea eq "ctrlaltdel") {
	print BOLD, RED, "\nNegativo:", RESET . " Se puede reiniciar el servidor con la combinación de teclas ctrlaltdel\n";
	print F "<p class=\"negativo\">Negativo: Se puede reiniciar el servidor con la combinaci&oacute;n de teclas ctrlaltdel</p>\n";
	print R"<p>Se recomienda analizar si es parte de la administraci&oacute;n del servidor esta combinaci&oacute;n de teclas</p>\n";

	}
} 
close INFILE;

unlink '/tmp/initctrlcheck_check.txt';		

print F "</div>\n";
print F "</div>\n";

print R "</div>\n";
print R "</div>\n";

# ----------------------------------------------------------------------------------------
# Fase 19.0 -- Verificar configuracion samba
# ----------------------------------------------------------------------------------------

print "-" x 100;
print " \nFase 19.0 -- Verificar configuración samba\n";
print F "  <h3>Fase 19.0 -- Verificar configuraci&oacute;n samba</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "  <h3>Fase 19.0 -- Verificar configuraci&oacute;n samba</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";

print "-" x 100;

$SMBCHECK=`grep -v -e \"#\" -e \";\" /etc/samba/smb.conf | sed '/^[ ]*\$/d'&> /tmp/smbcheck_check.txt`;


# Leer un fichero de texto
my $filename = '/tmp/smbcheck_check.txt';
open INFILE,$filename;
my $linea;
while ( $linea = <INFILE>) {
    chomp($linea); 
    print BOLD, WHITE, "\nInformacion:", RESET . " $linea\n";
	print F "<p>$linea</p>\n";
} 
close INFILE;

unlink '/tmp/smbcheck_check.txt';		

print R "<p>Se recomienda analizar si la configuraci&oacute;n de SMB es la esperada.</p>\n";

print F "</div>\n";
print F "</div>\n";

print R "</div>\n";
print R "</div>\n";


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
print BOLD, YELLOW, "Informacion:", RESET . " Se da por finalizado el proceso de chequeo\n";
print BOLD, YELLOW, "Informacion:", RESET . " El reporte fue salvado con el nombre: $Hostname-$dia.html\n";
print "-" x 100;

print F "</body>\n</html>\n";
print R "</body>\n</html>\n";
close (F);
close (R);



