import-module -name activedirectory #imports AD module, if needed

$choice = Read-Host @"
Make a selection:
1 - View table of locked AD accounts
2 - Export locked accounts to a CSV file
"@

Switch ($choice) {
    1 {Search-ADAccount -lockedout | FT -property Name,SamAccountName,LastLogonDate,LockedOut
    }
    2 {
    $path = [Environment]::GetFolderPath("Desktop")+'\'+'LockedADAccounts-'+(Get-Date -format M-d-yyyy)+'.csv' #provides a path to the desktop for the CSV file; stores in $path
    $($locked = Search-ADAccount -lockedout #pulls all locked accounts; stores in $locked

    ForEach ($l in $locked){ #iterates through all users pulled in $locked
        $l = Get-ADUser $l -Properties Name,SamAccountName,LastLogonDate,LockedOut #pulls properties for later output to CSV. Change this line to get properties you want.
        $l | select Name,SamAccountName,LastLogonDate,LockedOut #selects the properties that will be exported
    }) | Export-Csv -path $path -NoTypeInformation #exports data to CSV file at location in $path
    Write-Output "CSV file created at $path"
    }
    }
