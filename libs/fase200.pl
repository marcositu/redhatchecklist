#!/usr/bin/perl -w

use lib 'libs';
use Msg;
use open qw(:std :utf8);
use Encode qw(decode_utf8);
cambia_idioma($idioma_solicitado);
no warnings;


# ----------------------------------------------------------------------------------------
# # Fase 20.0 -- Verificar sincronización NTP / NTP sincronization
# ----------------------------------------------------------------------------------------

print "-" x 100;
print $Msg::msg[$Msg::idioma][137];
print F $Msg::msg[$Msg::idioma][138];
print F "<div>\n";
print F "<div class=\"content\">\n";

print R $Msg::msg[$Msg::idioma][138];
print R "<div>\n";
print R "<div class=\"content\">\n";

print "-" x 100;

$NTPCLIENTCHECK = `ntpstat | head -n1`;

if  ($NTPCLIENTCHECK =~ m/synchronised to local*/){
    print $Msg::msg[$Msg::idioma][139];
	print F $Msg::msg[$Msg::idioma][140];
}

elsif ($NTPCLIENTCHECK =~ m/synchronised to NTP server*/){
	print $Msg::msg[$Msg::idioma][141];
	print F $Msg::msg[$Msg::idioma][142];
}

else {
    print $Msg::msg[$Msg::idioma][143];
	print F $Msg::msg[$Msg::idioma][144];
	print R $Msg::msg[$Msg::idioma][145];
}


print F "</div>\n";
print F "</div>\n";

print R "</div>\n";
print R "</div>\n";
