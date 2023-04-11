### Powershell ###
##################

# Script to add a Windows device to the domain
$domain = “Your-domain-name" 

$username = “$domain\domain-user” #user name with privileges to add a device to the $domain 

$password = “********” |ConvertTo-SecureString –asPlainText –Force #password for the above user 

$user2 = “Administrator” #administrator account of the device 

$pass2 = “**********” #password for $user2 

$lcred = New-object –TypeName System.Management.Automation.PSCredential -ArgumentList ($user2, $pass2) 

$credential = New-object –TypeName System.Management.Automation.PSCredential -ArgumentList ($username, $password) 

Add-Computer –DomainName $domain –Credential $credential –LocalCredential $lcred –Restart –Force  

<# Other snataxes
Add-Computer

[-ComputerName <String[]>]

[-LocalCredential <PSCredential>]

[-UnjoinDomainCredential <PSCredential>]

[-Credential <PSCredential>]

[-DomainName] <String>

[-OUPath <String>] [-Server <String>]

[-Unsecure]

[-Options <JoinOptions>]

[-Restart]

[-PassThru]

[-NewName <String>]

[-Force]

[-WhatIf]

[-Confirm]

[<CommonParameters>]
#>
