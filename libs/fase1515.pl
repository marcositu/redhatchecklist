
use Term::ANSIColor qw(:constants);

# ----------------------------------------------------------------------------------------
# Fase 15.0 -- Cron.Daily
# ----------------------------------------------------------------------------------------

print "-" x 100;
print " \nFase 15.0 -- Cron.Daily\n";
print F "  <h3>Fase 15.0-- Cron.Daily</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "  <h3>Fase 15.0-- Cron.Daily</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";

print "-" x 100;

$dirtoget="/etc/cron.daily/";
opendir(IMD, $dirtoget) || die("Cannot open directory");
@thefiles= readdir(IMD);
closedir(IMD);


foreach $f (@thefiles)
{
 unless ( ($f eq ".") || ($f eq "..") )
 {
 print BOLD, WHITE, "\nInformacion:", RESET . " /etc/cron.daily/$f\n";
 print F "<p>/etc/cron.daily/$f</p>\n";
 }
}
	
print R "<p>Se recomienda analizar si los archivos situados en el crond.daily son los esperados.</p>\n";
print F "</div>\n";
print F "</div>\n";

print R "</div>\n";
print R "</div>\n";
