import-module -name activedirectory #imports AD module, if needed

$users = Get-ADUser -filter "enabled -eq 'true'" -properties AccountExpirationDate

ForEach ($u in $users){
    if(($u.accountexpirationdate) -lt (Get-Date)){
        write-output "$u - Account is expired, but still enabled."
    }
}
