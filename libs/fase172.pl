#!/usr/bin/perl -w

use lib 'libs';
use Msg;
use open qw(:std :utf8);
use Encode qw(decode_utf8);
cambia_idioma($idioma_solicitado);
no warnings;

 
# ----------------------------------------------------------------------------------------
# Fase 17.2 -- Verificacion configuraciÛn sysctl / Sysctl configuration
# ----------------------------------------------------------------------------------------

print "-" x 100;
print $Msg::msg[$Msg::idioma][127];
print F $Msg::msg[$Msg::idioma][128];
print F "<div>\n";
print F "<div class=\"content\">\n";

print R $Msg::msg[$Msg::idioma][128];
print R "<div>\n";
print R "<div class=\"content\">\n";

print "-" x 100;

    # Valores correctos esperados
    my %valores_correctos_de = (

						sysctl  => {
                        fichero    => '/etc/sysctl.conf',
                        patron     => qr/^ (\S+) \s* = \s* (\S+) $/xi,
                        parametros => {
                                        net.ipv4.ip_forward => 0,
                                        net.ipv4.conf.all.send_redirects => 0,
                                        net.ipv4.conf.default.send_redirects => 0,
                                        net.ipv4.tcp_max_syn_backlog => 1080,
                                        net.ipv4.icmp_echo_ignore_broadcasts  => 1,
                                        net.ipv4.conf.all.accept_source_route  => 0,
                                        net.ipv4.conf.all.accept_redirects  => 0,
										net.ipv4.conf.all.secure_redirects => 0,
										net.ipv4.conf.all.log_martians => 1,
										net.ipv4.conf.default.accept_source_route => 0,
										net.ipv4.conf.default.accept_redirects => 0,
										net.ipv4.conf.default.secure_redirects =>  0,
										net.ipv4.icmp_echo_ignore_broadcasts => 1,
										net.ipv4.icmp_ignore_bogus_error_responses => 1,
										net.ipv4.tcp_syncookies => 1,
										net.ipv4.conf.all.rp_filter => 1,
										net.ipv4.conf.default.rp_filter => 1,
										net.ipv4.tcp_timestamps => 0,
                                      },
                       },

    );

    # Arrancamos los an√°sis
    analiza($valores_correctos_de{sysctl});

    # Subrutina que analiza
    sub analiza {
        my $hash_ref = shift;
        my($fichero, $regex, $valores_correctos_ref) = @{$hash_ref}{'fichero','patron','parametros'};

        # Leemos el fichero a un hash seg√∫mo lo indique la expresi√≥egular
        my %valor_actual_de;
        open my $fh, q[<], $fichero;
        while (<$fh>) {
            if (/$regex/) {
                $valor_actual_de{ $1 } = $2;
            }
        }

        close $fh;

        # Comprobamos los valores correctos
        for my $parametro (sort keys %$valores_correctos_ref) {
            if (exists $valor_actual_de{$parametro}) {
                if ($valor_actual_de{$parametro} eq $valores_correctos_ref->{$parametro}) {
                    #print BOLD, GREEN, 'Positivo: ', RESET, "El valor del parametro $parametro es correcto\n";
                }
                else {
				
					if ($miidioma eq "es") {
						print "El valor del par·metro $parametro es incorrecto: [$valor_actual_de{$parametro}]\n";
						print F "<p class=\"negativo\">Negativo: El valor $valor_actual_de{$parametro} del par·metro $parametro es incorrecto</p>\n";
						print R "<p>El valor $valor_actual_de{$parametro} del par·metro $parametro es incorrecto. Recomendamos configurar el par·metro con el valor $valores_correctos_ref->{$parametro}</p>\n";
                       
						}
			 
						else {
							print "The value assigned to the parameter $parametro is inadequate: $valor_actual_de{$parametro}\n";
							print F "<p class=\"negativo\">Negative: The value assigned to the parameter $parametro is inadequate: $valor_actual_de{$parametro}</p>\n";
							print R "<p>The recommended configuration value $valores_correctos_ref->{$parametro} for the $parametro parameter</p>\n";
						}
				
                       
                }
            }
			else {
			
			
			if ($miidioma eq "es") {
				print "\nNo existe el par·metro $parametro en $fichero\n";
				print F "<p class=\"negativo\">Negativo: El par·metro $parametro no existe</p>\n";
				print R "<p>El par·metro $parametro no existe. Recomendamos que se configure dicho par·metro con el valor $valores_correctos_ref->{$parametro}.</p>\n";
						}
			 
						else {
							print "\nThe $parametro parameter does not exist in the file $fichero\n";
							print F "<p class=\"negativo\">The $parametro parameter does not exist in the file $fichero</p>\n";
							print R "<p>The $parametro parameter does not exist.The recommended configuration value $valores_correctos_ref->{$parametro} for the $parametro parameter/p>\n";
						}
			
            }
			
          }
    }


print F "</div>\n";
print F "</div>\n";

print R "</div>\n";
print R "</div>\n";
