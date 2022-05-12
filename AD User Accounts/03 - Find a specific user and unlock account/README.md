## Function

This script will search for a specific user using the "Name" property, then will give the user the option to unlock said user's account.

## Logic

1. Imports Active Directory module, if needed.
2. Find user account loop
    1.  Asks the user for a Name property to search for the account.
    2.  Searches for the user and adds the user information to an array.
    3.  Displays whether or not a user by that name was found.
    4.  If no user is found, the script restarts the loop, asking for a Name again.
3. Unlock user account loop
    1. Ask if user wants to unlock the account found in the previous stage.
    2. If yes, unlocks account and outputs a success message.
    3. If no, does not unlock account.
