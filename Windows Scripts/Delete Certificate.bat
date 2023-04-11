::: Batch File :::  
::::::::::::::::::

:: To delete a certificate from LocalMachine
certutil –delstore certificatestorename Thumbprint 

:: To delete a certificate from CurrentUser
certutil –delstore –user certificatestorename Thumbprint 
