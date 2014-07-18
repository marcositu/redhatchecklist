use Term::ANSIColor qw(:constants);

# ----------------------------------------------------------------------------------------
# Fase 12.0 -- Conexiones
# ----------------------------------------------------------------------------------------

print "-" x 100;
print " \nFase 12.0 -- Conexiones\n";
print F "  <h3>Fase 12.0 -- Conexiones</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "  <h3>Fase 12.0 -- Conexiones</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";

print "-" x 100;

$CONEXIONESCHECK=`/usr/sbin/lsof -i  > /tmp/conexiones_check.txt`;
                
# Leer un fichero de texto
my $filename = '/tmp/conexiones_check.txt';
open INFILE,$filename;
my $linea;
while ( $linea = <INFILE>) {
    chomp($linea); 
    print BOLD, WHITE, "\nInformacion:", RESET . " $linea\n";
print F"<p>$linea</p>\n";
} 
close INFILE;

unlink '/tmp/conexiones_check.txt';			

print R "<p>Se recomienda analizar si las conexiones son las esperadas</p>\n";

print F "</div>\n";
print F "</div>\n";

print R "</div>\n";
print R "</div>\n";
