### Powershell ###
##################

# The script below edits the Windows registry to allow users to run only specific third-party applications. For instance, for $Value1 and $Value2, replace firefox.exe and wordpad.exe with the name of the third-party apps you want users to access. Users will be restricted from all the other third-party apps. To specify more than two applications, you may add apps as $Value3, $Value4, etc., and set the values for those apps using Set-ItemProperty.
try{ 

    $status = New-PSDrive -PSProvider Registry -Name HKU -Root HKEY_USERS 
    Function Allow-certain-apps($sid) 
    { 
        if(Test-Path "HKU:\${sid}") 
        { 
            # Set variables to indicate value and key to set 
            $RegistryPath = "HKU:\${sid}\Software\Microsoft\Windows\CurrentVersion\Policies" 
            $Key = 'Explorer' 
           
            # Create the key if it does not exist -> for creating Explorer key 
            If (-NOT (Test-Path "$RegistryPath\$Key")) 
            { 
               New-Item -Path "${RegistryPath}\${Key}" -Force | Out-Null 
            } 

            $Name = 'RestrictRun' 
            $Value = '1' 
            # Now set the value 
            Set-ItemProperty -Path "${RegistryPath}\${Key}" -Name $Name -Value $Value -Force 

            # Create subkey if it does not exist -> for creating RestrictRun key 
            $Subkey = 'RestrictRun' 
            If (-NOT (Test-Path "${RegistryPath}\${Key}\${Subkey}")) 
            { 
                New-Item -Path "${RegistryPath}\${Key}\${Subkey}" -Force | Out-Null 
            } 

            $ValueName1 = '1' 
            $Value1 = firefox.exe 
            $ValueName2 = '2' 
            $Value2 = wordpad.exe 

            # Now set the values for apps 
            Set-ItemProperty -Path "${RegistryPath}\${Key}\${Subkey}" -Name $ValueName1 -Value $Value1 –Force 
            Set-ItemProperty -Path "${RegistryPath}\${Key}\${Subkey}" -Name $ValueName2 -Value $Value2 -Force 
        } 
    } 
    $userDetails=Get-wmiobject win32_useraccount | where-object{$_.status -eq 'ok'} 
    foreach($user in $userDetails) 
    { 
        $sid=$user.SID 
        Allow-certain-apps($sid) 
    } 
} 
catch 
{ 
    Write-Host "Error occured while running script -> ",$_.Exception.Message 
} 
