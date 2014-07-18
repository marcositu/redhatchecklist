
use Term::ANSIColor qw(:constants);

# ----------------------------------------------------------------------------------------
# Fase 18.1 -- Verificar que no este activo ctrlaltdel en inittab
# ----------------------------------------------------------------------------------------

print "-" x 100;
print " \nFase 18.1 -- Verificar que no este activo ctrlaltdel en inittab\n";
print F "  <h3>Fase 18.1 -- Verificar que no este activo ctrlaltdel en inittab</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "  <h3>Fase 18.1 -- Verificar que no este activo ctrlaltdel en inittab</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";

print "-" x 100;

$REDCHECK=`grep -e "^ca" /etc/inittab | cut -d: -f3 &> /tmp/initctrlcheck_check.txt`;

# Leer un fichero de texto
my $filename = '/tmp/initctrlcheck_check.txt';
open INFILE,$filename;
my $linea;
while ( $linea = <INFILE>) {
    chomp($linea); 
	if ($linea eq "ctrlaltdel") {
	print BOLD, RED, "\nNegativo:", RESET . " Se puede reiniciar el servidor con la combinación de teclas ctrlaltdel\n";
	print F "<p class=\"negativo\">Negativo: Se puede reiniciar el servidor con la combinaci&oacute;n de teclas ctrlaltdel</p>\n";
	print R"<p>Se recomienda analizar si es parte de la administraci&oacute;n del servidor esta combinaci&oacute;n de teclas</p>\n";

	}
} 
close INFILE;

unlink '/tmp/initctrlcheck_check.txt';		

print F "</div>\n";
print F "</div>\n";

print R "</div>\n";
print R "</div>\n";
