
use Term::ANSIColor qw(:constants);

# ----------------------------------------------------------------------------------------
# Fase 3.2 -- Verificar Archivos con write para todos los usuarios
# ----------------------------------------------------------------------------------------


print " \nFase 3.1 -- Verificar archivos/directorios con permisos de escritura para todos los usuarios\n";
print F "<h3>Fase 3.2 -- Verificar archivos/directorios con permisos de escritura para todos los usuarios</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "<h3>Fase 3.2 -- Verificar archivos/directorios con permisos de escritura para todos los usuarios</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";

print "-" x 100;
use vars qw/*name *dir *prune/;
*name   = *File::Find::name;
*dir    = *File::Find::dir;
*prune  = *File::Find::prune;

sub wanted1;

# Traverse desired filesystems
File::Find::find({wanted => \&wanted1}, '/');

sub wanted1 {
    my ($dev,$ino,$mode,$nlink,$uid,$gid);

    (($dev,$ino,$mode,$nlink,$uid,$gid) = lstat($_)) and
    !($File::Find::prune |= ($dev != $File::Find::topdev)) and
    -f _ and
    (
        (($mode & 02) == 02) and
        ! (($mode & 01000) == 01000)
    ) and

    print BOLD,RED, "\nNegativo:", RESET . " Archivo/Directorio con permisos de escritura para todos los usuarios $name\n" and
print F "<p class=\"negativo\">Negativo: Archivo/Directorio con permisos de escritura para todos los usuarios $name</p>\n" and
print R "<p>Verificar si el permisos de escritura para todos los usuarios del $name es el requerido</p>\n";
}

print F "</div>\n";
print F "</div>\n";	

print R "</div>\n";
print R "</div>\n";	

