#!/usr/bin/perl -w

use lib 'libs';
use Msg;
use open qw(:std :utf8);
use Encode qw(decode_utf8);
cambia_idioma($idioma_solicitado);
no warnings;

# ----------------------------------------------------------------------------------------
# Fase 14.0 -- Configuracion de Sudoers 
# ----------------------------------------------------------------------------------------

print "-" x 100;
print $Msg::msg[$Msg::idioma][112];
print F $Msg::msg[$Msg::idioma][113];
print F "<div>\n";
print F "<div class=\"content\">\n";

print R $Msg::msg[$Msg::idioma][113];
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
    print "\n$linea\n";
	print F "<p>$linea</p>\n";
} 
close INFILE;

unlink '/tmp/sudousers_check.txt';			


print R $Msg::msg[$Msg::idioma][114];
print F "</div>\n";
print F "</div>\n";

print R "</div>\n";
print R "</div>\n";
