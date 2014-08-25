#!/usr/bin/perl -w

use lib 'libs';
use Msg;
use open qw(:std :utf8);
use Encode qw(decode_utf8);
cambia_idioma($idioma_solicitado);
no warnings;

# ----------------------------------------------------------------------------------------
# # Fase 17.1 -- Verificación de rutas / Route verification
# ----------------------------------------------------------------------------------------

print "-" x 100;
print $Msg::msg[$Msg::idioma][124];
print F $Msg::msg[$Msg::idioma][125];
print F "<div>\n";
print F "<div class=\"content\">\n";

print R $Msg::msg[$Msg::idioma][125];
print R "<div>\n";
print R "<div class=\"content\">\n";

print "-" x 100;

$REDCHECK=`/sbin/ip route show &> /tmp/rutascheck_check.txt`;


# Leer un fichero de texto
my $filename = '/tmp/rutascheck_check.txt';
open INFILE,$filename;
my $linea;
while ( $linea = <INFILE>) {
    chomp($linea); 
    print "\n$linea\n";
print F "<p>$linea</p>\n";
} 
close INFILE;

unlink '/tmp/rutascheck_check.txt';		

print R $Msg::msg[$Msg::idioma][126];

print F "</div>\n";
print F "</div>\n";

print R "</div>\n";
print R "</div>\n";
