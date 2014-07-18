
use Term::ANSIColor qw(:constants);


# ----------------------------------------------------------------------------------------
# Fase 1.8 -- Ultimos comandos ejecutados por los usuarios
# ----------------------------------------------------------------------------------------

print "-" x 100;
print " \nFase 1.8 -- Ultimos comandos ejecutados por los usuarios\n";
print F "  <h3>Fase 1.8 -- &Uacute;ltimos comandos ejecutados por los usuarios</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "  <h3>Fase 1.8 -- &Uacute;ltimos comandos ejecutados por los usuarios</h3>\n";
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
								print BOLD, WHITE, "\nInformacion:", RESET . " $user:\n$linea\n";
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

print R "<p>Verificar que los comandos ejecutados sean propios de la administraci&oacute;n del servidor</p>\n";


print R "</div>\n";
print R "</div>\n";