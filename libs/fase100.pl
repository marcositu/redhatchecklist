# ----------------------------------------------------------------------------------------
# Fase 1.10 -- Usuarios con acceso al sistema
# ----------------------------------------------------------------------------------------
print "-" x 100;
print " \nFase 1.10 -- Usuarios con acceso al sistema\n";
print F "<h3>Fase 1.10 -- Usuarios con acceso al sistema</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "<h3>Fase 1.10 -- Usuarios con acceso al sistema</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";
print "-" x 100;

open(USER,"/etc/passwd");

while (<USER>) {
       ($linea)=split(/\n/,$_,1); (@userdata)=split(/:/,$linea);
       $tieneshell=$userdata[6];
       chomp ($tieneshell);
        $username=$userdata[0];
        chomp ($username);
       $gid=$userdata[2];
       chomp ($gid);
       if ($username ne "root" && $username ne "halt" && $username ne "sync" && $username ne "shutdown")
       {
       if ($tieneshell ne "/sbin/nologin" && $tieneshell ne "/bin/false" && $tieneshell ne "/usr/sbin/nologin")
        {
		open(SINPASSWD,"/etc/shadow");
		while (<SINPASSWD>) {
       ($linea)=split(/\n/,$_,1); (@userdata)=split(/:/,$linea);
	   $user=$userdata[0];
       $passwd=$userdata[1];
	   if ($username eq $user)
	   {
		if ($passwd ne "*" && $passwd ne "!" && $passwd ne "!!") {
        print BOLD, WHITE, "\nInformacion:", RESET . " Usuario: $user\n";
		print F"<p>$user</p>\n";
        }
	   }
	   
}

        }

      }


}


close (SINPASSWD);
close(USER);

print R "<p>Verificar que los usuarios nombrados en el informe sean los requerimientos para la administraci&oacute;n del servidor.</p>\n";

print F "</div>\n";
print F "</div>\n";

print R "</div>\n";
print R "</div>\n";