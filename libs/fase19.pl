#!/usr/bin/perl -w

use lib 'libs';
use Msg;
use open qw(:std :utf8);
use Encode qw(decode_utf8);
cambia_idioma($idioma_solicitado);
no warnings;

# ----------------------------------------------------------------------------------------
# Fase 1.9 -- Relaciones de confianza / Trust relationships
# ----------------------------------------------------------------------------------------

print "-" x 100;
print $Msg::msg[$Msg::idioma][50];
print F $Msg::msg[$Msg::idioma][51];
print F "<div>\n";
print F "<div class=\"content\">\n";

print R $Msg::msg[$Msg::idioma][51];
print R "<div>\n";
print R "<div class=\"content\">\n";
print "-" x 100;

open(SINPASSWD,"/etc/shadow");
while (<SINPASSWD>) {
       ($linea)=split(/\n/,$_,1); (@userdata)=split(/:/,$linea);
       $user=$userdata[0];
       $passwd=$userdata[1];

        if ($passwd =~ m/^\$/ ) {
                $filename = `grep -e "^$user" /etc/passwd | awk -F: {'print \$6'}`;
                chomp ($filename);
                $filename= "$filename/.rhosts";
                if( -e $filename){
                        open INFILE,$filename;
                        my $linea;
                        while ( $linea = <INFILE>) {
                                chomp($linea);
								print "\nUser:$user / File: $filename / Data: $linea<\n";
                                print F"<p><b>User:$user</b> / <b>File</b>:$filename / <b>Data</b>:$linea</p>\n";
                        }
                }
        }
}
close (SINPASSWD);
close (INFILE);
close (SINPASSWD2);		

print F "</div>\n";
print F "</div>\n";


print R $Msg::msg[$Msg::idioma][52];
print R "</div>\n";
print R "</div>\n";
