::: Batch File :::
::::::::::::::::::

:: Script :>
Rem Step 1: Add the user to the Administrators group.

NET LOCALGROUP Administrators Username /ADD 

Rem Step 2: Remove the user from the Users group 

NET LOCALGROUP Users Username /DELETE 

Rem Step 3 (Optional): List the users belonging to Administrators or Users group 

NET LOCALGROUP Groupname
