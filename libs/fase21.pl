#!/usr/bin/perl -w

use lib 'libs';
use Msg;
use open qw(:std :utf8);
use Encode qw(decode_utf8);
cambia_idioma($idioma_solicitado);
no warnings;

# ----------------------------------------------------------------------------------------
# Fase 2.1 -- Eventos mediante Rsyslog - AUTHPRIV / Rsyslog events - AUTHPRIV
# ----------------------------------------------------------------------------------------


print $Msg::msg[$Msg::idioma][63];
print F $Msg::msg[$Msg::idioma][64];
print F "<div>\n";
print F "<div class=\"content\">\n";

print R $Msg::msg[$Msg::idioma][64];
print R "<div>\n";
print R "<div class=\"content\">\n";

print "-" x 100;
my $aux=0;
my $archivo="/etc/rsyslog.conf";
if  (`grep -v '^#' $archivo | grep -c '^authpriv'` ==  0){
    my $aux=1;
        print $Msg::msg[$Msg::idioma][65];
		print F $Msg::msg[$Msg::idioma][66];
		print R $Msg::msg[$Msg::idioma][67];
    }
    else{
        #print BOLD, GREEN, "Positivo:", RESET . " Esta seteado la captura de eventos del sistema operativo mediante rsyslog\n";
        #print F "<p class=\"positivo\">Positivo: Esta seteado la captura de eventos del sistema operativo mediante rsyslog</p>\n";
 
          }

 
print F "</div>\n";
print F "</div>\n";	 

print R "</div>\n";
print R "</div>\n";	 
