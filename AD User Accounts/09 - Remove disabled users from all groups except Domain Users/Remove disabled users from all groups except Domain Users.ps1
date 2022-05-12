#This script removes all disabled users from all groups, except for domain users.

import-module -name activedirectory #imports AD module, if needed

#pulls the token for the Domain Users group and stores it in the $primarytoken variable
$primarytoken = Get-ADGroup "Domain Users" -Properties PrimaryGroupToken

#pulls all disables accounts and stores in $disabledusers array
$disabledusers = Get-ADUser -Filter "Enabled -eq '$False'" -Properties Name,PrimaryGroup,MemberOf

#determines if the user's primary group is Domain Users. If not, it is changed to Domain Users.
ForEach ($d in $disabledusers){
    If ($d.PrimaryGroup -notmatch "Domain Users"){Set-ADUser -Identity $d -Replace @{PrimaryGroupID = $primarytoken}}

#checks if account is member of any other groups besides domain users. If so, account is removed from groups
    If ($d.MemberOf){
    $group = Get-ADPrincipalGroupMembership -Identity $d | Where-Object {$_.Name -ne "Domain Users"}
    Remove-ADPrincipalGroupMembership -Identity $d -MemberOf $group -confirm:$false
    }}
