
# Active Directory Enumeration (II)


Finds machines on the local domain where the current user has local administrator access

```
Find-LocalAdminAccess
```

This command retrieves the Access Control List (ACL) for the specified registry key (HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\DefaultSecurity\) and then formats the output as a list for better readability.

```
Get-ACl -Path HKLM:SYSTEM\CurrentControlSet\Services\LanmanServer\DefaultSecurity\ | fl
```
The Get-NetComputer cmdlet gets information about the computers in a specified domain or workgroup. The | select dnshostname, operatingsystem, operatingsystemversion cmdlet selects only the dnshostname, operatingsystem, and operatingsystemversion properties of the computers.

```
Get-NetComputer | select dnshostname, operatingsystem, operatingsystemversion
```
The Get-NetUser cmdlet gets information about the user accounts on a computer. The -SPN parameter specifies that you want to get information about the user accounts that have a service principal name (SPN)
```
Get-NetUser -SPN | select serviceprincipalname, Samaccountname
```
The setspn command-line tool sets the service principal name (SPN) for a specified service. The -L option lists the SPNs for the specified service.
```
setspn -L <iis_service>
```

# Enumerating Object Permissions

The Get-ObjectAcl cmdlet gets the access control list (ACL) for a specified object. The -Identity parameter specifies the name of the object for which you want to get the ACL
```
Get-ObjectAcl -Identity <username>
```
Convert the SID to simple text name
```
Convert-SIdToName <SID Object>
```
Using PowerShell to retrieve the Access Control List (ACL) for the "Administrators" group in Active Directory and filtering for entries where the Active Directory rights are set to "GenericAll." Finally, selecting the Security Identifier (SID) and Active Directory Rights for those entries.
```
Get-ObjectACl -Identity "Domain Users" | ? {$_.ActiveDirectoryRights -eq "GenericAll"} | select SecurityIdentifier,ActiveDirectoryRights
```
TO add a user to a Specific Group and then see if it has been added or not.
```
net group "<group name>" <user> /add/ domain

Get-NetGroup "<group name>" | select member
```

#Enumerating Domain Shares

The Find-DomainShare cmdlet finds all the shared folders on a domain
```
FInd-DomainShare
```

gpp-password is used to decrypt the password hash found in the domain shares policy.
```
ls \\<domain name\\dir..\\dir..>

gpp-password "<cpassword>" (In kali)

```






