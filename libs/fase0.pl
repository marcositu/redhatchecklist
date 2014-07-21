# ----------------------------------------------------------------------------------------
# Fase 0.0 -- Información del Equipo
# ----------------------------------------------------------------------------------------
# Variables
my $SistemaOperativo=`uname`;
chomp $SistemaOperativo;
my $Release=`uname -r`;
chomp $Release;
my $Hostname=`uname -n`;
chomp $Hostname;
my $SistemaOperativoC=`uname -a`;
chomp $SistemaOperativoC;

print "-" x 100;
print " \nFase 0.0 -- Información del Equipo\n";
print F "<h3>Fase 0.0 -- Informaci&oacute;n del Equipo</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";
print "-" x 100;

print F "<p><b>Sistema Operativo:</b> $SistemaOperativo</p>";
print F "<p><b>Release del Kernel:</b> $Release</p>";
print F "<p><b>Hostname:</b> $Hostname</p>";
print F "<p><b>Datos Adicionales:</b> $SistemaOperativoC</p>";

print F "</div>\n";
print F "</div>\n";

print R "<h3>Fase 0.0 -- Informaci&oacute;n del Equipo</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";
print "-" x 100;

print R "<p><b>Sistema Operativo:</b> $SistemaOperativo</p>";
print R "<p><b>Release del Kernel:</b> $Release</p>";
print R "<p><b>Hostname:</b> $Hostname</p>";
print R "<p><b>Datos Adicionales:</b> $SistemaOperativoC</p>";

print R "</div>\n";
print R "</div>\n";
