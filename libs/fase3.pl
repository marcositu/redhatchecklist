
use Term::ANSIColor qw(:constants);


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
