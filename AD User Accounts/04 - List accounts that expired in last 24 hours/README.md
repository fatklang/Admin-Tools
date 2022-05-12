## Function

This script will find and list all accounts that have expired in the last 24 hours.

## Logic

1. Imports Active Directory module, if needed.
2. Sets variable for the current time and 24 hours in the past.
3. Pulls all accounts that have expired between those two times and stores them in an array.
4. Outputs the names of all accounts in the array to the screen.
