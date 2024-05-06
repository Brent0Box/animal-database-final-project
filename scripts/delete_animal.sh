#!/bin/bash

# Script to delete animal entries from database

# Database filename
DB_FILE="../animal_inventory.db"


# Prompt user for animal id
echo "Enter the ID for the animal you want to delete: "
read id_search

if ./animal_id_search.sh "$id_search"; then
	echo "Proceeding with deleting the animal..."

	# Confirm Animal deletion
	while true; do
		read -p "Confirm deletion of animal entry (yes/no): " choice
		case $choice in
			[Yy]*)
				sqlite3 "$DB_FILE" <<EOF
				DELETE FROM animals WHERE id='$id_search';
EOF
				echo "Entry deleted."
				exit 0
				;;
			[Nn]*)
				echo "Entry not deleted."
				exit 1;;

			*)	echo "Please answer yes or no";;
		esac
	done
else
	echo "Choose another animal entry to delete."
fi
