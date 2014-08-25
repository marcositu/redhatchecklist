#!/usr/bin/perl -w

use lib 'libs';
use Msg;
use open qw(:std :utf8);
use Encode qw(decode_utf8);
cambia_idioma($idioma_solicitado);
no warnings;
# ----------------------------------------------------------------------------------------
# Fase 18.0 -- Verificar el nivel de inittab / Verify the inittab level
# ----------------------------------------------------------------------------------------

print "-" x 100;
print $Msg::msg[$Msg::idioma][129];
print F $Msg::msg[$Msg::idioma][130];
print F "<div>\n";
print F "<div class=\"content\">\n";

print R $Msg::msg[$Msg::idioma][130];
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
	
	
	if ($miidioma eq "es") {
					
	print "n\El valor $linea del parámetro inittab es incorrecto\n";
	print F "<p class=\"negativo\">Negativo: El valor $linea del parámetro inittab es incorrecto</p>\n";
	print R"<p>Se recomienda configurar el valor 3 sobre el parámetro inittab</p>\n";
						}
			 
						else {
							print "\nThe $linea value of the initdefault parameter is incorrect\n";
							print F "<p class=\"negativo\">Negative: The $linea value of the initdefault parameter is incorrect</p>\n";
							print R "<p>The recommended configuration 3 value for the inittab parameter</p>\n";
						}
	

	}
} 
close INFILE;

unlink '/tmp/initcheck_check.txt';		

print F "</div>\n";
print F "</div>\n";

print R "</div>\n";
print R "</div>\n";

