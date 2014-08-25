#!/usr/bin/perl -w

use lib 'libs';
use Msg;
use open qw(:std :utf8);
use Encode qw(decode_utf8);
cambia_idioma($idioma_solicitado);
no warnings;

# ----------------------------------------------------------------------------------------
# Fase 1.7 -- Ultimos usuarios conectados
# ----------------------------------------------------------------------------------------


print $Msg::msg[$Msg::idioma][44];
print F $Msg::msg[$Msg::idioma][45];
print F "<div>\n";
print F "<div class=\"content\">\n";

print R $Msg::msg[$Msg::idioma][45];
print R "<div>\n";
print R "<div class=\"content\">\n";

print "-" x 100;

$ULTIMOSCHECK=`last  > /tmp/last_check.txt`;
                
# Leer un fichero de texto
my $filename = '/tmp/last_check.txt';
open INFILE,$filename;
my $linea;
while ( $linea = <INFILE>) {
    chomp($linea); 
    print "\n$linea\n";
print F"<p>$linea</p>\n";
} 
close INFILE;

unlink '/tmp/last_check.txt';			

print F "</div>\n";
print F "</div>\n";

print R $Msg::msg[$Msg::idioma][46];
print R "</div>\n";
print R "</div>\n";
