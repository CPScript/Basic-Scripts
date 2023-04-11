### Powershell ###
##################

# Script to Block Apps
#specify the apps that needs to be blocked (comma separated).
$blockListedApps = @("app1.exe", "app2.exe", "app3.exe")

Write-Host "List of apps that will get blocked:--->"
Write-Host $blockListedApps -Separator ","

try{
    $status = New-PSDrive -PSProvider Registry -Name HKU -Root HKEY_USERS
    Function BlockApps($sid)
    {
        $policyPath = "HKU:\${sid}\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies"
        if(Test-Path $policyPath)
        {
            $ExplorerPath = $policyPath + "\Explorer"
            if(-not(Test-Path $ExplorerPath))
            {
                New-Item -Path $ExplorerPath -Force | Out-Null
            }
            New-ItemProperty -Path $ExplorerPath -Name "DisallowRun" -Value 1 -PropertyType DWord -Force | Out-Null
            $DisallowRunPath = $ExplorerPath + "\DisallowRun"
            if(-not(Test-Path $DisallowRunPath))
            {
                New-Item -Path $DisallowRunPath -Force | Out-Null
            }
            $count = 1
            Foreach($app in $blockListedApps)
            {
                New-ItemProperty -Path $DisallowRunPath -Name $count -Value $app -PropertyType STRING -Force | Out-Null
                $count++
            }
        }
        else
        {
            Write-Host "Unable to locate policies path, please check manually"
        }
    }
    $userDetails=Get-wmiobject win32_useraccount | where-object{$_.status -eq 'ok'}
    $loggedInUserCount = 0
    foreach($user in $userDetails){
        $sid=$user.SID
        $username = $user.Name
        if(Test-Path "HKU:\${sid}")
        {
            Write-Host $username,"is signed-in to the device."
            Write-Host "blocking apps for the user:",$username
            BlockApps($sid)
            $loggedInUserCount++
        } 
    }
    if($loggedInUserCount -eq 0)
    {
        Write-Host "Policy hasn't applied to any user, this policy can only be applied when the user is logged in to the device"
    }
    else
    {
        Write-Host "Restart the device to review the changes."
    }
}
catch
{
    Write-Host "Error occured while running script -> ",$_.Exception.Message
}

# To remove the application restrictions on the device, you can execute the PowerShell script below
try{
    $status = New-PSDrive -PSProvider Registry -Name HKU -Root HKEY_USERS
    Function BlockApps($sid)
    {
        $policyPath = "HKU:\${sid}\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies"
        if(Test-Path $policyPath)
        {
            $ExplorerPath = $policyPath + "\Explorer"
            if(Test-Path $ExplorerPath)
            {
                Remove-ItemProperty -Path $ExplorerPath -Name "DisallowRun" -Force | Out-Null
            }
            $DisallowRunPath = $ExplorerPath + "\DisallowRun"
            if(Test-Path $DisallowRunPath)
            {
                Remove-Item -Path $DisallowRunPath -Force | Out-Null
            }
        }
        else
        {
            Write-Host "Unable to locate policies path, please check manually"
        }
    }
    $userDetails=Get-wmiobject win32_useraccount | where-object{$_.status -eq 'ok'}
    $loggedInUserCount = 0
    foreach($user in $userDetails){
        $sid=$user.SID
        $username = $user.Name
        if(Test-Path "HKU:\${sid}")
        {
            Write-Host $username,"is signed-in to the device."
            Write-Host "removing blacklisted apps from user:",$username
            BlockApps($sid)
            $loggedInUserCount++
        } 
    }
    if($loggedInUserCount -eq 0)
    {
        Write-Host "Policy hasn't applied to any user, this policy can only be applied when the user is logged in to the device"
    }
    else
    {
        Write-Host "Restart the device to review the changes."
    }
}
catch
{
    Write-Host "Error occured while running script -> ",$_.Exception.Message
}
