## Function

This script will find all disabled users, assign their primary group to the Domain Users, then remove them from all other groups.

Note that every account in AD *must* have a primary group, and cannot be removed from their primary group without changing it. As some users will have primary groups other than Domain Users, it is necessary to assign the Domain Users group as a primary group for all accounts before removing them from all other groups.

## Logic

The script runs in 4 main stages:

1. Imports Active Directory module, if needed.
2. Pulls the PrimaryGroupToken property from the Domain Users group and stores it in $primarytoken variable.
3. Pulls all accounts that are not enabled, and feeds them and their group properties into the $disabledusers array.
4. Iterates through each account in $disabledusers:
    1. Checks if the account's primary group is **not** Domain Users:
        1. If true, replaces accounts PrimaryGroupID with the token in $primarytoken to change the primary group to Domain Users.
        2. If false, continues to next check.
    2. Checks if the account is a member of any groups besides domain users:
        1. If true:
            1. Pull all groups the account is a member of, and that are **not** Domain Users and feeds them into the $group array.
            2. Removes all groups stored in the $group array from the account.
        2. If false, continues to next account.
