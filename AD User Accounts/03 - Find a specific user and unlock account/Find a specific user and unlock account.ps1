import-module -name activedirectory #imports AD module, if needed

Do{
    $name = read-host "Enter full name of user account, i.e. `"Steve Johnson`"" #takes account user's name as input from user

    $searchresult = Get-ADUser -Filter "name -like '$name'" #finds user with $name and adds user info to $searchresult

    If($searchresult -ne $null) { #checks to see if a user was found in the previous step, or if a null value was returned
        $nameout = $searchresult.Name
        Write-Output "$nameout found!"
    }
    else {
        Write-Output "No user $nameout found."
    }
} While ($searchresult -eq $null) #if no user is found, returns to asking for a user name

While (1 -eq 1) {
    $choice = read-host "Unlock $nameout's Account? Y/N" #asks user if they want to unlock the previously found account
    If($choice -eq "Y" -or $choice -eq "N"){Break} #if input is Y or N, continues
    Else {Write-Output "Invalid Input, Only use `"Y`" or `"N`""} #otherwise, they get another chance to provide proper input
    }

If ($choice -eq "Y"){
    Unlock-ADAccount -Identity "$searchresult" #unlocks the account
    Write-Host "$nameout's account has been unlocked!"
    }
ElseIf ($choice -eq "N"){Write-Output "Did NOT unlock $nameout's account."} #informs the user that the account was not unlocked
