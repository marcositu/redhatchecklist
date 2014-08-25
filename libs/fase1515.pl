#!/usr/bin/perl -w

use lib 'libs';
use Msg;
use open qw(:std :utf8);
use Encode qw(decode_utf8);
cambia_idioma($idioma_solicitado);
no warnings;


# ----------------------------------------------------------------------------------------
# Fase 15.0 -- Cron.Daily 
# ----------------------------------------------------------------------------------------

print "-" x 100;
print $Msg::msg[$Msg::idioma][115];
print F $Msg::msg[$Msg::idioma][116];
print F "<div>\n";
print F "<div class=\"content\">\n";

print R $Msg::msg[$Msg::idioma][116];
print R "<div>\n";
print R "<div class=\"content\">\n";

print "-" x 100;

$dirtoget="/etc/cron.daily/";
opendir(IMD, $dirtoget) || die("Cannot open directory");
@thefiles= readdir(IMD);
closedir(IMD);


foreach $f (@thefiles)
{
 unless ( ($f eq ".") || ($f eq "..") )
 {
 print " \n/etc/cron.daily/$f\n";
 print F "<p>/etc/cron.daily/$f</p>\n";
 }
}
	
print R "<p>Se recomienda analizar si los archivos situados en el crond.daily son los esperados.</p>\n";
print F "</div>\n";
print F "</div>\n";

print R "</div>\n";
print R "</div>\n";
