#Default bootstrap for Windows VMs

#Wait for shared folder become available
while ($true) {
	try {
		Get-Item -Path c:\vagrant
		break
	} catch {
		Start-Sleep -Seconds 10
	} 
} 
	

#Move to vagrant directorry
cd c:\vagrant

#Install default softwares
& .\roles\softwares\files\install_windows_default.ps1
