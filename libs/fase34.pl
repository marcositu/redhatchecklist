
use Term::ANSIColor qw(:constants);


# ----------------------------------------------------------------------------------------
# Fase 3.4 -- Archivos sin owner y group
# ----------------------------------------------------------------------------------------


print "-" x 100;
print " \nFase 3.4 -- Archivos sin owner y group\n";
print F "<h3>Fase 3.4 -- Archivos sin owner y group</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "<h3>Fase 3.4 -- Archivos sin owner y group</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";

print "-" x 100;
use vars qw/*name *dir *prune/;
*name   = *File::Find::name;
*dir    = *File::Find::dir;
*prune  = *File::Find::prune;

sub wanted3;

my (%uid, %user);
while (my ($name, $pw, $uid) = getpwent) {
    $uid{$name} = $uid{$uid} = $uid;
}

my (%gid, %group);
while (my ($name, $pw, $gid) = getgrent) {
    $gid{$name} = $gid{$gid} = $gid;
}


# Traverse desired filesystems
File::Find::find({wanted => \&wanted3}, '/');

sub wanted3 {
    my ($dev,$ino,$mode,$nlink,$uid,$gid);

    (($dev,$ino,$mode,$nlink,$uid,$gid) = lstat($_)) and
    !($File::Find::prune |= ($dev != $File::Find::topdev)) and
    !exists $uid{$uid}
    ||
    !exists $gid{$gid} and

        print BOLD, RED, "\nNegativo:", RESET . " Archivo sin owner/group $name\n" and
		print F "<p class=\"negativo\">Negativo: Archivo sin owner/group $name</p>\n" and
		print R "<p>Asignarle un owner/group a $name</p>\n"
        }
print F "</div>\n";
print F "</div>\n";	


print R "</div>\n";
print R "</div>\n";	

