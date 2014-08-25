#!/usr/bin/perl -w

use lib 'libs';
use Msg;
use open qw(:std :utf8);
use Encode qw(decode_utf8);
cambia_idioma($idioma_solicitado);
no warnings;


# ----------------------------------------------------------------------------------------
# Fase 1.10 -- Usuarios con acceso al sistema / Users with system access
# ----------------------------------------------------------------------------------------

print $Msg::msg[$Msg::idioma][53];
print F $Msg::msg[$Msg::idioma][54];
print F "<div>\n";
print F "<div class=\"content\">\n";

print R $Msg::msg[$Msg::idioma][54];
print R "<div>\n";
print R "<div class=\"content\">\n";
print "-" x 100;

open(USER,"/etc/passwd");

while (<USER>) {
       ($linea)=split(/\n/,$_,1); (@userdata)=split(/:/,$linea);
       $tieneshell=$userdata[6];
       chomp ($tieneshell);
        $username=$userdata[0];
        chomp ($username);
       $gid=$userdata[2];
       chomp ($gid);
       if ($username ne "root" && $username ne "halt" && $username ne "sync" && $username ne "shutdown")
       {
       if ($tieneshell ne "/sbin/nologin" && $tieneshell ne "/bin/false" && $tieneshell ne "/usr/sbin/nologin")
        {
		open(SINPASSWD,"/etc/shadow");
		while (<SINPASSWD>) {
       ($linea)=split(/\n/,$_,1); (@userdata)=split(/:/,$linea);
	   $user=$userdata[0];
       $passwd=$userdata[1];
	   if ($username eq $user)
	   {
		if ($passwd ne "*" && $passwd ne "!" && $passwd ne "!!") {
        print "\nUser: $user\n";
		print F "<p>$user</p>\n";
        }
	   }
	   
}

        }

      }


}


close (SINPASSWD);
close(USER);

print R $Msg::msg[$Msg::idioma][55];

print F "</div>\n";
print F "</div>\n";

print R "</div>\n";
print R "</div>\n";