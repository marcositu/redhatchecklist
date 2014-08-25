#!/usr/bin/perl -w

use lib 'libs';
use Msg;
use open qw(:std :utf8);
use Encode qw(decode_utf8);
cambia_idioma($idioma_solicitado);
no warnings;



# ----------------------------------------------------------------------------------------
# Fase 1.11 -- Verificar que no existan usuarios con Grupo ID 0 / Verify that there are no users with Group ID 0
# ----------------------------------------------------------------------------------------
print "-" x 100;
print $Msg::msg[$Msg::idioma][56];

print F $Msg::msg[$Msg::idioma][57];
print F "<div>\n";
print F "<div class=\"content\">\n";

print R $Msg::msg[$Msg::idioma][57];
print R "<div>\n";
print R "<div class=\"content\">\n";

print "-" x 100;

open(ID0PASSWD,"/etc/passwd");

while (<ID0PASSWD>) {
       ($linea)=split(/\n/,$_,1); (@userdata)=split(/:/,$linea);
       $user=$userdata[0];
       $id0=$userdata[3];
	   
	   if ($user ne "root" && $user ne "halt" && $user ne "sync" && $user ne "shutdown" && $user ne "operator")
	   {
			if ($id0 == 0) {
		 
		 if ($miidioma eq "es") {
			print "\nEl usuario $user tiene definido Grupo ID 0\n";
				print F "<p class=\"negativo\">El usuario $user  tiene definido Grupo ID 0</p>\n";
				print R "<p>El usuario $user  tiene definido Grupo ID 0. Recomendamos analizar si los permisos asignados son los correctos</p>\n";
		}
			 
		else {
			print "\nThe user $user has ID 0 configured\n";
				print F "<p class=\"negativo\">The user $user has ID 0 configured</p>\n";
				print R "<p>The user $user has ID 0 configured. It is recommended to analyze if the assigned privileges are correct.</p>\n";
		}
		 
			}
		}
		}

print F "</div>\n";
print F "</div>\n";

print R "</div>\n";
print R "</div>\n";
close (ID0PASSWD);
