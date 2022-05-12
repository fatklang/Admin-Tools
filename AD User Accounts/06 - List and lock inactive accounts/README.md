## Function

This script will list all inactive accounts, then disable them if desired.

## Logic

The script runs in 4 main stages:

1. Imports Active Directory module, if needed.
2. Sets a variable for how many days ago a user must last have logged in to be considered inactive. Can be edited on line 10.
3. Pulls inactive accounts:
    1. Finds all accounts that have not logged in since the number of days set in stage 2.
    2. Adds them to the $InactiveUsers array.
    2. Publishes them to the screen.
4. Offers option to disable all accounts pulled in the previous step or leave them be.
    1. Disable option:
        1. Iterates through each account in the $InactiveUsers array.
        2. Disables each account.
        3. Outputs success message for each account disabled.
    2. Leave accounts active option ends the script with no action taken.
