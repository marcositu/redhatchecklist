#!/usr/bin/perl -w

use lib 'libs';
use Msg;
use open qw(:std :utf8);
use Encode qw(decode_utf8);
cambia_idioma($idioma_solicitado);
no warnings;

# ----------------------------------------------------------------------------------------
# Fase 18.1 -- Verificar que no este activo ctrlaltdel en inittab / Verify that ctrlaltdel is not active in inittab
# ----------------------------------------------------------------------------------------

print "-" x 100;
print $Msg::msg[$Msg::idioma][131];
print F $Msg::msg[$Msg::idioma][132];
print F "<div>\n";
print F "<div class=\"content\">\n";

print R $Msg::msg[$Msg::idioma][132];
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
	
		if ($miidioma eq "es") {
					
	
	print "\nSe puede reiniciar el servidor con la combinación de teclas ctrlaltdel\n";
	print F "<p class=\"negativo\">Negativo: Se puede reiniciar el servidor con la combinación de teclas ctrlaltdel</p>\n";
	print R"<p>Se recomienda analizar si es parte de la administración del servidor esta combinación de teclas</p>\n";
						}
			 
						else {
							print "\nThe server can be rebooted by using the ctrl-alt-del combination\n";
							print F "<p class=\"negativo\">Negative: The server can be rebooted by using the “ctrl-alt-del” combination</p>\n";
							print R "<p>The server can be rebooted by using the ctrl-alt-del combination. It is recommended to analyze if the aforementioned combination is part of the server’s administration</p>\n";
						}
	
	
	}
} 
close INFILE;

unlink '/tmp/initctrlcheck_check.txt';		

print F "</div>\n";
print F "</div>\n";

print R "</div>\n";
print R "</div>\n";
