
use Term::ANSIColor qw(:constants);


# ----------------------------------------------------------------------------------------
# Fase 1.9 -- Relaciones de confianza
# ----------------------------------------------------------------------------------------

print "-" x 100;
print " \nFase 1.9 -- Relaciones de confianza\n";
print F "  <h3>Fase 1.9 -- Relaciones de confianza</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "  <h3>Fase 1.9 -- Relaciones de confianza</h3>\n";
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
								print BOLD, WHITE, "\nInformacion:", RESET . " usuario:$user / archivo: $filename / contenido: $linea<\n";
                                print F"<p><b>usuario:$user</b> / <b>archivo</b>:$filename / <b>contenido</b>:$linea</p>\n";
                        }
                }
        }
}
close (SINPASSWD);
close (INFILE);
close (SINPASSWD2);		

print F "</div>\n";
print F "</div>\n";


print R "<p>En el caso que existen relaciones de confianza, verificar que sean las requeridas.</p>\n";
print R "</div>\n";
print R "</div>\n";
