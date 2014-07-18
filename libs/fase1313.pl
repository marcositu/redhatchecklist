use Term::ANSIColor qw(:constants);

# ----------------------------------------------------------------------------------------
# Fase 13.0 -- Hash de binarios
# ----------------------------------------------------------------------------------------

print "-" x 100;
print " \nFase 13.0 -- Hash de binarios\n";
print F "  <h3>Fase 13.0 -- Hash de binarios</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "  <h3>Fase 13.0 -- Hash de binarios</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";

print "-" x 100;

use Digest::MD5;

sub md5sum
{
  my $file = shift;
  my $digest = "";
  eval{
    open(FILE, $file);
    my $ctx = Digest::MD5->new;
    $ctx->addfile(*FILE);
    $digest = $ctx->hexdigest;
    close(FILE);
  };
  if($@){
    print $@;
    return "";
  }
  return $digest;
}

my @archivos = ("/usr/sbin/ping6","/usr/sbin/ethtool","/usr/sbin/groupadd","/usr/sbin/groupdel","/usr/sbin/groupmod","/usr/sbin/hald","/usr/sbin/logrotate","/usr/sbin/lsof","/usr/sbin/luseradd","/usr/sbin/mtr","/usr/sbin/NetworkManager","/usr/sbin/ntpd","/usr/sbin/ntptime","/usr/sbin/tcpd","/usr/sbin/sshd","/usr/sbin/sendmail","/usr/sbin/rpcinfo","/usr/sbin/tcpdump","/usr/sbin/useradd","/usr/sbin/userdel","/usr/sbin/usermod","/usr/sbin/visudo","/sbin/arp","/sbin/chkconfig","/sbin/hwclock","/sbin/dhclient","/sbin/e2fsck","/sbin/ethtool","/sbin/halt","/sbin/ifconfig","/sbin/init","/sbin/ip","/sbin/iptables","/sbin/iwconfig","/sbin/lspci","/sbin/lsmod","/sbin/lsusb","/sbin/mke2fs","/sbin/mkfs","/sbin/portmap","/sbin/route","/sbin/rmmod","/sbin/service","/sbin/tc","/sbin/tune2fs","/sbin/tune2fs","/sbin/vconfig");

foreach $varb (@archivos){

my $fname = $varb;
my $md5 =  md5sum($fname);

if($md5 ne ""){
                print $md5." ".$fname."\n";
				print BOLD, WHITE, "\nInformacion:", RESET . $md5." ".$fname."\n";
				print F"<p>$md5 $fname</p>\n";
        }
		
}


print R "<p>Se recomienda analizar los hash listados en el informe en el sitio de Virus Total</p>\n";

print F "</div>\n";
print F "</div>\n";

print R "</div>\n";
print R "</div>\n";
