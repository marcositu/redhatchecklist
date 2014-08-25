#!/usr/bin/perl -w

use lib 'libs';
use Msg;
use open qw(:std :utf8);
use Encode qw(decode_utf8);
cambia_idioma($idioma_solicitado);
no warnings;


# ----------------------------------------------------------------------------------------
# Fase 19.0 -- Verificar configuracion samba / Samba configuration
# ----------------------------------------------------------------------------------------

print "-" x 100;
print $Msg::msg[$Msg::idioma][133];
print F $Msg::msg[$Msg::idioma][134];
print F "<div>\n";
print F "<div class=\"content\">\n";

print R $Msg::msg[$Msg::idioma][134];
print R "<div>\n";
print R "<div class=\"content\">\n";

print "-" x 100;

$filename= "/etc/samba/smb.conf1";

   if( -e $filename){
   

$SMBCHECK=`grep -v -e \"#\" -e \";\" /etc/samba/smb.conf | sed '/^[ ]*\$/d'&> /tmp/smbcheck_check.txt`;


# Leer un fichero de texto
my $filename = '/tmp/smbcheck_check.txt';
open INFILE,$filename;
my $linea;
while ( $linea = <INFILE>) {
    chomp($linea); 
    print "\n$linea\n";
	print F "<p>$linea</p>\n";
} 
close INFILE;

unlink '/tmp/smbcheck_check.txt';		

print R $Msg::msg[$Msg::idioma][135];

   }
   else {
   print F $Msg::msg[$Msg::idioma][136];
   }


print F "</div>\n";
print F "</div>\n";

print R "</div>\n";
print R "</div>\n";
