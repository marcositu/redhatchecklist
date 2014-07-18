
use Term::ANSIColor qw(:constants);


# ----------------------------------------------------------------------------------------
# Fase 1.5 -- Ultimos usuarios agregados
# ----------------------------------------------------------------------------------------

print "-" x 100;
print " \nFase 1.5 -- Ultimos usuarios agregados\n";
print F "  <h3>Fase 1.5 -- Ultimos usuarios agregados</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "  <h3>Fase 1.5 -- Ultimos usuarios agregados</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";
print "-" x 100;



$CONEXIONESCHECK=`diff -i --ignore-space-change  /etc/passwd- /etc/passwd | grep ">" | cut -d: -f1 | sed "s/> //g"`;
print BOLD, WHITE, "\nInformacion:", RESET . " $CONEXIONESCHECK\n";
print F"<p>$CONEXIONESCHECK</p>\n";
print R "<p>En el caso que existan usuarios agregados en el ultimo periodo, verificar que haya sido un requerimiento del servicio a prestar.</p>";		


print F "</div>\n";
print F "</div>\n";
print R "</div>\n";
print R "</div>\n";
