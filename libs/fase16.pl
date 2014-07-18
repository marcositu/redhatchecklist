
use Term::ANSIColor qw(:constants);

# ----------------------------------------------------------------------------------------
# Fase 1.6 -- Configuracion PAM
# ----------------------------------------------------------------------------------------

print "-" x 100;
print " \nFase 1.6 -- Configuracion PAM\n";
print F "  <h3>Fase 1.6 -- Configuraci&oacute;n PAM</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "  <h3>Fase 1.6 -- Configuraci&oacute;n PAM</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";


print "-" x 100;

$CMDMINLEN=`grep -e password /etc/pam.d/system-auth | grep minlen | cut -d= -f2 | cut -d " " -f1`;
$CMRETRY=`grep -e password /etc/pam.d/system-auth | grep retry | cut -d= -f2 | cut -d " " -f1`;
$CMDUCREDIT=`grep -e password /etc/pam.d/system-auth | grep ucredit | cut -d= -f2 | cut -d " " -f1`;
$CMDDCREDIT=`grep -e password /etc/pam.d/system-auth | grep dcredit | cut -d= -f2 | cut -d " " -f1`;
$CMDLCREDIT=`grep -e password /etc/pam.d/system-auth | grep lcredit | cut -d= -f2 | cut -d " " -f1`;
$CMDOCREDIT=`grep -e password /etc/pam.d/system-auth | grep ocredit | cut -d= -f2 | cut -d " " -f1`;
$CMDDIFOK=`grep -e password /etc/pam.d/system-auth | grep difok | cut -d= -f2 | cut -d " " -f1`;


if  ($CMDMINLEN eq ""){
        print BOLD, RED, "\nNegativo:", RESET . " El parametro minlen no se encuentra configurado\n";
        print F "<p class=\"negativo\">Negativo: El par&aacute;metro minlen no se encuentra configurado</p>\n";
		print R "<p>Recomendamos configurar el par&aacute;metro minlen con el valor 8</p>\n";
    }
elsif ($CMDMINLEN == 8){
}

else {
		print BOLD, RED, "\nNegativo:", RESET . " El valor $CMDMINLEN del parametro minlen se encuentra mal configurado\n";
        print F "<p class=\"negativo\">Negativo: El valor $CMDMINLEN del par&aacute;metro minlen se encuentra mal configurado</p>\n";
		print R "<p>Recomendamos configurar el valor 8 en el par&aacute;metro minlen</p>\n";
}



if  ($CMRETRY eq ""){
        print BOLD, RED, "\nNegativo:", RESET . " El parametro retry no se encuentra configurado\n";
        print F "<p class=\"negativo\">Negativo: El par&aacute;metro retry no se encuentra configurado</p>\n";
		print R "<p>Recomendamos configurar el par&aacute;metro retry con el valor 3</p>\n";
    }
elsif ($CMRETRY == 3){
}

else {
		print BOLD, RED, "\nNegativo:", RESET . " El valor $CMRETRY del parametro retry se encuentra mal configurado\n";
        print F "<p class=\"negativo\">Negativo: El valor $CMRETRY del par&aacute;metro retry se encuentra mal configurado</p>\n";
		print R "<p>Recomendamos configurar el valor 3 en el par&aacute;metro retry</p>\n";
}
    
	
if  ($CMDUCREDIT eq ""){
        print BOLD, RED, "\nNegativo:", RESET . " El parametro ucredit no se encuentra configurado\n";
        print F "<p class=\"negativo\">Negativo: El par&aacute;metro ucredit no se encuentra configurado</p>\n";
		print R "<p>Recomendamos configurar el par&aacute;metro ucredit con el valor -1</p>\n";
    }
elsif ($CMDUCREDIT == -1){
}

else {
		print BOLD, RED, "Negativo:", RESET . " El valor $CMDUCREDIT del parametro ucredit se encuentra mal configurado\n";
        print F "<p class=\"negativo\">Negativo: El valor $CMDUCREDIT del par&aacute;metro ucredit se encuentra mal configurado</p>\n";
		print R "<p>Recomendamos configurar el valor -1 en el par&aacute;metro ucredit</p>\n";
}

if  ($CMDDCREDIT eq ""){
        print BOLD, RED, "\nNegativo:", RESET . " El parametro dcredit no se encuentra configurado\n";
        print F "<p class=\"negativo\">Negativo: El par&aacute;metro dcredit no se encuentra configurado</p>\n";
		print R "<p>Recomendamos configurar el par&aacute;metro dcredit con el valor -1</p>\n";
    }
elsif ($CMDDCREDIT == -1){
}

else {
		print BOLD, RED, "\nNegativo:", RESET . " El valor $CMDDCREDIT del parametro dcredit se encuentra mal configurado\n";
        print F "<p class=\"negativo\">Negativo: El valor $CMDDCREDIT del par&aacute;metro dcredit se encuentra mal configurado</p>\n";
		print R "<p>Recomendamos configurar el valor -1 en el par&aacute;metro dcredit</p>\n";
}

if  ($CMDLCREDIT eq ""){
        print BOLD, RED, "\nNegativo:", RESET . " El parametro lcredit no se encuentra configurado\n";
        print F "<p class=\"negativo\">Negativo: El par&aacute;metro lcredit no se encuentra configurado</p>\n";
		print R "<p>Recomendamos configurar el par&aacute;metro lcredit con el valor -1</p>\n";
    }
elsif ($CMDLCREDIT == -1){
}

else {
		print BOLD, RED, "\nNegativo:", RESET . " El valor $CMDLCREDIT del parametro lcredit se encuentra mal configurado\n";
        print F "<p class=\"negativo\">Negativo: El valor $CMDLCREDIT del par&aacute;metro lcredit se encuentra mal configurado</p>\n";
		print R "<p>Recomendamos configurar el valor -1 en el par&aacute;metro lcredit</p>\n";
}



if  ($CMDOCREDIT eq ""){
        print BOLD, RED, "\nNegativo:", RESET . " El parametro ocredit no se encuentra configurado\n";
        print F "<p class=\"negativo\">Negativo: El par&aacute;metro ocredit no se encuentra configurado</p>\n";
		print R "<p>Recomendamos configurar el par&aacute;metro ocredit con el valor -1</p>\n";
    }
elsif ($CMDOCREDIT == -1){
}

else {
		print BOLD, RED, "\nNegativo:", RESET . " El valor $CMDOCREDIT del parametro ocredit se encuentra mal configurado\n";
        print F "<p class=\"negativo\">Negativo: El valor $CMDOCREDIT del par&aacute;metro ocredit se encuentra mal configurado</p>\n";
		print R "<p>Recomendamos configurar el valor -1 en el par&aacute;metro ocredit</p>\n";
}



if  ($CMDDIFOK eq ""){
        print BOLD, RED, "\nNegativo:", RESET . " El parametro difok no se encuentra configurado\n";
        print F "<p class=\"negativo\">Negativo: El par&aacute;metro difok no se encuentra configurado</p>\n";
		print R "<p>Recomendamos configurar el par&aacute;metro difok con el valor 2</p>\n";
    }
elsif ($CMDDIFOK == 2){
}

else {
		print BOLD, RED, "\nNegativo:", RESET . " El valor $CMDDIFOK del parametro difok se encuentra mal configurado\n";
        print F "<p class=\"negativo\">Negativo: El valor $CMDDIFOK del par&aacute;metro difok se encuentra mal configurado</p>\n";
		print R "<p>Recomendamos configurar el valor 2 en el par&aacute;metro difok</p>\n";
}



print F "</div>\n";
print F "</div>\n";


print R "</div>\n";
print R "</div>\n";
