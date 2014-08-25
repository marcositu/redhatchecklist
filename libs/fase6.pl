#!/usr/bin/perl -w

use lib 'libs';
use Msg;
use open qw(:std :utf8);
use Encode qw(decode_utf8);
cambia_idioma($idioma_solicitado);
no warnings;

# ----------------------------------------------------------------------------------------
# Fase 6.0 -- Banner personalizado / Customized banner
# ----------------------------------------------------------------------------------------

print $Msg::msg[$Msg::idioma][85];
print F $Msg::msg[$Msg::idioma][86];
print F "<div>\n";
print F "<div class=\"content\">\n";


print R $Msg::msg[$Msg::idioma][86];
print R "<div>\n";
print R "<div class=\"content\">\n";


print "-" x 100;

$bannerpersona= `head -n1  /etc/issue | grep Cable`;

if($bannerpersona eq ""){
print $Msg::msg[$Msg::idioma][87];
print F $Msg::msg[$Msg::idioma][88];
print R $Msg::msg[$Msg::idioma][89];

}

print F "</div>\n";
print F "</div>\n";

print R "</div>\n";
print R "</div>\n";
