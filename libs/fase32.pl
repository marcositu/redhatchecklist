#!/usr/bin/perl -w

use lib 'libs';
use Msg;
use open qw(:std :utf8);
use Encode qw(decode_utf8);
cambia_idioma($idioma_solicitado);
no warnings;
# ----------------------------------------------------------------------------------------
# Fase 3.2 -- Verificar Archivos con write para todos los usuarios / Verify files with write privilege for all users
# ----------------------------------------------------------------------------------------

print $Msg::msg[$Msg::idioma][72];


print F $Msg::msg[$Msg::idioma][73];
print F "<div>\n";
print F "<div class=\"content\">\n";


print R $Msg::msg[$Msg::idioma][73];
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
    )and

	
print ($miidioma eq "es" ? "\n$name con permisos de escritura para todos los usuarios\n" : "\n$name with WRITE privileges for all users\n") and 
print F ($miidioma eq "es" ? "<p class=\"negativo\">$name con permisos de escritura para todos los usuarios</p>\n" : "<p class=\"negativo\">$name with WRITE privileges for all users</p>\n") and
print R ($miidioma eq "es" ? "<p>Verificar si el permisos de escritura para todos los usuarios del $name es el requerido</p>\n" : "<p>Verify $name with WRITE privileges for all users</p>\n");	

}

print F "</div>\n";
print F "</div>\n";	

print R "</div>\n";
print R "</div>\n";	

