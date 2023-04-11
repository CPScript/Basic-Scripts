::: Scripts in batch :::
::::::::::::::::::::::::

:: Enable Firewall on all profiles specifically domain, private and public
netsh advfirewall set allprofiles state on

:: Disable Firewall on all profiles specifically domain, private and public
netsh advfirewall set allprofiles state off

:: Enable Firewall on current profile
netsh advfirewall set currentprofile state on

:: Disable Firewall on current profile
netsh advfirewall set currentprofile state off

:: Add a Firewall rule name for any given application (for instance, Google Chrome) meant for the inbound traffic to the device 
netsh advfirewall firewall add rule name="SetUpFirewall" dir=in Program="C:\Program Files\Google\Chrome\Application\chrome.exe" action=block 

:: Allow a port for inbound traffic in Firewall
netsh advfirewall firewall add rule name="Allow Port 80" dir=in action=allow protocol=TCP remoteport=80  

:: Block a port for inbound traffic in Firewall
netsh advfirewall firewall add rule name="Block Port 80" dir=in action=block protocol=TCP remoteport=80 

:: Remove a configured Firewall rule
netsh advfirewall firewall delete rule name=”new_rule”
