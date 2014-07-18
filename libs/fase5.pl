
use Term::ANSIColor qw(:constants);

		
# ----------------------------------------------------------------------------------------
# Fase 5.0 -- Cierre de conexión automático
# ----------------------------------------------------------------------------------------
		
print "-" x 100;
print " \nFase 5.0 -- Cierre de conexión automático\n";
print F "<h3>Fase 5.0 -- Cierre de conexi&oacute;n autom&aacute;tico</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "<h3>Fase 5.0 -- Cierre de conexi&oacute;n autom&aacute;tico</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";


print "-" x 100;

if  (`grep -v '^#' /etc/profile | grep -c '^export TMOUT'` ==  0){
        print BOLD, RED, "\nNegativo:", RESET . " el archivo /etc/profile no contiene la variable TMOUT configurada\n";
        print F "<p class=\"negativo\">Negativo: El archivo /etc/profile no contiene la variable TMOUT configurada</p>\n";
		print R "<p>Recomendamos configurar el par&aacute;metro TMOUT en el archivo /etc/profile</p>\n";
    }
    else{
        #print  BOLD, GREEN, "Positivo:", RESET . " El archivo /etc/profile contiene la variable TMOUT configurada\n";
        #print F "<p> El archivo /etc/profile contiene la variable TMOUT configurada</p>\n";
 
          }
		  
print F "</div>\n";
print F "</div>\n";	

print R "</div>\n";
print R "</div>\n";	
