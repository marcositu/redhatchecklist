use Term::ANSIColor qw(:constants);
 no warnings;

# ----------------------------------------------------------------------------------------
# Fase 8.0 -- SeLinux
# ----------------------------------------------------------------------------------------

print "-" x 100;
print " \nFase 8.0 -- SeLinux\n";
print F "  <h3>Fase 8.0 -- SeLinux</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "  <h3>Fase 8.0 -- SeLinux</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";


print "-" x 100;

$selinuxon= `/usr/sbin/sestatus`;

if($selinuxon =~ /disabled/){
print BOLD, RED, "\nNegativo:", RESET . " SeLinux se encuentra desactivado\n";
print F "<p class=\"negativo\">SeLinux se encuentra desactivado</p>\n";

}

print R "<p>Se recomienda configurar y activar SeLinux</p>\n";
print F "</div>\n";
print F "</div>\n";

print R "</div>\n";
print R "</div>\n";
