use Term::ANSIColor qw(:constants);

# ----------------------------------------------------------------------------------------
# Fase 1.0 -- Listado de los usuarios del sistema
# ----------------------------------------------------------------------------------------
print "-" x 100;
print " \nFase 1.0 -- Informacion de los usuarios del sistema\n";
print F "<h3>Fase 1.0 -- Informacion de los usuarios del sistema</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "<h3>Fase 1.0 -- Informacion de los usuarios del sistema</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";

print "-" x 100;
open(USER,"/etc/passwd");

print BOLD, WHITE, "\nInformacion de los usuarios del sistema", RESET . "\n";

while (<USER>) {
       ($linea)=split(/\n/,$_,1); (@userdata)=split(/:/,$linea);
       $username=$userdata[0];
        $PASSWDUSERS = `passwd -S $username >> /tmp/passwdusers_check.txt` 
	   
}


# Leer un fichero de texto
my $filename = '/tmp/passwdusers_check.txt';
open INFILE,$filename;
my $linea;
while ( $linea = <INFILE>) {
    chomp($linea); 
    print "$linea\n";
	print F "<p>$linea</p>\n";
} 
close INFILE;

unlink '/tmp/passwdusers_check.txt';		


print R"<p>Se recomienda analizar si los usuarios listado son los correctos</p>\n";
close(USER);
print F "</div>\n";
print F "</div>\n";

print R "</div>\n";
print R "</div>\n";

