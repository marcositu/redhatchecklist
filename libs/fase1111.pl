use Term::ANSIColor qw(:constants);
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
