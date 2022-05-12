import-module -name activedirectory #imports AD module, if needed

$yesterday = (Get-Date).adddays(-1) #provides a time variable 24 hours in the past
$today = (Get-Date) #populates $today with current date/time

$users = Get-ADUser -filter "accountexpirationdate -ge '$yesterday' -and accountexpirationdate -le '$today'" -properties AccountExpirationDate,displayname #filters users whose account expiration date falls between the current time and 24 hours before

ForEach ($u in $users){
    write-output "$u - Account expired in last 24H" #outputs users whose accounts have expired
    }
