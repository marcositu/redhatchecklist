#!/usr/bin/perl -w

use lib 'libs';
use Msg;
use open qw(:std :utf8);
use Encode qw(decode_utf8);
cambia_idioma($idioma_solicitado);
no warnings;
		
# ----------------------------------------------------------------------------------------
# Fase 5.0 -- Cierre de conexión automático / Automatic connection close
# ----------------------------------------------------------------------------------------
		
print $Msg::msg[$Msg::idioma][80];
print F $Msg::msg[$Msg::idioma][81];
print F "<div>\n";
print F "<div class=\"content\">\n";

print R $Msg::msg[$Msg::idioma][81];
print R "<div>\n";
print R "<div class=\"content\">\n";


print "-" x 100;

if  (`grep -v '^#' /etc/profile | grep -c '^export TMOUT'` ==  0){
        print $Msg::msg[$Msg::idioma][82];
        print F $Msg::msg[$Msg::idioma][83];
		print R $Msg::msg[$Msg::idioma][84];
    }
    else{
        #print  BOLD, GREEN, "Positivo:", RESET . " El archivo /etc/profile contiene la variable TMOUT configurada\n";
        #print F "<p> El archivo /etc/profile contiene la variable TMOUT configurada</p>\n";
 
          }
		  
print F "</div>\n";
print F "</div>\n";	

print R "</div>\n";
print R "</div>\n";	
