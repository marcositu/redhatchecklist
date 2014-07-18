
use Term::ANSIColor qw(:constants);

# ----------------------------------------------------------------------------------------
# Fase 3.1 -- Verificacion de Sticky Bit
# ----------------------------------------------------------------------------------------


print "-" x 100;
print " \nFase 3.1 -- Verificacion de Sticky Bit\n";
print F "<h3>Fase 3.1 -- Verificacion de Sticky Bit</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "<h3>Fase 3.1 -- Verificacion de Sticky Bit</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";

print "-" x 100;
use vars qw/*name *dir *prune/;
*name   = *File::Find::name;
*dir    = *File::Find::dir;
*prune  = *File::Find::prune;

sub wanted;


# Traverse desired filesystems
File::Find::find({wanted => \&wanted}, '/');


sub wanted {
    my ($dev,$ino,$mode,$nlink,$uid,$gid);

    (($dev,$ino,$mode,$nlink,$uid,$gid) = lstat($_)) and
    !($File::Find::prune |= ($dev != $File::Find::topdev)) and
    -d _ and
    (
        (($mode & 01000) == 01000)
    ) and
    
print BOLD, WHITE, "\nInformacion:",RESET . " Se detecto sticky bit en $name\n" and
print F "<p class=\"negativo\">Informacion: Directorio con sticky bit $name</p>\n" and
print R "<p>Verificar si el permiso de sticky bit del directorio $name es requerido.</p>\n";
}

print F "</div>\n";
print F "</div>\n";	

print R "</div>\n";
print R "</div>\n";	

print "-" x 100;
