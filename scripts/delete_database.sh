#!/bin/bash

# Database filename
DB_FILE="../animal_inventory.db"


while true; do
	read -p "Are you sure you want to delete the entire database? (yes/no): " choice
	case $choice in
		[yY]*)
			# Check if database file exists
			if [ -f "$DB_FILE" ]; then
			    # Delete the database file
			    rm "$DB_FILE"
			    echo "Database file deleted."
			else
			    echo "Database file does not exist."
			fi
			;;
		[nN]*)
			# Exit script
			echo "Database file not deleted."
			exit 0
			;;
		*)
			echo "Invalid choice. Please enter yes or no."
			;;
	esac
done
