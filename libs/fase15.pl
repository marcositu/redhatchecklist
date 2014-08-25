#!/usr/bin/perl -w

use lib 'libs';
use Msg;
use open qw(:std :utf8);
use Encode qw(decode_utf8);
cambia_idioma($idioma_solicitado);
no warnings;
# ----------------------------------------------------------------------------------------
# Fase 1.5 -- Ultimos usuarios agregados / Recent added users
# ----------------------------------------------------------------------------------------

print $Msg::msg[$Msg::idioma][18];
print F $Msg::msg[$Msg::idioma][19];
print F "<div>\n";
print F "<div class=\"content\">\n";

print R $Msg::msg[$Msg::idioma][19];
print R "<div>\n";
print R "<div class=\"content\">\n";
print "-" x 100;



$CONEXIONESCHECK=`diff -i --ignore-space-change  /etc/passwd- /etc/passwd | grep ">" | cut -d: -f1 | sed "s/> //g"`;
print "\n$CONEXIONESCHECK\n";
print F"<p>$CONEXIONESCHECK</p>\n";
print R $Msg::msg[$Msg::idioma][20];		


print F "</div>\n";
print F "</div>\n";
print R "</div>\n";
print R "</div>\n";
