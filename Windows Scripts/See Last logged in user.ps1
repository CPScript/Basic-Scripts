### Powershell ###
##################

# Script to get last logged on user
if ($PSHOME -like "*syswow64*") {   

Write-Output 'Relaunching as x64'   

& (Join-Path ($PSHOME -replace 'syswow64', 'sysnative') powershell.exe) `     

  -File $Script:MyInvocation.MyCommand.Path `   

}

get-localuser | where {$_.name} | select-object lastlogon,name | sort-object lastlogon –Descending |  select-object lastlogon,name  -first 1|Write-Output  
