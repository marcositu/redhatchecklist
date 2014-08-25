#!/usr/bin/perl -w

use lib 'libs';
use Msg;
use open qw(:std :utf8);
use Encode qw(decode_utf8);
cambia_idioma($idioma_solicitado);
no warnings;

# ----------------------------------------------------------------------------------------
# Fase 2.0 -- Eventos mediante Syslog - AUTHPRIV / Syslog events - AUTHPRIV
# ----------------------------------------------------------------------------------------

print $Msg::msg[$Msg::idioma][58];
print F $Msg::msg[$Msg::idioma][59];
print F "<div>\n";
print F "<div class=\"content\">\n";

print R $Msg::msg[$Msg::idioma][59];
print R "<div>\n";
print R "<div class=\"content\">\n";


print "-" x 100;
my $aux=0;
my $archivo="/etc/syslog.conf";

if  (`grep -v '^#' $archivo | grep -c '^authpriv'` ==  0){
    my $aux=1;
	
        print $Msg::msg[$Msg::idioma][60];
        print F $Msg::msg[$Msg::idioma][61];
		print R $Msg::msg[$Msg::idioma][62];
    }
    else{
        #print  BOLD, GREEN, "Positivo:", RESET . " Esta seteado la captura de eventos del sistema operativo mediante syslog\n";
        #print F "<p class=\"positivo\">Positivo: Esta seteado la captura de eventos del sistema operativo mediante syslog</p>\n";
 
        }

		
print F "</div>\n";
print F "</div>\n";		

print R "</div>\n";
print R "</div>\n";	

print "-" x 100;
