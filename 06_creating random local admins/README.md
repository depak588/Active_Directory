# Automating Local Admins using powershell


Run random_domain.ps1 to generate json file

```bash
.\random_domain.ps1 new.json -UserCount 8 -LocalAdminCount 3
```
 Copy the new.json and gen_ad.ps1 to the server 
 but before that create a session to the server by 
 ```bash
$server = New-PSSession -ComputerName {server ip} -Credential (Get-Credential)
```
```bash
Copy-Item .\new.json -ToSession $server C:\Windows\Tasks
Copy-Item .\gen_ad.ps1 -ToSession $server C:\Windows\Tasks
```
Then Enter in the session by
```bash
Enter-PSSession $server
```
then move to the directory C:/Windows/Tasks and run the script

```bash
.\gen_ad.ps1 ./old.json -Undo (To remove the old users)
```
```bash
.\gen_ad.ps1 ./new.json
```
If the users do not automatically to the admin group
you can manually add by

```admin
net localgroup administrators /add xyz.com\dcornish(username)
```
to check if the user is add to admin group or not is 
by 
```commands
(net localgroup administrators) and you can check all the users by (Get-ADUser OR net user /domain) 
