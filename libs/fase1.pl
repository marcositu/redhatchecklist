#!/usr/bin/perl -w

 use lib 'libs';
 use Msg;
 no warnings;
 use open qw(:std :utf8);
use Encode qw(decode_utf8);
chomp $idioma_solicitado;
cambia_idioma($idioma_solicitado);
# ----------------------------------------------------------------------------------------
# Fase 1.0 -- Listado de los usuarios del sistema / System users information
# ----------------------------------------------------------------------------------------
print "-" x 100;
print $Msg::msg[$Msg::idioma][5];
print F $Msg::msg[$Msg::idioma][6];
print F "<div>\n";
print F "<div class=\"content\">\n";

print R $Msg::msg[$Msg::idioma][6];
print R "<div>\n";
print R "<div class=\"content\">\n";

print "-" x 100;
print "\n";
open(USER,"/etc/passwd");

print $Msg::msg[$Msg::idioma][7] . "\n";

while (<USER>) {
       ($linea)=split(/\n/,$_,1); (@userdata)=split(/:/,$linea);
       $username=$userdata[0];
        $PASSWDUSERS = `passwd -S $username >> /tmp/passwdusers_check.txt` 
	   
}


# Leer un fichero de texto
my $filename = '/tmp/passwdusers_check.txt';
open INFILE,$filename;
my $linea;
while ( $linea = <INFILE>) {
    chomp($linea); 
    print "$linea\n";
	print F "<p>$linea</p>\n";
} 
close INFILE;

unlink '/tmp/passwdusers_check.txt';		


print R $Msg::msg[$Msg::idioma][8];
close(USER);
print F "</div>\n";
print F "</div>\n";

print R "</div>\n";
print R "</div>\n";

