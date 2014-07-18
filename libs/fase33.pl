
use Term::ANSIColor qw(:constants);

# ----------------------------------------------------------------------------------------
# Fase 3.3 -- Verificacion de suid/gsid
# ----------------------------------------------------------------------------------------


print "-" x 100;
print " \nFase 3.3 -- Verificacion de suid/gsid\n";
print F "<h3>Fase 3.3 -- Verificacion de suid/gsid</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "<h3>Fase 3.3 -- Verificacion de suid/gsid</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";

print "-" x 100;
# for the convenience of &wanted calls, including -eval statements:
use vars qw/*name *dir *prune/;
*name   = *File::Find::name;
*dir    = *File::Find::dir;
*prune  = *File::Find::prune;

sub wanted2;

# Traverse desired filesystems
File::Find::find({wanted => \&wanted2}, '/');

sub wanted2 {
    my ($dev,$ino,$mode,$nlink,$uid,$gid);

    (($dev,$ino,$mode,$nlink,$uid,$gid) = lstat($_)) and
    !($File::Find::prune |= ($dev != $File::Find::topdev)) and
    (
        (($mode & 04000) == 04000)
        ||
        (($mode & 02000) == 02000)
    ) and
    -f _ and

         print BOLD, WHITE, "\nInformacion:", RESET . " Se detecto suid/gsid en $name\n" and
         print F "<p class=\"negativo\">Informacion: Se detecto suid/gsid en $name</p>\n" and
		 print R "<p>Verificar si el permiso de suid/gsid en $name es el requerido</p>\n"
        }

print F "</div>\n";
print F "</div>\n";			

print R "</div>\n";
print R "</div>\n";		
