
use Term::ANSIColor qw(:constants);


# ----------------------------------------------------------------------------------------
# Fase 4.0 -- Archivo de autenticacion ftp
# ----------------------------------------------------------------------------------------


print "-" x 100;
print " \nFase 4.0 -- Archivo de autenticacion ftp\n";
print F "<h3>Fase 4.0 -- Archivo de autenticacion ftp</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "<h3>Fase 4.0 -- Archivo de autenticacion ftp</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";


print "-" x 100;
use vars qw/*name *dir *prune/;
*name   = *File::Find::name;
*dir    = *File::Find::dir;
*prune  = *File::Find::prune;

sub wanted5;

File::Find::find({wanted => \&wanted5}, '/');


sub wanted5 {
    /^\.netrc\z/s and
print BOLD, RED, "\nNegativo:", RESET . " Archivo de autenticacion ftp $name\n" and
print F "<p class=\"negativo\">Negativo: Archivo de autenticacion ftp $name</p>\n" and
print R "<p>Verificar si el archivos de autenticacion ftp $name es requerido</p>\n";
        }


print F "</div>\n";
print F "</div>\n";	

print R "</div>\n";
print R "</div>\n";	
