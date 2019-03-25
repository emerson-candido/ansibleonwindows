#Create the domain ansibleonwindows.local
Import-Module "Servermanager" #For Add-WindowsFeature
Add-WindowsFeature AD-Domain-Services, DNS -IncludeManagementTools

$netbiosname = 'AnsibleOnWin'
$fqdomname = 'ansibleonwindows.local'

$SafePassPlain = 'ansible@123'
$SafePass = ConvertTo-SecureString -string $SafePassPlain `
    -AsPlainText -force

Install-ADDSForest -DomainName $fqdomname -DomainNetBIOSName $netbiosname `
    -SafemodeAdministratorPassword $SafePass -SkipAutoConfigureDNS -SkipPreChecks `
    -InstallDNS:$true `
    -Force
