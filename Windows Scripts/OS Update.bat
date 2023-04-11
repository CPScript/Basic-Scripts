::: Batch File :::
::::::::::::::::::

:: Script to update your OS
usoclient ScanInstallWait 
usoclient StartInstall 
timeout /t time _to_wait_in seconds 
usoclient RestartDevice 
