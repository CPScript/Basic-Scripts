### Powershell ###
##################

# Script to download files
$client = new-object System.Net.WebClient 

$client.DownloadFile("https://www.hexnode.com/mobile-device-management/resources/hexnode-unified-endpoint-management.pdf","C:\Users\Acer\Pictures\Saved Pictures\samplefile.pdf")
