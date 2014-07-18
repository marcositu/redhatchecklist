use Term::ANSIColor qw(:constants);

# ----------------------------------------------------------------------------------------
# Fase 14.0 -- Configuracion de Sudoers 
# ----------------------------------------------------------------------------------------

print "-" x 100;
print " \nFase 14.0 -- Configuracion de Sudoers\n";
print F "  <h3>Fase 14.0 -- Configuraci&oacute;n de Sudoers </h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "  <h3>Fase 14.0 -- Configuraci&oacute;n de Sudoers </h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";

print "-" x 100;

$SUDOCHECK=`grep -v "#" /etc/sudoers | sed '/^[ ]*\$/d'  > /tmp/sudousers_check.txt`;
                
# Leer un fichero de texto
my $filename = '/tmp/sudousers_check.txt';
open INFILE,$filename;
my $linea;
while ( $linea = <INFILE>) {
    chomp($linea); 
    print BOLD, WHITE, "\nInformacion:", RESET . " $linea\n";
print F "<p>$linea</p>\n";
} 
close INFILE;

unlink '/tmp/sudousers_check.txt';			


print R "<p>Se recomienda analizar si la configuraci&oacute;n de sudoers sea la esperada</p>\n";
print F "</div>\n";
print F "</div>\n";

print R "</div>\n";
print R "</div>\n";
