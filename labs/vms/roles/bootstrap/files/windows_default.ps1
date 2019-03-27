#Default bootstrap for Windows VMs

#Wait for VM is ready
Start-Sleep -Seconds 120

#Goto to vagrant directorry
cd c:\vagrant

#Install default softwares
& .\roles\softwares\files\install_windows_default.ps1
