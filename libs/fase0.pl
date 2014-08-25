#!/usr/bin/perl -w
 use lib 'libs';
 use Msg;
 use utf8;
use open qw(:std :utf8);
use Encode qw(decode_utf8);
chomp $idioma_solicitado;
cambia_idioma($idioma_solicitado);

# ----------------------------------------------------------------------------------------
# Fase 0.0 -- Información del Equipo / System information
# ----------------------------------------------------------------------------------------
# Variables
my $SistemaOperativo=`uname`;
chomp $SistemaOperativo;
my $Release=`uname -r`;
chomp $Release;
my $Hostname=`uname -n`;
chomp $Hostname;
my $SistemaOperativoC=`uname -a`;
chomp $SistemaOperativoC;

print $Msg::msg[$Msg::idioma][3];
print "-" x 100;
print "\n";
print F $Msg::msg[$Msg::idioma][4];
print F "<div>\n";
print F "<div class=\"content\">\n";
print "Operating System: $SistemaOperativo\n";
print "Kernel release: $Release\n";
print "Hostname: $Hostname\n";
print "Additional Data: $SistemaOperativoC\n";

print F "<p><b>Operating System:</b> $SistemaOperativo</p>";
print F "<p><b>Kernel release:</b> $Release</p>";
print F "<p><b>Hostname:</b> $Hostname</p>";
print F "<p><b>Additional Data:</b> $SistemaOperativoC</p>";

print F "</div>\n";
print F "</div>\n";

print R $Msg::msg[$Msg::idioma][4];
print R "<div>\n";
print R "<div class=\"content\">\n";

print R "<p><b>Operating System:</b> $SistemaOperativo</p>";
print R "<p><b>Kernel release:</b> $Release</p>";
print R "<p><b>Hostname:</b> $Hostname</p>";
print R "<p><b>Additional Data:</b> $SistemaOperativoC</p>";

print R "</div>\n";
print R "</div>\n";
