#!/usr/bin/perl -w

use lib 'libs';
use Msg;
use open qw(:std :utf8);
use Encode qw(decode_utf8);
cambia_idioma($idioma_solicitado);
no warnings;
# ----------------------------------------------------------------------------------------
# Fase 1.6 -- Configuracion PAM
# ----------------------------------------------------------------------------------------
print $Msg::msg[$Msg::idioma][21];
print F $Msg::msg[$Msg::idioma][22];
print F "<div>\n";
print F "<div class=\"content\">\n";

print R $Msg::msg[$Msg::idioma][22];
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
        print $Msg::msg[$Msg::idioma][23];
        print F $Msg::msg[$Msg::idioma][24];
		print R $Msg::msg[$Msg::idioma][25];
    }
elsif ($CMDMINLEN == 8){
}

else {

		if ($miidioma eq "es") {
			print "El valor $CMDMINLEN del parámetro MINLEN se encuentra mal configurado\n";
			print F "<p class=\"negativo\">Negativo: El valor $CMDMINLEN del parámetro MINLEN se encuentra mal configurado</p>\n";
			print R "<p>Recomendamos configurar el valor 8 en el parámetro MINLENv</p>\n";
		}
			 
		else {
			print "The value assigned to the parameter MINLEN ($CMDMINLEN) is inadequate\n";
			print F "<p class=\"negativo\">Negative: The value assigned to the parameter MINLEN ($CMDMINLEN) is inadequate</p>\n";
			print R "<p>The recommended value for the MINLEN parameter is 8</p>\n";
		}
		
}



if  ($CMRETRY eq ""){
        print $Msg::msg[$Msg::idioma][26];
        print F $Msg::msg[$Msg::idioma][27];
		print R $Msg::msg[$Msg::idioma][28];
    }
elsif ($CMRETRY == 3){
}

else {
			if ($miidioma eq "es") {
			print "El valor $CMRETRY del parámetro RETRY se encuentra mal configurado\n";
			print F "<p class=\"negativo\">Negativo: El valor $CMRETRY del parámetro RETRY se encuentra mal configurado</p>\n";
			print R "<p>Recomendamos configurar el valor 8 en el parámetro RETRY</p>\n";
		}
			 
		else {
			print "The value assigned to the parameter MINLEN ($CMRETRY) is inadequate\n";
			print F "<p class=\"negativo\">Negative: The value assigned to the parameter MINLEN ($CMRETRY) is inadequate</p>\n";
			print R "<p>The recommended value for the RETRY parameter is 3</p>\n";
		}
}
    
	
if  ($CMDUCREDIT eq ""){
       print $Msg::msg[$Msg::idioma][29];
        print F $Msg::msg[$Msg::idioma][30];
		print R $Msg::msg[$Msg::idioma][31];
    }
elsif ($CMDUCREDIT == -1){
}

else {
		if ($miidioma eq "es") {
			print "El valor $CMDUCREDIT del parámetro UCREDIT se encuentra mal configurado\n";
			print F "<p class=\"negativo\">Negativo: El valor $CMDUCREDIT del parámetro UCREDIT se encuentra mal configurado</p>\n";
			print R "<p>Recomendamos configurar el valor (-1) en el parámetro UCREDIT</p>\n";
		}
			 
		else {
			print "The value assigned to the parameter UCREDIT ($CMDUCREDIT) is inadequate\n";
			print F "<p class=\"negativo\">Negative: The value assigned to the parameter UCREDIT ($CMDUCREDIT) is inadequate</p>\n";
			print R "<p>The recommended value for the UCREDIT parameter is -1</p>\n";
		}
}



if  ($CMDDCREDIT eq ""){
        print $Msg::msg[$Msg::idioma][32];
        print F $Msg::msg[$Msg::idioma][33];
		print R $Msg::msg[$Msg::idioma][34];
    }
elsif ($CMDDCREDIT == -1){
}

else {
		if ($miidioma eq "es") {
			print "El valor $CMDDCREDIT del parámetro DCREDIT se encuentra mal configurado\n";
			print F "<p class=\"negativo\">Negativo: El valor $CMDDCREDIT del parámetro DCREDIT se encuentra mal configurado</p>\n";
			print R "<p>Recomendamos configurar el valor (-1) en el parámetro DCREDIT</p>\n";
		}
			 
		else {
			print "The value assigned to the parameter DCREDIT ($CMDDCREDIT) is inadequate\n";
			print F "<p class=\"negativo\">Negative: The value assigned to the parameter DCREDIT ($CMDDCREDIT) is inadequate</p>\n";
			print R "<p>The recommended value for the DCREDIT parameter is -1</p>\n";
		}
}




if  ($CMDLCREDIT eq ""){
         print $Msg::msg[$Msg::idioma][35];
        print F $Msg::msg[$Msg::idioma][36];
		print R $Msg::msg[$Msg::idioma][37];
    }
elsif ($CMDLCREDIT == -1){
}

else {
		if ($miidioma eq "es") {
			print "El valor $CMDLCREDIT del parámetro LCREDIT se encuentra mal configurado\n";
			print F "<p class=\"negativo\">Negativo: El valor $CMDLCREDIT del parámetro LCREDIT se encuentra mal configurado</p>\n";
			print R "<p>Recomendamos configurar el valor (-1) en el parámetro LCREDIT</p>\n";
		}
			 
		else {
			print "The value assigned to the parameter LCREDIT ($CMDLCREDIT) is inadequate\n";
			print F "<p class=\"negativo\">Negative: The value assigned to the parameter LCREDIT ($CMDLCREDIT) is inadequate</p>\n";
			print R "<p>The recommended value for the LCREDIT parameter is -1</p>\n";
		}
}



if  ($CMDOCREDIT eq ""){
        print $Msg::msg[$Msg::idioma][38];
        print F $Msg::msg[$Msg::idioma][39];
		print R $Msg::msg[$Msg::idioma][40];
    }
elsif ($CMDOCREDIT == -1){
}

else {
		if ($miidioma eq "es") {
			print "El valor $CMDOCREDIT del parámetro OCREDIT se encuentra mal configurado\n";
			print F "<p class=\"negativo\">Negativo: El valor $CMDOCREDIT del parámetro OCREDIT se encuentra mal configurado</p>\n";
			print R "<p>Recomendamos configurar el valor (-1) en el parámetro OCREDIT</p>\n";
		}
			 
		else {
			print "The value assigned to the parameter OCREDIT ($CMDOCREDIT) is inadequate\n";
			print F "<p class=\"negativo\">Negative: The value assigned to the parameter OCREDIT ($CMDOCREDIT) is inadequate</p>\n";
			print R "<p>The recommended value for the OCREDIT parameter is -1</p>\n";
		}
}



if  ($CMDDIFOK eq ""){
       print $Msg::msg[$Msg::idioma][41];
        print F $Msg::msg[$Msg::idioma][42];
		print R $Msg::msg[$Msg::idioma][43];
    }
elsif ($CMDDIFOK == 2){
}

else {
		if ($miidioma eq "es") {
			print "El valor $CMDDIFOK del parámetro DIFOK se encuentra mal configurado\n";
			print F "<p class=\"negativo\">Negativo: El valor $CMDDIFOK del parámetro DIFOK se encuentra mal configurado</p>\n";
			print R "<p>Recomendamos configurar el valor (-1) en el parámetro DIFOK</p>\n";
		}
			 
		else {
			print "The value assigned to the parameter DIFOK ($CMDDIFOK) is inadequate\n";
			print F "<p class=\"negativo\">Negative: The value assigned to the parameter DIFOK ($CMDDIFOK) is inadequate</p>\n";
			print R "<p>The recommended value for the DIFOK parameter is 2</p>\n";
		}
}



print F "</div>\n";
print F "</div>\n";


print R "</div>\n";
print R "</div>\n";
