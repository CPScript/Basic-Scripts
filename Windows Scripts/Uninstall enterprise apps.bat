::: Batch File :::
::::::::::::::::::

:: To uninstall .msi and .exe files
wmic product where "name like '%%product_name%%’'" call uninstall/nointeractive 
