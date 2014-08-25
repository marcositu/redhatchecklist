#!/usr/bin/perl -w

use lib 'libs';
use Msg;
use open qw(:std :utf8);
use Encode qw(decode_utf8);
cambia_idioma($idioma_solicitado);
no warnings;


# ----------------------------------------------------------------------------------------
# Fase 12.0 -- Conexiones / Connections
# ----------------------------------------------------------------------------------------

print "-" x 100;
print $Msg::msg[$Msg::idioma][106];
print F $Msg::msg[$Msg::idioma][107];
print F "<div>\n";
print F "<div class=\"content\">\n";

print R $Msg::msg[$Msg::idioma][107];
print R "<div>\n";
print R "<div class=\"content\">\n";

print "-" x 100;

$CONEXIONESCHECK=`/usr/sbin/lsof -i  > /tmp/conexiones_check.txt`;
                
# Leer un fichero de texto
my $filename = '/tmp/conexiones_check.txt';
open INFILE,$filename;
my $linea;
while ( $linea = <INFILE>) {
    chomp($linea); 
    print "\n$linea\n";
	print F"<p>$linea</p>\n";
} 
close INFILE;

unlink '/tmp/conexiones_check.txt';			

print R $Msg::msg[$Msg::idioma][108];

print F "</div>\n";
print F "</div>\n";

print R "</div>\n";
print R "</div>\n";
