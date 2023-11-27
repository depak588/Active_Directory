
# Generate Local Admins Across Hosts

In this we will create users with local_admin privelges across the hosts.

So first remove all the old users by
```old users
.\gen_ad.ps1 ./new.json -Undo
```
then delete all the files in the Tasks Folder and then again copy the gen_ad.ps1 and ad_schema.json in the Tasks Folder

Now clone the Ws010 and rename it to Ws020 and remove both of them from the server and and change the hostname of both the machines to Ws010 and Ws020 to easily identify them in the server.
```change hostname
Rename-Computer "ws010" -DomainCredential (Get-Credential)
```
(In both ws01 and ws02 and then restart the machines.)

After that rejoin both the machines and you can check that the machines are connected to the domain by 
```check connection
Get-ADComputer -Filter *
```

Now in both the Hosts open terminal with admin privelges in the local_admin account and run the Commands
```Commands
Enable-PSRemoting
set-item wsman:\localhost\client\trustedhosts -value dc1.xyz.com 
start-service WinRm
```
and to check that the machines are connected to the domain try the command 
```check
Invoke-Command -Computer ws010 -ScriptBlock { ipconfig }
```
If it run the hosts are connected successfully, Now go the tasks foler and again run the Script
```Scrtipt Run
./gen_ad.ps1 ./ad_schema.json
```
and it will add the user to the host with admin privelges now sign out the local_admin in any of the host and login with the new user with the privelges and the shut down the machines and take snapshot of all of them till here.