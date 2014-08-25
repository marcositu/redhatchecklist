#!/usr/bin/perl -w

use lib 'libs';
use Msg;
use open qw(:std :utf8);
use Encode qw(decode_utf8);
cambia_idioma($idioma_solicitado);
no warnings;

# ----------------------------------------------------------------------------------------
# Fase 3.3 -- Verificacion de suid/gsid / Verify suid/gsid
# ----------------------------------------------------------------------------------------


print "-" x 100;
print $Msg::msg[$Msg::idioma][74];
print F $Msg::msg[$Msg::idioma][75];
print F "<div>\n";
print F "<div class=\"content\">\n";

print R $Msg::msg[$Msg::idioma][75];
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

	
	print ($miidioma eq "es" ? "\n$name con suid/gsid\n" : "\n$name with suid/gsid\n") and 
print F ($miidioma eq "es" ? "<p class=\"negativo\">$name con suid/gsid</p>\n" : "<p class=\"negativo\">$name with suid/gsid</p>\n") and
print R ($miidioma eq "es" ? "<p>Verificar si el permiso de suid/gsid en $name es el requerido</p>\n" : "<p>Verify $name with suid/gsid is required for the server’s administration</p>\n");	
	
        }

print F "</div>\n";
print F "</div>\n";			

print R "</div>\n";
print R "</div>\n";		
