
use Term::ANSIColor qw(:constants);


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
