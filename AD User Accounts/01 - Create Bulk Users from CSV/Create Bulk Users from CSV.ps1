$users = Import-CSV bulkusers.csv
#loads data from bulkusers.csv into the $users variable

ForEach ($u in $users){ 
#starts iteration loop
	$name = $u.givenname + “ “ + $u.surname
	$upn = $u.userid + “@adatum.com” 
	$path = “OU=” + $u.department + “,DC=Adatum,DC=com”
	Write-Host "Creating user $upn"
	New-ADUser -givenname $u.givenname -surname $u.surname -name $name -displayname $u.userid -userprincipalname $upn -path $path -department $u.department
}
