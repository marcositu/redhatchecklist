use Term::ANSIColor qw(:constants);

# ----------------------------------------------------------------------------------------
# Fase 16.0 -- Versiones de softwares
# ----------------------------------------------------------------------------------------

print "-" x 100;
print " \nFase 16.0 -- Versiones de softwares\n";
print F "  <h3>Fase 16.0 -- Versiones de softwares</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";


print R "  <h3>Fase 16.0 -- Versiones de softwares</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";

print "-" x 100;

$SSHSLCHECK=`ssh -V &> /tmp/sshversion_check.txt`;
$OPENSSLCHECK=`openssl version`;
# Leer un fichero de texto
my $filename = '/tmp/sshversion_check.txt';
open INFILE,$filename;
my $linea;
while ( $linea = <INFILE>) {
    chomp($linea); 
    print BOLD, WHITE, "\nInformacion:", RESET . " $linea\n";
print F "<p>$linea</p>\n";
} 
close INFILE;


 print BOLD, WHITE, "\nInformacion:", RESET . " $OPENSSLCHECK\n";
 print F "<p>$OPENSSLCHECK</p>\n";

unlink 'sshversion_check.txt';		

print R "<p>Se recomienda analizar si las versiones de los softwares listados son las ultimas y si se encuentran fuera de problemas de seguridad.</p>\n";

print F "</div>\n";
print F "</div>\n";

print R "</div>\n";
print R "</div>\n";
