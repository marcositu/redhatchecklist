
use Term::ANSIColor qw(:constants);
 no warnings;
 
# ----------------------------------------------------------------------------------------
# Fase 7.0 -- Verificacion de la configuracion del servicio ssh
# ----------------------------------------------------------------------------------------

print "-" x 100;
print " \nFase 7.0 -- Verificacion de la configuracion del servicio ssh\n";
print F "  <h3>Fase 7.0 -- Verificacion de la configuracion del servicio ssh</h3>\n";
print F "<div>\n";
print F "<div class=\"content\">\n";

print R "  <h3>Fase 7.0 -- Verificacion de la configuracion del servicio ssh</h3>\n";
print R "<div>\n";
print R "<div class=\"content\">\n";


print "-" x 100;

 # Valores correctos esperados
    my %valores_correctos_de = (
     
                        sshd_config => {
                        fichero    => '/etc/ssh/sshd_config',
                        patron     => qr/^ (\S+) \s* (\S+) $/xi,
                        parametros => {
                                        ListenAddress               => '10.246',
                                        PermitRootLogin             =>  'no',
                                        PasswordAuthentication      =>  'yes',
										Protocol      =>  2,
										Banner      =>  '/etc/issue',
										X11Forwarding      =>  'no',
										MaxAuthTries      =>  3,
										IgnoreRhosts      =>  'yes',
										HostbasedAuthentication      =>  'no',
										PermitEmptyPasswords      =>  'no',
										PermitUserEnvironment      =>  'no',
										ClientAliveInterval      =>  300,
										ClientAliveCountMax      =>  0,
                                      },
                       },
    );
     
    # Arrancamos los análisis
    analiza($valores_correctos_de{sshd_config});
     
    # Subrutina que analiza
    sub analiza {
        my $hash_ref = shift;
        my($fichero, $regex, $valores_correctos_ref) = @{$hash_ref}{'fichero','patron','parametros'};
     
        # Leemos el fichero a un hash según cómo lo indique la expresión regular
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
                    print
                        BOLD, RED  , "\nNegativo: ", RESET,
                        "El valor del parámetro $parametro es incorrecto: ",
                        "$valor_actual_de{$parametro}\n",
                        ;
					print F "<p class=\"negativo\">Negativo: El valor $valor_actual_de{$parametro} del par&aacute;metro $parametro es incorrecto</p>\n";
					print R "<p>Recomendamos configurar el valor $valores_correctos_ref->{$parametro} del par&aacute;metro $parametro</p>\n";
                }
            }
           else {
                print BOLD, RED  , "\nNo existe " . RESET, "El parámetro $parametro\n";
				print F "<p class=\"negativo\">Negativo: El par&aacute;metro $parametro no existe</p>\n";
				print R "<p>El par&aacute;metro $parametro no existe. Recomendamos que se configure dicho par&aacute;metro con el valor $valores_correctos_ref->{$parametro}.</p>\n";
            }
        }
    }
	
	$CHECKAllowUsers=`grep "^AllowUsers" /etc/ssh/sshd_config`;
    if ($CHECKAllowUsers eq "")
	{
	print BOLD, RED  , "\nNo existe " . RESET, "El parámetro AllowUsers no existe en el archivo /etc/ssh/sshd_config\n";
	print F "<p class=\"negativo\">Negativo: El par&aacute;metro AllowUsers no existe</p>\n";	
	print R "<p>Se recomienda configurar el par&aacute;metro AllowUsers</p>\n";	
	}
	else 
	{
	print F"<p class=\"informacion\">$CHECKAllowUsers</p>\n"; 
	}
	
	$CHECKGroups=`grep "^AllowGroups" /etc/ssh/sshd_config`;
    if ($CHECKGroups eq "")
	{
	print BOLD, RED  , "\nNo existe " . RESET, "El parámetro AllowGroups no existe en el archivo /etc/ssh/sshd_config\n";
	print F "<p class=\"negativo\">Negativo: El par&aacute;metro AllowGroups no existe</p>\n";	
	print R "<p>Se recomienda configurar el par&aacute;metro AllowGroups</p>\n";
	}
	else 
	{
	print F"<p class=\"informacion\">$CHECKGroups</p>\n"; 
	}
	
	$CHECKDenyUsers=`grep "^DenyUsers" /etc/ssh/sshd_config`;
    if ($CCHECKDenyUsers eq "")
	{
	print BOLD, RED  , "\nNo existe " . RESET, "El parámetroo DenyUsers no existe en el archivo /etc/ssh/sshd_config\n";
	print F "<p class=\"negativo\">Negativo: El par&aacute;metro DenyUsers no existe</p>\n";	
	print R "<p>Se recomienda configurar el par&aacute;metro DenyUsers</p>\n";
	}
	else 
	{
	print F"<p class=\"informacion\">$CHECKDenyUsers</p>\n"; 
	}
	
	$CHECKDenyGroups=`grep "^DenyGroups" /etc/ssh/sshd_config`;
    if ($CHECKDenyGroups eq "")
	{
	print BOLD, RED  , "\nNo existe " . RESET, "El parámetro DenyGroups no existe en el archivo /etc/ssh/sshd_config\n";
	print F "<p class=\"negativo\">Negativo: El par&aacute;metro DenyGroups no existe</p>\n";	
	print R "<p>Se recomienda configurar el par&aacute;metro DenyGroups</p>\n";
	}
	else 
	{
	print F"<p class=\"informacion\">$CHECKDenyGroups</p>\n"; 
	}
	
	
	

print F "</div>\n";
print F "</div>\n";

print R "</div>\n";
print R "</div>\n";
