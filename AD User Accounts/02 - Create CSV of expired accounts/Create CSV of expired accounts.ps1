import-module -name activedirectory #imports AD module, if needed

$path = [Environment]::GetFolderPath("Desktop")+'\'+'IsExpired-'+(Get-Date -format M-d-yyyy)+'.csv' #provides a path to the desktop for the CSV file; stores in $path

$($expiring = Search-ADAccount -AccountExpired #pulls all users with expired accounts; stores in $expiring

ForEach ($e in $expiring){ #iterates through all users pulled in $expiring
    $e = Get-ADUser $e -Properties Name, ObjectClass, AccountExpirationDate, Enabled #pulls properties for later output to CSV. Change this line to get properties you want.
    $e | select Name, ObjectClass, AccountExpirationDate, Enabled #selects the properties that will be exported
}) | Export-Csv -path $path -NoTypeInformation #exports data to CSV file at location in $path
