::: Batch File :::
::::::::::::::::::

:: Batch script to install your EXE app
bitsadmin.exe /transfer "Name_of_the_process" download_url path_of_exe_file 
Start path_of_exe_file 
