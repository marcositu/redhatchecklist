#!/usr/bin/perl -w

use lib 'libs';
use Msg;
use open qw(:std :utf8);
use Encode qw(decode_utf8);
cambia_idioma($idioma_solicitado);
no warnings;


# ----------------------------------------------------------------------------------------
# Fase 1.4 -- Verificacion del archivo login.defs / Verify the login.defs file
# ----------------------------------------------------------------------------------------

print $Msg::msg[$Msg::idioma][16];
print F $Msg::msg[$Msg::idioma][17];
print F "<div>\n";
print F "<div class=\"content\">\n";

print R $Msg::msg[$Msg::idioma][17];
print R "<div>\n";
print R "<div class=\"content\">\n";

print "-" x 100;

    # Valores correctos esperados
    my %valores_correctos_de = (

        login_defs  => {
                        fichero    => '/etc/login.defs',
                        patron     => qr/^ (\S+) \s+ (\S+) $/xi,
                        parametros => {
                                        PASS_MAX_DAYS => 90,
                                        PASS_MIN_DAYS =>     7,
                                        PASS_WARN_AGE =>     7,
                                        UMASK  =>     '077',
                                        LOGIN_RETRIES  =>     3,
                                        LOGIN_TIMEOUT  =>     60,
                                        ENCRYPT_METHOD  =>     'SHA512',
										PASS_WARN_AGE =>     28,
										PASS_MIN_LEN  =>     6,
                                      },
                       },

    );

    # Arrancamos los anásis
    analiza($valores_correctos_de{login_defs});

    # Subrutina que analiza
    sub analiza {
        my $hash_ref = shift;
        my($fichero, $regex, $valores_correctos_ref) = @{$hash_ref}{'fichero','patron','parametros'};

        # Leemos el fichero a un hash segúmo lo indique la expresióegular
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
               	if ($miidioma eq "es")
			{
						print "\nEl valor del parámetro $parametro es incorrecto: [$valor_actual_de{$parametro}]\n";
						print F "<p class=\"negativo\">Negativo: El valor $valor_actual_de{$parametro} del parámetro $parametro es incorrecto</p>\n";
						print R "<p>El valor $valor_actual_de{$parametro} del parámetro $parametro es incorrecto. Recomendamos configurar el parámetro con el valor $valores_correctos_ref->{$parametro}</p>\n";
			 }
		else {
						print "\nThe value for parameter $parametro is not correct: [$valor_actual_de{$parametro}]\n";
						print F "<p class=\"negativo\">Negative: The value $valor_actual_de{$parametro} for $parametro parameter is not correct</p>\n";
						print R "<p>The value $valor_actual_de{$parametro} for $parametro parameter is not correct. It is recommended to configure the $parametro parameter whith value $valores_correctos_ref->{$parametro}</p>\n";
		}
            }
				if ($miidioma eq "es")
			{
                print "\nNo existe el parámetro $parametro en $fichero\n";
				print F "<p class=\"negativo\">Negativo: El parámetro $parametro no existe</p>\n";
				print R "<p>El parámetro $parametro no existe. Recomendamos que se configure dicho par&aacute;metro con el valor $valores_correctos_ref->{$parametro}.</p>\n";
				
				}
				
			else {
			print "\nNegative: The $parametro parameter does not exist in the file $fichero\n";
				print F "<p class=\"negativo\">Negative: The $parametro parameter does not exist in the file $fichero</p>\n";
				print R "<p>The value $valor_actual_de{$parametro} for $parametro parameter is not correct. It is recommended to configure the $parametro parameter whith value $valores_correctos_ref->{$parametro}</p>\n";
			
			}
			
          }
    }


print F "</div>\n";
print F "</div>\n";

print R "</div>\n";
print R "</div>\n";
