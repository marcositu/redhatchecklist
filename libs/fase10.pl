
use Term::ANSIColor qw(:constants);


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

