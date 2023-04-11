::: Batch File :::
::::::::::::::::::

:: Script to ping 
@echo off 
Ping –n 1 %1 |find “TTL=” > nul  
If errorlevel 1(echo The site is not reachable)  
Else 
(echo The site could be pinged) 
