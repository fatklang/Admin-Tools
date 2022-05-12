## Function

This script first imports a bulk dataset of users and their properties from a CSV file, then creates user accounts for the users.

The example CSV in this directory shows the correct format for the file. Properties are completely changeable. The script can handle any number of properties, so you can fit it to whatever your organization needs. Simply edit line **10** to add or remove properties.

## Logic

The script runs in 2 main stages:

1. Imports data from the CSV file and stores it in an array.
2. Iterates through each item in the array
  1.  Concatenates existing properties to create new properties where needed (lines 6-8).
  2.  Feeds properties for each item into the New-ADUser cmdlet to create a new account.
