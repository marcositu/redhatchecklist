use Term::ANSIColor qw(:constants);

# ----------------------------------------------------------------------------------------
# Fase 18.0 -- Verificar el nivel de inittab
# ----------------------------------------------------------------------------------------

print "-" x 100;
print " \nFase 18.0 -- Verificar el nivel de inittab\n";
print F "  <h3>Fase 18.0 -- Verificar el nivel de inittab</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "  <h3>Fase 18.0 -- Verificar el nivel de inittab</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";

print "-" x 100;

$REDCHECK=`grep ':initdefault' /etc/inittab | cut -d: -f2 &> /tmp/initcheck_check.txt`;


# Leer un fichero de texto
my $filename = '/tmp/initcheck_check.txt';
open INFILE,$filename;
my $linea;
while ( $linea = <INFILE>) {
    chomp($linea); 
	if ($linea != 3){
	print BOLD, RED, "\nNegativo:", RESET . " El valor $linea del par&aacute;metro inittab es incorrecto\n";
	print F "<p class=\"negativo\">Negativo: El valor $linea del par&aacute;metro inittab es incorrecto</p>\n";
	print R"<p>Se recomienda configurar el valor 3 sobre el par&aacute;metro inittab</p>\n";

	}
} 
close INFILE;

unlink '/tmp/initcheck_check.txt';		

print F "</div>\n";
print F "</div>\n";

print R "</div>\n";
print R "</div>\n";

