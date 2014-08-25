#!/usr/bin/perl -w

use lib 'libs';
use Msg;
use open qw(:std :utf8);
use Encode qw(decode_utf8);
cambia_idioma($idioma_solicitado);
no warnings;

# ----------------------------------------------------------------------------------------
# Fase 3.0 -- Verificar permisos en archivos y directorios / Verify file and directory permissions
# ----------------------------------------------------------------------------------------

print $Msg::msg[$Msg::idioma][68];
print F $Msg::msg[$Msg::idioma][69];
print F "<div>\n";
print F "<div class=\"content\">\n";

print R $Msg::msg[$Msg::idioma][69];
print R "<div>\n";
print R "<div class=\"content\">\n";


print "-" x 100;
my @archivos = ("/etc/passwd", "/etc/group", "/etc/hosts", "/etc/fstab", "/etc/mtab", "/etc/inittab", "/etc/exports", "/etc/profile", "/etc/inetd.conf", "/etc/crontab", "/etc/hosts.allow", "/etc/hosts.deny", "/etc/ld.so.conf", "/etc/modules", "/etc/motd", "/etc/profile", "/etc/syslog.conf");
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

if ($miidioma eq "es") {
			
print "\nEl archivo $varb tiene como owner $comando\n";
print F "<p class=\"negativo\">Negativo: El archivo $varb tiene como owner $comando</p>\n";
print R "<p>Se recomienda analizar el owner del archivo $varb ya que tiene como owner $comando</p>\n";
		}
			 
		else {
			
print "\nThe $varb file's owner is $comando\n";
print F "<p class=\"negativo\">Negative: The $varb file's owner is $comando</p>\n";
print R "<p>It is recommended to analyze $varb file's owner. The current owner is $comando</p>\n";
		}

}
}
}
my @directorios = ("/bin", "/boot", "/dev",  "/etc", "/etc/cron.daily", "/etc/cron.hourly", "/etc/cron.monthly", "/etc/cron.weekly", "/home/", "/lib/", "/mnt/", "/sbin/", "/usr/", "/usr/bin/", "/usr/sbin/", "/var/");


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
if ($miidioma eq "es") {
			
print "\nEl directorio $varb tiene como owner $comando1\n";
print F "<p class=\"negativo\">Negativo: El directorio $varb tiene como owner $comando1</p>\n";
print R "<p>Se recomienda analizar el owner del directorio $varb ya que tiene como owner $comando1</p>\n";
		}
			 
		else {
			
print "\nThe $varb directory's owner is $comando1\n";
print F "<p class=\"negativo\">Nevative: The $varb directory's owner is $comando1</p>\n";
print R "<p>It is recommended to analyze $varb directory's owner. The current owner is $comando1</p>\n";
		}
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
if ($miidioma eq "es") {
			
print "\nEl archivo $varb tiene como permisos $comando2\n";
print F "<p class=\"negativo\">Negativo: El archivo $varb tiene como permisos $comando2</p>\n";
print R "<p>Se recomienda analizar los permisos del archivo $varb ya que tiene como permisos $comando2</p>\n";
		}
			 
		else {
			
print "\nThe $varb file's permission is $comando2\n";
print F "<p class=\"negativo\">Negative: The $varb file's permission is $comando2</p>\n";
print R "<p>It is recommended to analyze $varb file's permission. The current permission is $comando2</p>\n";
		}
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
if ($miidioma eq "es") {
			
print "\nEl directorio $varb tiene como permisos $comando3\n";
print F "<p class=\"negativo\">Negativo: El directorio $varb tiene como permisos $comando3</p>\n";
print R "<p>Se recomienda analizar los permisos del directorio $varb ya que tiene como permisos $comando3</p>\n";
		}
			 
		else {
			
print "\nThe $varb file's permission is $comando2\n";
print F "<p class=\"negativo\">Negative: The $varb directory's permission is $comando3</p>\n";
print R "<p>It is recommended to analyze $varb directory's permission. The current permission is $comando3</p>\n";
		}
}
}
}

my @archivos4 = ("/etc/shadow");

foreach $varb (@archivos4){
if (-e $varb){
$comando4 = (split " ",( qx(ls -l $varb ))[0] )[0];
chomp $comando4;
if ( "$comando4"  eq "-r--------" ){
#print BOLD, GREEN, "Positivo:", RESET . " El archivo $varb tiene como permisos -rw-r-----\n";
#print F "<p class=\"positivo\">Positivo: El archivo $varb tiene como permisos -rw-r-----</p>\n";
        }
else
{
if ($miidioma eq "es") {
			
print "\nEl archivo $varb tiene como permisos $comando4\n";
print F "<p class=\"negativo\">Negativo: El archivo $varb tiene como permisos $comando4</p>\n";
print R "<p>Se recomienda analizar los permisos del directorio $varb ya que tiene como permisos $comando4</p>\n";
		}
			 
		else {
			
print "\nThe $varb file's permission is $comando4\n";
print F "<p class=\"negativo\">Negative: The $varb file's permission is $comando4</p>\n";
print R "<p>It is recommended to analyze $varb file's permission. The current permission is $comando4</p>\n";
		}
}
}
}

print F "</div>\n";
print F "</div>\n";	

print R "</div>\n";
print R "</div>\n";	
