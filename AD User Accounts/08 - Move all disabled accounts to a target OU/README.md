## Function

This script will move all disabled accounts to a specified OU.

## Logic

The script runs in 4 main stages:

1. Imports Active Directory module, if needed.
2. Sets a target path for disabled accounts in the $path variable. This can be edited on line 4.
3. Searches for all disabled accounts that are not currently in the specified OU and feeds them into the $movers array.
4. Iterates through accounts in $movers array:
    1. Moves the account into the path identified in the $path variable.
    2. Outputs a success messaage to the screen with the account name and new path.
