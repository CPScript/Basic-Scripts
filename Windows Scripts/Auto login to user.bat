### Powershell ###
##################

# Script to automatically log in to a user account on Windows
$Username = $args[0]
$key = $args[1]
$RegistryPath = 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon'

If ((Get-Item -Path $RegistryPath).GetValue('ForceAutoLogon') -ne '1') {Set-ItemProperty -Path $RegistryPath -Name 'ForceAutoLogon'-Value 1} 

If ((Get-Item -Path $RegistryPath).GetValue('AutoAdminLogon') -ne '1') {Set-ItemProperty -Path $RegistryPath -Name 'AutoAdminLogon'-Value 1} 

If ((Get-Item -Path $RegistryPath).GetValue('DefaultUsername') -ne $Username) {Set-ItemProperty -Path $RegistryPath -Name 'DefaultUsername'-Value $Username } 

If ((Get-Item -Path $RegistryPath).GetValue('DefaultPassword') -ne $key) {Set-ItemProperty -Path $RegistryPath -Name 'DefaultPassword'-Value $key } 

Restart-Computer -Force
