#!/usr/bin/perl -w

use lib 'libs';
use Msg;
use open qw(:std :utf8);
use Encode qw(decode_utf8);
cambia_idioma($idioma_solicitado);
no warnings;


# ----------------------------------------------------------------------------------------
# Fase 8.0 -- SeLinux
# ----------------------------------------------------------------------------------------

print "-" x 100;
print $Msg::msg[$Msg::idioma][92];
print F $Msg::msg[$Msg::idioma][93];
print F "<div>\n";
print F "<div class=\"content\">\n";

print R $Msg::msg[$Msg::idioma][93];
print R "<div>\n";
print R "<div class=\"content\">\n";


print "-" x 100;

$selinuxon= `/usr/sbin/sestatus`;

if($selinuxon =~ /disabled/){
print $Msg::msg[$Msg::idioma][94];
print F $Msg::msg[$Msg::idioma][95];
print R $Msg::msg[$Msg::idioma][96];
}


print F "</div>\n";
print F "</div>\n";

print R "</div>\n";
print R "</div>\n";
