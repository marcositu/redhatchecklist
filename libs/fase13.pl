
use Term::ANSIColor qw(:constants);


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
