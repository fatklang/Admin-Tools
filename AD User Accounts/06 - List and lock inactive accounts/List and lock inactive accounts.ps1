<#
This script:
1. Builds a list of all enabled accounts that have not logged in during the past 30 days.
2. Presents the list to the user.
3. Provides the option to either lock all accounts, or leave them enabled.
#>

import-module -name activedirectory

$InactiveDays = 30 #replace with the desired number of days to last logon
$DisableDate = (Get-Date).AddDays(-($InactiveDays))

#finds all inactive users and stores them in the $InactiveUsers variable, then prints them to the screen
$InactiveUsers = Get-ADUser -Filter "Enabled -eq '$True'" -Properties LastLogonDate,Name | Where-Object {($_.LastLogonDate -lt $DisableDate)}
Write-Output "The following accounts will be disabled:"
$InactiveUsers | FT -Property Name,DistinguishedName,LastLogonDate

#gives the option to lock accounts in $InactiveUsers or leave them enabled
While (1 -eq 1) {
    $choice = Read-Host @"
Choose an option:
1 - Disable these accounts
2 - Leave accounts active (exits script)
"@
    If($choice -eq "1" -or $choice -eq "2"){Break}
    Else {Write-Output "`nInvalid input, please select a valid option.`n"} 
    }

Switch($choice) {
    1 {ForEach ($i in $InactiveUsers){ #iterates through accounts nad locks them all
        Disable-ADAccount $i
        $OutputName = $i.Name
        Write-Output "$OutputName's account has been disabled due to inactivity."
      }}
    2 {break} #ends the script without locking accounts
    }
