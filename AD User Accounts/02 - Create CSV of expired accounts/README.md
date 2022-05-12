## Function

This script will find all expired accounts in your Active Directory and output them to a CSV file.

## Logic

The script runs in 2 main stages:

1. Imports Active Directory module, if needed.
2. Creates a path for the CSV file. By default it will be placed on the desktop.
3. Searches for all expired accounts, and feeds them into an array.
4. Iterates through each expired account in the array:
    1.  Pulls and selects properties for export to the CSV. These can be changed on lines 8 and 9.
    2.  Exports properties to a CSV file.
