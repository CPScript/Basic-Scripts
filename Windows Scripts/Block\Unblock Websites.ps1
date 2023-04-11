### Powershell ###
##################

# Blocking a website
# The host file inside the system’s C drive must be edited to block websites. Execute the following script to modify the host file and specify the websites to be blocked
$blockUrlList = @("www.facebook.com", "www.google.com", "www.youtube.com") 


$defaultHostsFile = @"

"@

try
{
    $originalhostsFile= Get-Content C:\Windows\System32\drivers\etc\hosts -ErrorAction Ignore
    $hostFileExists = $true
    if(-not($originalhostsFile))
    {
        $hostFileExists = $false
        $originalhostsFile = $defaultHostsFile
    }
    $updatedHostsFile = $originalhostsFile
    ForEach($url in $blockUrlList)
    {
        if($hostFileExists)
        {
            $updatedHostsFile = $updatedHostsFile+"127.0.0.1 $url"
        }
        else
        {
            $updatedHostsFile = $updatedHostsFile+"`n127.0.0.1 $url"
        }

    }
    $updatedHostsFile | Out-File -FilePath C:\Windows\System32\drivers\etc\hosts -Encoding utf8 -Force
    Write-Host "updated Hosts file->"
    $updatedHostsFile
}
catch
{
    Write-Host $_.Exception.Message
}


# Unblocking a website
# Execute the following script to unblock the previously blocked websites and restore the host file to its default state
$defaultHostsFile = @"

"@

try
{
    $defaultHostsFile | Out-File -FilePath C:\Windows\System32\drivers\etc\hosts -Force -Encoding utf8
    Write-Host "Hosts file updated to default->"
    $defaultHostsFile
}
catch
{
    Write-Host $_.Exception.Message
}
