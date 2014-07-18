
use Term::ANSIColor qw(:constants);


# ----------------------------------------------------------------------------------------
# Fase 9.0 -- IPTABLES
# ----------------------------------------------------------------------------------------

print "-" x 100;
print " \nFase 9.0 -- IPTABLES\n";
print F "  <h3>Fase 9.0 -- IPTABLES</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "  <h3>Fase 9.0 -- IPTABLES</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";


print "-" x 100;

$IPTABLELIST=`/sbin/iptables -L > /tmp/iptables_check.txt`;
                
# Leer un fichero de texto
my $filename = '/tmp/iptables_check.txt';
open INFILE,$filename;
my $linea;
while ( $linea = <INFILE>) {
    chomp($linea); 
    print BOLD, WHITE, "\nInformacion:", RESET . " $linea\n";
print F"<p>$linea</p>\n";
} 
close INFILE;

unlink '/tmp/iptables_check.txt';			


print R "<p>Se recomienda analizar las listas de acceso</p>\n";

print F "</div>\n";
print F "</div>\n";

print R "</div>\n";
print R "</div>\n";

