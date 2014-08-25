#!/usr/bin/perl -w

use lib 'libs';
use Msg;
use open qw(:std :utf8);
use Encode qw(decode_utf8);
cambia_idioma($idioma_solicitado);
no warnings;

# ----------------------------------------------------------------------------------------
# Fase 4.0 -- Archivo de autenticacion ftp / FTP authentication file
# ----------------------------------------------------------------------------------------

print "-" x 100;
print $Msg::msg[$Msg::idioma][78];
print F $Msg::msg[$Msg::idioma][79];
print F "<div>\n";
print F "<div class=\"content\">\n";

print R $Msg::msg[$Msg::idioma][79];
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
	
	print ($miidioma eq "es" ? "Archivo de autenticacion ftp $name\n" : "\nFTP authentication file $name\n") and 
	print F ($miidioma eq "es" ? "<p class=\"negativo\">Negativo: Archivo de autenticacion ftp $name</p>\n" : "<p class=\"negativo\">FTP authentication file $name</p>\n") and
	print R ($miidioma eq "es" ? "<p>Verificar si el archivos de autenticacion ftp $name es requerido</p>\n" : "<p>Verify that the $name file is required for the server’s administration</p>\n"); 
	
        }


print F "</div>\n";
print F "</div>\n";	

print R "</div>\n";
print R "</div>\n";	
