#!/usr/bin/perl -w

use lib 'libs';
use Msg;
use open qw(:std :utf8);
use Encode qw(decode_utf8);
cambia_idioma($idioma_solicitado);
no warnings;

# ----------------------------------------------------------------------------------------
# Fase 11.0 -- Procesos / Processes
# ----------------------------------------------------------------------------------------
print "-" x 100;
print $Msg::msg[$Msg::idioma][103];

print F $Msg::msg[$Msg::idioma][104];
print F "<div>\n";
print F "<div class=\"content\">\n";

print R $Msg::msg[$Msg::idioma][104];
print R "<div>\n";
print R "<div class=\"content\">\n";
print "-" x 100;

$PROCESOSCHECK=`ps -fea > /tmp/procesos_check.txt`;
                
# Leer un fichero de texto
my $filename = '/tmp/procesos_check.txt';
open INFILE,$filename;
my $linea;
while ( $linea = <INFILE>) {
    chomp($linea); 
    print "\n$linea\n";
	print F"<p>$linea</p>\n";
} 
close INFILE;

unlink '/tmp/procesos_check.txt';			


print R $Msg::msg[$Msg::idioma][105];
print F "</div>\n";
print F "</div>\n";

print R "</div>\n";
print R "</div>\n";
