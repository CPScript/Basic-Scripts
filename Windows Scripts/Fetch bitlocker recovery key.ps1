### Powershell ###
##################

# script
$bitlockerDetails = Get-BitLockerVolume 
Foreach($drive in $bitlockerDetails) 
{ 
$drive.MountPoint + $bitlockerDetails.KeyProtector.RecoveryPassword 
}
