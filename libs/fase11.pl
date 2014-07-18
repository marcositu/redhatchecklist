
use Term::ANSIColor qw(:constants);


# ----------------------------------------------------------------------------------------
# Fase 1.1 -- Comprobacion de Usuarios/Grupos
# ----------------------------------------------------------------------------------------

print "-" x 100;
print " \nFase 1.1 -- Comprobacion de Usuarios/Grupos \n";
print F "<h3>Fase 1.1 -- Comprobacion de Usuarios/Grupos</h3>\n";
print R "<h3>Fase 1.1 -- Comprobacion de Usuarios/Grupos</h3>\n";
print "-" x 100;
use diagnostics;
print F "<div>\n";
print F "<div class=\"content\">\n";
print R "<div>\n";
print R "<div class=\"content\">\n";

### Leemos todos los usuarios
my %usuarios;
setpwent();                                                 ## Inicio de acceso al fichero passwd
while ( my($nombre,$passwd,$uid,$gid) = getpwent() ) {      ## Bucle por todos los usuarios
    $usuarios{$uid} = [ $nombre, $passwd, $gid ];
}
endpwent();                                                 ## Fin de acceso al fichero passwd

### Leemos todos los grupos
my %grupos;
setgrent();                                                 ## Inicio de acceso al fichero /etc/group
while ( my($nombre,$passwd,$gid,$miembros) = getgrent() ) { ## Bucle para todos los grupos
    $grupos{$gid} = [ $nombre, $passwd, $miembros ];
}
endgrent();                                                 ## Fin de acceso al fichero /etc/group

## Los usuarios pertenecen a un grupo (el grupo por defecto). La relación con ese grupo no
## suele estar reflejada en el fichero /etc/group.
## Aquí añadimos el usuario al conjunto de usuarios de su grupo por defecto.
## El efecto es igual que llamar al programa 'groups', que devuelve todos los grupos a los que
## pertenece el usuario
for my $uid ( keys %usuarios ) {
    my $gid = $usuarios{$uid}->[2];
    my $miembros_del_grupo = $grupos{$gid}->[2];
    if (!$miembros_del_grupo) {
        $grupos{$gid}->[2] = $usuarios{$uid}->[0];
    }
    elsif ($gid !~ /\b$miembros_del_grupo\b/) {
        $grupos{$gid}->[2] = join " ", $miembros_del_grupo, $usuarios{$uid}->[0];
    }
}

#use Data::Dumper;
#print Dumper \%usuarios;
#print Dumper \%grupos;

## Para cada usuario
for my $uid ( keys %usuarios ) {
    my $nombre = $usuarios{$uid}->[0];
    #print "Usuario: $nombre\n";

    ## Para todos los grupos de ese usuario
    for my $gid ( keys %grupos ) {
        next if $grupos{$gid}->[2] !~ /\b$nombre\b/;
        #print "\tGrupo: $gid, $grupos{$gid}->[0]\n";

        if ($gid < 500) {
        	 print BOLD, WHITE, "\nInformacion:", RESET . " El usuario $nombre pertenece al grupo $grupos{$gid}->[0] ($gid)\n";
             print F "<p>El usuario $nombre pertenece al grupo $grupos{$gid}->[0] ($gid)\n</p>\n";

        }
    }
}
print F "</div>\n";
print F "</div>\n";

print R "<p>Recomendamos analizar si los grupos creados y la asignaci&oacute;n de los usuarios es la requerida.\n</p>\n";
print R "</div>\n";
print R "</div>\n";
