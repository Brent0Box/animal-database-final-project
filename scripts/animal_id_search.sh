#!/bin/bash

# Database filename
DB_FILE="../animal_inventory.db"

# Accept ID as argument
id="$1"

# Function to display animal information and verify with the user
# Retrieve animal information from the database
search_results=$(sqlite3 "$DB_FILE" <<EOF
SELECT * FROM animals WHERE id='$id';
EOF
)

# Display animal information
echo "Animal Information:"
echo "$search_results"

# Verification loop
while true; do
	read -p "Is this the correct animal you want to update? (yes/no): " choice
	case $choice in
		[Yy]* ) exit 0;;  # Exit the loop if the user confirms
		[Nn]* ) exit 1;;  # Exit with failure if the user wants to choose another animal
		* ) echo "Please answer yes or no.";;
	esac
done


