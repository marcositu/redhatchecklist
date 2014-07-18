
use Term::ANSIColor qw(:constants);
# ----------------------------------------------------------------------------------------
# Fase 6.0 -- Banner personalizado
# ----------------------------------------------------------------------------------------
print "-" x 100;
print " \nFase 6.0 -- Banner personalizado\n";
print F "<h3>Fase 6.0 -- Banner personalizado</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";


print R "<h3>Fase 6.0 -- Banner personalizado</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";


print "-" x 100;

$bannerpersona= `head -n2  /etc/issue | grep Cable`;

if($bannerpersona eq ""){
print BOLD, RED, "\nNegativo:", RESET . " El banner no se encuentra personalizado\n";
print F "<p class=\"negativo\">El banner no se encuentra personalizado</p>\n";
print R "<p>Recomendamos personalizar el banner del servidor.</p>\n";

}

print F "</div>\n";
print F "</div>\n";

print R "</div>\n";
print R "</div>\n";
