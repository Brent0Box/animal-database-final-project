#!/bin/bash

# Database filename
DB_FILE="../animal_inventory.db"

# Check if database file exists
if [ -f "$DB_FILE" ]; then
    # Delete the database file
    rm "$DB_FILE"
    echo "Database file deleted."
else
    echo "Database file does not exist."
fi
