import-module -name activedirectory #imports AD module, if needed

$InactiveDays = 30 #replace with the number of days to last logon
$DisableDate = (Get-Date).AddDays(-($InactiveDays))

$InactiveUsers = Get-ADUser -Filter "Enabled -eq '$True'" -Properties LastLogonDate,Name | Where-Object {($_.LastLogonDate -lt $DisableDate)}

Write-Output "The following accounts will be disabled:"
$InactiveUsers | FT -Property Name,DistinguishedName,LastLogonDate

$choice = Read-Host @"
Choose an option:
1 - Disable these accounts
2 - Leave accounts active (exits script)
"@

Switch($choice) {
    1 {ForEach ($i in $InactiveUsers){
        Disable-ADAccount $i -WhatIf
        $OutputName = $i.Name
        Write-Output "$OutputName's account has been disabled due to inactivity."
      }}
    2 {break}
    }
