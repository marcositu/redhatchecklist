#!/usr/bin/perl -w

use lib 'libs';
use Msg;
use open qw(:std :utf8);
use Encode qw(decode_utf8);
cambia_idioma($idioma_solicitado);
no warnings;

# ----------------------------------------------------------------------------------------
# Fase 16.0 -- Versiones de softwares / Software versions
# ----------------------------------------------------------------------------------------

print "-" x 100;
print $Msg::msg[$Msg::idioma][118];
print F $Msg::msg[$Msg::idioma][119];
print F "<div>\n";
print F "<div class=\"content\">\n";


print R $Msg::msg[$Msg::idioma][119];
print R "<div>\n";
print R "<div class=\"content\">\n";

print "-" x 100;

$SSHSLCHECK=`ssh -V &> /tmp/sshversion_check.txt`;
$OPENSSLCHECK=`openssl version`;
# Leer un fichero de texto
my $filename = '/tmp/sshversion_check.txt';
open INFILE,$filename;
my $linea;
while ( $linea = <INFILE>) {
    chomp($linea); 
    print "\n$linea\n";
print F "<p>$linea</p>\n";
} 
close INFILE;


 print "\n$OPENSSLCHECK\n";
 print F "<p>$OPENSSLCHECK</p>\n";

unlink 'sshversion_check.txt';		

print R $Msg::msg[$Msg::idioma][120];

print F "</div>\n";
print F "</div>\n";

print R "</div>\n";
print R "</div>\n";
