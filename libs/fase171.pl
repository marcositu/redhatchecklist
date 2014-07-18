
use Term::ANSIColor qw(:constants);

# ----------------------------------------------------------------------------------------
# # Fase 17.1 -- Verificaci�n de rutas
# ----------------------------------------------------------------------------------------

print "-" x 100;
print " \nFase 17.1 -- Verificaci�n de rutas\n";
print F "  <h3>Fase 17.1 -- Verificaci&oacute;n de rutas</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "  <h3>Fase 17.1 -- Verificaci&oacute;n de rutas</h3>\n";
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
