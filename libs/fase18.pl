#!/usr/bin/perl -w

use lib 'libs';
use Msg;
use open qw(:std :utf8);
use Encode qw(decode_utf8);
cambia_idioma($idioma_solicitado);
no warnings;

# ----------------------------------------------------------------------------------------
# Fase 1.8 -- Ultimos comandos ejecutados por los usuarios / Recent commands executed by users
# ----------------------------------------------------------------------------------------


print $Msg::msg[$Msg::idioma][47];
print F $Msg::msg[$Msg::idioma][48];
print F "<div>\n";
print F "<div class=\"content\">\n";

print R $Msg::msg[$Msg::idioma][48];
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
                $filename= "$filename/.bash_history";
                if( -e $filename){
                        open INFILE,$filename;
                        my $linea;
                        while ( $linea = <INFILE>) {
                                chomp($linea);
								print "\n$user:\n$linea\n";
                                print F"<p><b>$user:</b>\n$linea</p>\n";
                        }
                }
        }
}
close (SINPASSWD);
close (INFILE);



close (SINPASSWD);
close (SINPASSWD2);		

print F "</div>\n";
print F "</div>\n";

print R $Msg::msg[$Msg::idioma][49];


print R "</div>\n";
print R "</div>\n";