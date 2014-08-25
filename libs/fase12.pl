#!/usr/bin/perl -w

use lib 'libs';
use Msg;
use open qw(:std :utf8);
use Encode qw(decode_utf8);
cambia_idioma($idioma_solicitado);
# ----------------------------------------------------------------------------------------
# Fase 1.2 -- Verificar que no existan cuentas con password vacias / Verify that there are no accounts configured with an empty password
# ----------------------------------------------------------------------------------------
print "-" x 100;
print $Msg::msg[$Msg::idioma][12];

print F $Msg::msg[$Msg::idioma][13];
print R $Msg::msg[$Msg::idioma][13];

print F "<div>\n";
print F "<div class=\"content\">\n";
print R "<div>\n";
print R "<div class=\"content\">\n";


print "-" x 100;
print "\n";
open(SINPASSWD,"/etc/shadow");

while (<SINPASSWD>) {
       ($linea)=split(/\n/,$_,1); (@userdata)=split(/:/,$linea);
       $user=$userdata[0];
       $passwd=$userdata[1];
        if ($passwd eq "" || $passwd eq "NP") {
		
			if ($miidioma eq "es")
			{
		  	print "\nNegativo: El usuario $user no tiene una contrase&ntilde;a asignada\n";
			print F "<p class=\"negativo\">El usuario $user no tiene una contrase&ntilde;a asignada</p>\n";
			print R "<p>El usuario $user no tiene una contrase&ntilde;a asignada. Recomendamos que se le asignarle una.</p>\n";
			 }
		else {
			 print "\nNegative: The user $user does not have an assigned password\n";
			print F "<p class=\"negativo\">The user $user does not have an assigned password</p>\n";
			print R "<p>The user $user does not have an assigned password. It is recommended to assign one.</p>\n";
		}
		
        }
}
print F "</div>\n";
print F "</div>\n";
print R "</div>\n";
print R "</div>\n";
close (SINPASSWD);

