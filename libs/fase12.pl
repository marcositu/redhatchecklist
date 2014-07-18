
use Term::ANSIColor qw(:constants);


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

