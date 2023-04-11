### Powershell ###
##################

# list all the subkeys present in the local machine registry, use the following command
Get-ChildItem -Path HKLM:\ | Select-Object Name
