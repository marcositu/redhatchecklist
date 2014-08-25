#!/usr/bin/perl -w

use lib 'libs';
use Msg;
use open qw(:std :utf8);
use Encode qw(decode_utf8);
cambia_idioma($idioma_solicitado);
no warnings;


# ----------------------------------------------------------------------------------------
# Fase 9.0 -- IPTABLES
# ----------------------------------------------------------------------------------------

print $Msg::msg[$Msg::idioma][97];

print F $Msg::msg[$Msg::idioma][98];
print F "<div>\n";
print F "<div class=\"content\">\n";

print R $Msg::msg[$Msg::idioma][98];
print R "<div>\n";
print R "<div class=\"content\">\n";


print "-" x 100;

$IPTABLELIST=`/sbin/iptables -L > /tmp/iptables_check.txt`;
                
# Leer un fichero de texto
my $filename = '/tmp/iptables_check.txt';
open INFILE,$filename;
my $linea;
while ( $linea = <INFILE>) {
    chomp($linea); 
    print "\n$linea\n";
	print F"<p>$linea</p>\n";
} 
close INFILE;

unlink '/tmp/iptables_check.txt';			


print R $Msg::msg[$Msg::idioma][99];

print F "</div>\n";
print F "</div>\n";

print R "</div>\n";
print R "</div>\n";

