use Term::ANSIColor qw(:constants);

# ----------------------------------------------------------------------------------------
# Fase 17.0 -- Configuración de Red
# ----------------------------------------------------------------------------------------

print "-" x 100;
print " \nFase 17.0 -- Configuración de Red\n";
print F "  <h3>Fase 17.0 -- Configuraci&oacute;n de Red</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "  <h3>Fase 17.0 -- Configuraci&oacute;n de Red</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";

print "-" x 100;

$REDCHECK=`/sbin/ip addr show &> /tmp/redcheck_check.txt`;


# Leer un fichero de texto
my $filename = '/tmp/redcheck_check.txt';
open INFILE,$filename;
my $linea;
while ( $linea = <INFILE>) {
    chomp($linea); 
    print BOLD, WHITE, "\nInformacion:", RESET . " $linea\n";
print F "<p>$linea</p>\n";
} 
close INFILE;

unlink '/tmp/redcheck_check.txt';		

print R "<p>Se recomienda analizar si la configuraci&oacute;n de red es la esperada.</p>\n";


print F "</div>\n";
print F "</div>\n";

print R "</div>\n";
print R "</div>\n";
