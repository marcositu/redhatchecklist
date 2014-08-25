#!/usr/bin/perl -w

use lib 'libs';
use Msg;
use open qw(:std :utf8);
use Encode qw(decode_utf8);
cambia_idioma($idioma_solicitado);
no warnings;

# ----------------------------------------------------------------------------------------
# Fase 17.0 -- Configuración de Red / Network configuration
# ----------------------------------------------------------------------------------------

print "-" x 100;
print $Msg::msg[$Msg::idioma][121];

print F $Msg::msg[$Msg::idioma][122];
print F "<div>\n";
print F "<div class=\"content\">\n";

print R $Msg::msg[$Msg::idioma][122];
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
    print "\n$linea\n";
print F "<p>$linea</p>\n";
} 
close INFILE;

unlink '/tmp/redcheck_check.txt';		

print R $Msg::msg[$Msg::idioma][123];


print F "</div>\n";
print F "</div>\n";

print R "</div>\n";
print R "</div>\n";
