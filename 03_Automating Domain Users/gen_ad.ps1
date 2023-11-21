param( [Parameter(Mandatory=$true)] $JSONFile )

function CreateADGroup {
    param( [Parameter(Mandatory=$true)] $groupObject)

    $groupName = $groupObject.name
    New-ADGroup -Name $groupName -GroupScope Global
}

function CreateADUser {
    param( [Parameter(Mandatory=$true)] $userObject)

    $name = $userObject.name
    $password = $userObject.password

    $firstname, $lastname = $name.Split(" ")
    $username = ($firstname[0] + $lastname).ToLower()
    $samAccountName = $username
    $principalname = $username

    New-ADUser -Name $name -GivenName $firstname -Surname $lastname -SamAccountName $samAccountName -UserPrincipalName "$principalname@$Domain" -AccountPassword (ConvertTo-SecureString $password -AsPlainText -Force) -PassThru | Enable-ADAccount

    foreach($group_name in $userObject.groups) {
        try {
            Get-ADGroup -Identity $group_name
            Add-ADGroupMember -Identity $group_name -Members $username
        }
        catch {
            Write-Warning "User $name NOT added to group $group_name because it does not exist or encountered an error"
        }
    }
}

$json = (Get-Content $JSONFile | ConvertFrom-JSON)
$Domain = $json.domain

foreach ($group in $json.groups) {
    CreateADGroup $group
}

foreach ($user in $json.users) {
    CreateADUser $user
}
