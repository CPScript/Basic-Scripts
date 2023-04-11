### Powershell ###
##################

# Script XD
Param($src,$dest) 

If (Test-Path –Path $dest){ 

Write-Host “The target folder exists. All the older files in this folder will be deleted.” 

Remove-Item $folder –Recurse –Force 

} else{ 

Write-Host “The target folder does not exist. A new folder will be created to store the backup files and folders.” 

} 

Copy-Item –path $src –Destination $dest –recurse 
