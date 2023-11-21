Now Create a Server Folder and Clone the Windows Server and name it as (DC1) and Clone the Windows and name it as (Server Management Client)

Now open the terminal in Windows Server and enable the PS Remoting

# Enable-PSRemoting 

and in the windows open powershell using admin priv. and 

# Start-Service WinRm 

# set-item wsman:\localhost\Client\TrustedHosts -value {server ip}
    (to configure the trusted hosts list for Windows Remote Management (WinRM))

# New-PSSession -ComputerName {server ip} -Credential (Get-Credential)

After that you can see the session by typing  " PSSession " 
To enter a session type

# Enter-PSSession 1

Now go back to the Server and type Sconfig to change the Server name, and IP address to Static and DNS Servers.

(Changing the Server Name) 
                            select Option 2 and Rename it and go back to the main menu and select option 8
(Change the Network Settings)
                            Select the available address and then select the 1st option set network adaptor address
                            Select Static IP address and enter the IP address (Ex:192.168.16.155)
                            and Subnet mask remain default and then set default gateway (Ex: 192.168.16.2)
                            (Note: Set the Default Gateway same as it is was before.)

(Change the DNS Servers)
                        Again go to Network Setting and choose Preffered DNS Servers and set it same as server IP address.
                        and then restart the Windows Server.

# Install-WindowsFeature AD-Domain-Services -IncludeManagementTools
        (the cmdlet is used to install the Active Directory Domain Services (AD DS) feature along with its management tools.)
# import-Module ADDSDeployment

# Install-ADDSForest
    (TO change the Domain Name to anything (Ex: xyz.com) and set a safemode password.) and then restart the server.

In terminal

# Get-NetIPAddress -IPaddress {server ip}

# Set-DNSClientServerAddress -InterfaceIndex 4(can be differ) -serverAddresses {server ip}

then Shutdown the machine and take a snapshot of it.

Create a Folder Workstation and Clone Windows 11 in it and name it as (WS01)

In the WS01 open the terminal and

# Set-DNSClientServerAddress -InterfaceIndex 4(can be differ) -serverAddresses {server ip}

# Add-Computer -DomainName xyz.com -Credential xyz/Administrator -Force -Restart
    (To join Computer to the domain and after restart the domain will be added shutdown the machine and take a snapshot of it.)