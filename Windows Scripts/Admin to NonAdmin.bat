::: Batch file :::
::::::::::::::::::


:: Script to change an admin user to a non-admin user
Rem Step 1: Add the user to the Users group. 

NET LOCALGROUP Users Username /ADD 

Rem Step 2: Remove the user from the Administrators group 

NET LOCALGROUP Administrators Username /DELETE 

Rem Step 3 (Optional): List the users belonging to Administrators or Users group 

NET LOCALGROUP Groupname 
