### Power Shell ###
###################

# Create user
New-LocalUser –Name “username” -NoPassword 

# Change username
Rename-LocalUser -Name "Administrator" -NewName "New Name" 

# CHange password
$SecurePassword = ConvertTo-SecureString "NewPassword" -AsPlainText -Force 
$UserAccount = Get-LocalUser -Name "Username" 
$UserAccount | Set-LocalUser -Password $SecurePassword 

# Change account type to standard
Remove-LocalGroupMember -Group "Administrators" -Member "Account Name" 

# Change account type to administrator
Add-LocalGroupMember -Group "Administrators" -Member "Account Name" 
