#!/usr/bin/perl -w

use lib 'libs';
use Msg;
use open qw(:std :utf8);
use Encode qw(decode_utf8);
cambia_idioma($idioma_solicitado);
no warnings;

# ----------------------------------------------------------------------------------------
# Fase 3.1 -- Verificacion de Sticky Bit / Verify Sticky Bit
# ----------------------------------------------------------------------------------------
print "-" x 100;
print $Msg::msg[$Msg::idioma][70];
print F $Msg::msg[$Msg::idioma][71];
print F "<div>\n";
print F "<div class=\"content\">\n";

print R $Msg::msg[$Msg::idioma][71];
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
    
print   ($miidioma eq "es" ? "\nSe detecto sticky bit en $name\n" : "\nSticky Bit is enabled in the file $name\n") and 
print F ($miidioma eq "es" ? "<p class=\"negativo\">Se detecto sticky bit en $name</p>\n" : "<p class=\"negativo\">Sticky Bit is enabled in the file $name</p>\n") and
print R ($miidioma eq "es" ? "<p>Verificar si el permiso de sticky bit de $name es requerido.</p>\n" : "<p>Verify that the sticky bit on the $name is required for the server’s administration.</p>\n");

}

print F "</div>\n";
print F "</div>\n";	

print R "</div>\n";
print R "</div>\n";	

print "-" x 100;
