
use Term::ANSIColor qw(:constants);

# ----------------------------------------------------------------------------------------
# Fase 19.0 -- Verificar configuracion samba
# ----------------------------------------------------------------------------------------

print "-" x 100;
print " \nFase 19.0 -- Verificar configuración samba\n";
print F "  <h3>Fase 19.0 -- Verificar configuraci&oacute;n samba</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "  <h3>Fase 19.0 -- Verificar configuraci&oacute;n samba</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";

print "-" x 100;

$filename= "/etc/samba/smb.conf1";

   if( -e $filename){
   

$SMBCHECK=`grep -v -e \"#\" -e \";\" /etc/samba/smb.conf | sed '/^[ ]*\$/d'&> /tmp/smbcheck_check.txt`;


# Leer un fichero de texto
my $filename = '/tmp/smbcheck_check.txt';
open INFILE,$filename;
my $linea;
while ( $linea = <INFILE>) {
    chomp($linea); 
    print BOLD, WHITE, "\nInformacion:", RESET . " $linea\n";
	print F "<p>$linea</p>\n";
} 
close INFILE;

unlink '/tmp/smbcheck_check.txt';		

print R "<p>Se recomienda analizar si la configuraci&oacute;n de SMB es la esperada.</p>\n";

   }
   else {
   print F "<p>No se identific&oacute; la configuraci&oacute;n de Samba.</p>\n";
   }


print F "</div>\n";
print F "</div>\n";

print R "</div>\n";
print R "</div>\n";
