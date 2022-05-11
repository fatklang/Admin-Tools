import-module -name activedirectory #imports AD module, if needed

#sets path for the OU you want to move disabled users to
$path = "OU=Disabled Users,DC=Adatum,DC=com"

#puts all disabled users outside the target OU into the $movers array
$movers = Search-ADAccount -AccountDisabled | Where {$_.DistinguishedName -notlike "*OU=Disabled Users*"} | Select Name,DistinguishedName,Enabled

#iterates through each user and moves them to the target OU. Outputs names of moved accounts and their new OU
ForEach ($m in $movers){
    $dname = $m.DistinguishedName
    $name = $m.Name
    Move-ADObject -Identity $dname -TargetPath "$path"
    Write-Output "Moved $name's account to $path"}
