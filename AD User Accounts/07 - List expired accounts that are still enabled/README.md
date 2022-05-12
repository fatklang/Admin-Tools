## Function

This script will find and list all expired accounts that are still enabled.

## Logic

The script runs in 4 main stages:

1. Imports Active Directory module, if needed.
2. Pulls all accounts that are enabled and have an expiration date, and feeds them into the $users array.
3. Iterates through each user:
    1. Checks if the account expiration date is before the current date.
    2. If the account is expired, outputs a message to the screen with the account name.
