### Powershell ###
##################

# If you choose to disable all the Microsoft Accounts existing on the devices, the following script helps
$new = Get-LocalUser | Select-Object -Property Name, PrincipalSource, Enabled
foreach($u in $new)
{
if($u.PrincipalSource -eq ‘MicrosoftAccount’)
{ Write-Output $u.Name
Disable-LocalUser -Name $u.Name
}}

# Alternatively, you can get all the Microsoft Accounts re-enabled using the script below.
$new = Get-LocalUser | Select-Object -Property Name, PrincipalSource, Enabled
foreach($u in $new)
{
if($u.PrincipalSource -eq ‘MicrosoftAccount’)
{ Write-Output $u.Name
Enable-LocalUser -Name $u.Name
}}

# Disable a specific Microsoft user account on Windows
# To disable any existing user account on the device, all you have to do is replace the value “User” with the corresponding account name in the following script and execute it from the console
Disable-LocalUser -Name "User"

# re-enabling the given user account is relatively simpler. You may use the following script to achieve it
Enable-LocalUser -Name "User"
