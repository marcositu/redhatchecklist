
use Term::ANSIColor qw(:constants);

# ----------------------------------------------------------------------------------------
# Fase 2.1 -- Eventos mediante Rsyslog - AUTHPRIV
# ----------------------------------------------------------------------------------------


print " \nFase 2.1 -- Eventos mediante Rsyslog - AUTHPRIV\n";
print F "  <h3>Fase 2.1 -- Eventos mediante Rsyslog - AUTHPRIV</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "  <h3>Fase 2.1 -- Eventos mediante Rsyslog - AUTHPRIV</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";

print "-" x 100;
my $aux=0;
my $archivo="/etc/rsyslog.conf";
if  (`grep -v '^#' $archivo | grep -c '^authpriv'` ==  0){
    my $aux=1;
        print BOLD, RED, "\nNegativo:", RESET . " No esta habilitado la captura de eventos del sistema operativo mediante rsyslog\n";
		print F "<p class=\"negativo\">Negativo: No esta habilitado la captura de eventos del sistema operativo mediante rsyslog</p>\n";
		print R "<p>Se recomienda habilitar la captura de eventos del sistema operativo mediante syslog</p>\n";
    }
    else{
        #print BOLD, GREEN, "Positivo:", RESET . " Esta seteado la captura de eventos del sistema operativo mediante rsyslog\n";
        #print F "<p class=\"positivo\">Positivo: Esta seteado la captura de eventos del sistema operativo mediante rsyslog</p>\n";
 
          }
if ("$aux" =="0"){
print BOLD, RED, "\nNegativo:", RESET . " El archivo $archivo no existe\n";
print F "<p class=\"negativo\">Negativo: El archivo $archivo no existe</p>\n";
print R "<p>El archivo $archivo no existe</p>\n";
 } 
 
print F "</div>\n";
print F "</div>\n";	 

print R "</div>\n";
print R "</div>\n";	 
