
use Term::ANSIColor qw(:constants);


# ----------------------------------------------------------------------------------------
# Fase 1.4 -- Verificacion del archivo login.defs
# ----------------------------------------------------------------------------------------

print "-" x 100;
print " \nFase 1.4 -- Verificacion del archivo login.defs\n";
print F "  <h3>Fase 1.4 -- Verificaci&oacute;n del archivo login.defs</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "  <h3>Fase 1.4 -- Verificaci&oacute;n del archivo login.defs</h3>\n";
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
                else {
                    print BOLD, RED  . '\nNegativo: '. RESET, "El valor del parametro $parametro es incorrecto: [$valor_actual_de{$parametro}]\n";
						print F "<p class=\"negativo\">Negativo: El valor $valor_actual_de{$parametro} del par&aacute;metro $parametro es incorrecto</p>\n";
						print R "<p>El valor $valor_actual_de{$parametro} del par&aacute;metro $parametro es incorrecto. Recomendamos configurar el par&aacute;metro con el valor $valores_correctos_ref->{$parametro}</p>\n";
                       
                }
            }
			else {
                print BOLD . '\nNo existe ' . RESET, "el parametro $parametro en $fichero\n";
				print F "<p class=\"negativo\">Negativo: El par&aacute;metro $parametro no existe</p>\n";
				print R "<p>El par&aacute;metro $parametro no existe. Recomendamos que se configure dicho par&aacute;metro con el valor $valores_correctos_ref->{$parametro}.</p>\n";
            }
			
          }
    }


print F "</div>\n";
print F "</div>\n";

print R "</div>\n";
print R "</div>\n";
