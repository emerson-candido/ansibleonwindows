# install the AD services and administration tools.
Install-WindowsFeature ADCS-Cert-Authority -IncludeManagementTools

$caCommonName = 'AnsibleOnWindows CA'

# configure the CA DN using the default DN suffix (which is based on the
# current Windows Domain, example.com) to:
#
#   CN=Example Enterprise Root CA,DC=example,DC=com
#
# NB to install a EnterpriseRootCa the current user must be on the
#    Enterprise Admins group. 
Install-AdcsCertificationAuthority `
    -CAType EnterpriseRootCa `
    -CACommonName $caCommonName `
    -HashAlgorithmName SHA256 `
    -KeyLength 4096 `
    -ValidityPeriodUnits 8 `
    -ValidityPeriod Years `
    -Force

# export the CA certificate to the Vagrant project directory, so it can be used by other machines.
$check=Get-Item -Path c:\vagrant\certs
IF($check){Remove-Item -Path c:\vagrant\certs -recurse -force}
mkdir -Force C:\vagrant\certs | Out-Null
dir Cert:\LocalMachine\My -DnsName $caCommonName `
    | Export-Certificate -FilePath "C:\vagrant\certs\$($caCommonName -replace ' ','').der" `
    | Out-Null
