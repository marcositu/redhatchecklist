#!/usr/bin/perl -w

use lib 'libs';
use Msg;
use open qw(:std :utf8);
use Encode qw(decode_utf8);
cambia_idioma($idioma_solicitado);
no warnings;



# ----------------------------------------------------------------------------------------
# Fase 3.4 -- Archivos sin owner y group / Files without owner and group
# ----------------------------------------------------------------------------------------


print "-" x 100;
print $Msg::msg[$Msg::idioma][76];
print F $Msg::msg[$Msg::idioma][77];
print F "<div>\n";
print F "<div class=\"content\">\n";

print R $Msg::msg[$Msg::idioma][77];
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
	
	print ($miidioma eq "es" ? "\n$name sin owner/group\n" : "\n$name without owner/group\n") and 
	print F ($miidioma eq "es" ? "<p class=\"negativo\">$name sin owner/group</p>\n" : "<p class=\"negativo\">$name without owner/group</p>\n") and
	print R ($miidioma eq "es" ? "<p>Asignarle un owner/group a $name</p>\n" : "<p>Assign the owner group to $name</p>\n");      
		
}
print F "</div>\n";
print F "</div>\n";	


print R "</div>\n";
print R "</div>\n";	

