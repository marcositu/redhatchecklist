
use Term::ANSIColor qw(:constants);

# ----------------------------------------------------------------------------------------
# # Fase 20.0 -- Verificar sincronización NTP
# ----------------------------------------------------------------------------------------

print "-" x 100;
print " \nFase 20.0 -- Verificar sincronización NTP\n";
print F "  <h3>Fase 20.0 -- Verificar sincronizaci&oacute;n NTP</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "  <h3>Fase 20.0 -- Verificar sincronizaci&oacute;n NTP</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";

print "-" x 100;

$NTPCLIENTCHECK = `ntpstat | head -n1`;

if  ($NTPCLIENTCHECK =~ m/synchronised to local*/){
    print BOLD, WHITE, "\nInformacion:", RESET . " Se encuentra sincronizado localmente\n";
	print F "<p>Se encuentra sincronizado localmente</p>";
}

elsif ($NTPCLIENTCHECK =~ m/synchronised to NTP server*/){
	print BOLD, WHITE, "\nInformacion:", RESET . " Se encuentra sincronizado por un servidor remoto\n";
	print F "<p>Se encuentra sincronizado por un servidor remoto</p>";
}

else {
    print BOLD, RED  . "\nNegativo: ". RESET, "No se encuentra sincronizado\n";
	print F "<p class=\"negativo\">Negativo: No se encuentra sincronizado</p>\n";
	print R "<p>Se recomienda que el servidor se encuentra sincronizado por el NTP Server de la Empresa</p>\n";
}


print F "</div>\n";
print F "</div>\n";

print R "</div>\n";
print R "</div>\n";
