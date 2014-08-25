#!/usr/bin/perl -w

use lib 'libs';
use Msg;
use open qw(:std :utf8);
use Encode qw(decode_utf8);
cambia_idioma($idioma_solicitado);
no warnings;

# ----------------------------------------------------------------------------------------
# Fase 7.0 -- Verificacion de la configuracion del servicio ssh / Verify the SSH service configuration
# ----------------------------------------------------------------------------------------

print $Msg::msg[$Msg::idioma][90];
print F $Msg::msg[$Msg::idioma][91];
print F "<div>\n";
print F "<div class=\"content\">\n";

print R $Msg::msg[$Msg::idioma][91];
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
				
						if ($miidioma eq "es") {
							print "El valor del parámetro $parametro es incorrecto: $valor_actual_de{$parametro}\n";
							print F "<p class=\"negativo\">Negativo: El valor $valor_actual_de{$parametro} del parámetro $parametro es incorrecto</p>\n";
							print R "<p>Recomendamos configurar el valor $valores_correctos_ref->{$parametro} del parámetro $parametro</p>\n";
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
							print "\nNo se encuentra configruado el parámetro $parametro\n";
							print F "<p class=\"negativo\">Negativo: No se encuentra configruado el parámetro $parametro</p>\n";
							print R "<p>No se encuentra configurado el parámetro $parametro. Recomendamos que se configure dicho parámetro con el valor $valores_correctos_ref->{$parametro}</p>\n";
						}
			 
						else {
							print "The OS event capture through syslog is not enabled\n";
							print F "<p class=\"negativo\">Negative: The value assigned to the parameter $parametro is inadequate: $valor_actual_de{$parametro}te</p>\n";
							print R "<p>The parameter $parameter is not configured. It is recommended to configure such parameter with value $valores_correct_ref->{$parámetro}</p>\n";
						}
		   
            }
        }
    }
	
	$CHECKAllowUsers=`grep "^AllowUsers" /etc/ssh/sshd_config`;
    if ($CHECKAllowUsers eq "")
	{
	
	
	
	
	
	print "El parámetro AllowUsers no existe en el archivo /etc/ssh/sshd_config\n";
	print F "<p class=\"negativo\">Negativo: El parámetro AllowUsers no existe</p>\n";	
	print R "<p>Se recomienda configurar el parámetro AllowUsers</p>\n";	
	}
	else 
	{
	print F"<p class=\"informacion\">$CHECKAllowUsers</p>\n"; 
	}
	
	$CHECKGroups=`grep "^AllowGroups" /etc/ssh/sshd_config`;
    if ($CHECKGroups eq "")
	{
	print BOLD, RED  , "\nNo existe " . RESET, "El parámetro AllowGroups no existe en el archivo /etc/ssh/sshd_config\n";
	print F "<p class=\"negativo\">Negativo: El parámetro AllowGroups no existe</p>\n";	
	print R "<p>Se recomienda configurar el parámetro AllowGroups</p>\n";
	}
	else 
	{
	print F"<p class=\"informacion\">$CHECKGroups</p>\n"; 
	}
	
	$CHECKDenyUsers=`grep "^DenyUsers" /etc/ssh/sshd_config`;
    if ($CCHECKDenyUsers eq "")
	{

							if ($miidioma eq "es") {
							print "\nNo existe el parámetro DenyUsers no existe en el archivo /etc/ssh/sshd_config\n";
							print F "<p class=\"negativo\">Negativo: El parámetro DenyUsers no existe</p>\n";	
							print R "<p>Se recomienda configurar el parámetro DenyUsers</p>\n";
						}
			 
						else {
							print "\nThe variable DenyUsers is not configured in /etc/ssh/sshd_config\n";
							print F "<p class=\"negativo\">The variable DenyUsers is not configured in /etc/ssh/sshd_config</p>\n";
							print R "<p>It is recommended to configure the DenyUsers parameter in the file</p>\n";
						}
	
	
	}
	else 
	{
	print F"<p class=\"informacion\">$CHECKDenyUsers</p>\n"; 
	}
	
	$CHECKDenyGroups=`grep "^DenyGroups" /etc/ssh/sshd_config`;
    if ($CHECKDenyGroups eq "")
	{
	
							if ($miidioma eq "es") {
							print "\nNo existe el parámetro DenyGroups no existe en el archivo /etc/ssh/sshd_config\n";
							print F "<p class=\"negativo\">Negativo: El parámetro DenyGroups no existe</p>\n";	
							print R "<p>Se recomienda configurar el parámetro DenyGroups</p>\n";
						}
			 
						else {
							print "\nThe variable DenyGroups is not configured in /etc/ssh/sshd_config\n";
							print F "<p class=\"negativo\">The variable DenyGroups is not configured in /etc/ssh/sshd_config</p>\n";
							print R "<p>It is recommended to configure the DenyGroups parameter in the file</p>\n";
						}
	
	}
	else 
	{
	print F"<p class=\"informacion\">$CHECKDenyGroups</p>\n"; 
	}
	
	
	

print F "</div>\n";
print F "</div>\n";

print R "</div>\n";
print R "</div>\n";
