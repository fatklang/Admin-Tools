## Function

This script will find all locked accounts and either display them to the screen or export them to a CSV file.

## Logic

1. Imports Active Directory module, if needed.
2. Offers the user the choice of screen output or a CSV file.
    1. Screen output option:
        1. Searches for all accounts that are locked, then pipes them to a table. Output properties can be customized in line 10.
    1. CSV output option:
        1. Creates a variable for a path to store the CSV. This will be the desktop by default and can be edited in line 13.
        2. Pulls all accounts that are locked with properties.
        3. Selects properties for display.
        4. Pipes properties to an Export-CSV cmdlet.
        5. Outputs a success message displaying the path of the CSV file.
