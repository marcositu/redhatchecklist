use Term::ANSIColor qw(:constants);

# ----------------------------------------------------------------------------------------
# Fase 1.0 -- Listado de los usuarios del sistema
# ----------------------------------------------------------------------------------------
print "-" x 100;
print " \nFase 1.0 -- Listado de los usuarios del sistema\n";
print F "<h3>Fase 1.0 -- Listado de los usuarios del sistema</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "<h3>Fase 1.0 -- Listado de los usuarios del sistema</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";

print "-" x 100;
open(USER,"/etc/passwd");

while (<USER>) {
       ($linea)=split(/\n/,$_,1); (@userdata)=split(/:/,$linea);
       $gid=$userdata[2];
       $username=$userdata[0];
print BOLD, WHITE, "\nInformacion:", RESET . " Usuario: $username\n";
print F"<p>$username</p>\n";
}

print R"<p>Se recomienda tener solamente los usuarios que va a ser utilizados</p>\n";
close(USER);
print F "</div>\n";
print F "</div>\n";

print R "</div>\n";
print R "</div>\n";

