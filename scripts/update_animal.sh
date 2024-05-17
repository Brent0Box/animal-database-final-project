#!/bin/bash

# Database filename
DB_FILE="../animal_inventory.db"

# Prompt user for animal to update
echo "Enter the ID for the animal you want to update: "
read id_search

# Function to update animal info
update_animal() {
	local id="$1"
	local field="$2"
	local value="$3"

	# Update the specified field for the given animal ID
	sqlite3 "$DB_FILE" <<EOF
	UPDATE animals SET $field='$value' WHERE id='$id';
EOF
}


# Call the function to display and verify the animal
if ./animal_id_search.sh "$id_search"; then
	echo "Proceed with updating the animal..."
	# Start update loop
	while true; do
		# Prompt user for field to update
		echo "Which field do you want to update?"
		echo "1. Name"
		echo "2. Species"
		echo "3. Breed"
		echo "4. Sex"
		echo "5. Weight"
		echo "6. Age"
		echo "7. Update all fields"
		echo "8. Exit"

		read -p "Enter your choice: " choice

		case $choice in
			1)
				read -p "Enter the new name: " new_name
				update_animal "$id_search" "name" "$new_name"
				;;
			2)
				read -p "Enter the new species: " new_species
				new_species=$(echo "$new_species" | tr '[:upper:]' '[:lower:]')
				update_animal "$id_search" "species" "$new_species"
				;;
			3)
				read -p "Enter the new breed: " new_breed
				new_breed=$(echo "$new_breed" | tr '[:upper:]' '[:lower:]')
				update_animal "$id_search" "breed" "$new_breed"
				;;
			4)
				read -p "Enter the new sex: " new_sex
				update_animal "$id_search" "sex" "$new_sex"
				;;
			5)
				read -p "Enter the new weight: " new_weight
				update_animal "$id_search" "weight" "$new_weight"
				;;
			6)
				read -p "Enter the new age: " new_age
				update_animal "$id_search" "age" "$new_age"
				;;
			7)
				read -p "Enter the new name: " new_name
				update_animal "$id_search" "name" "$new_name"
				read -p "Enter the new species: " new_species
				update_animal "$id_search" "species" "$new_species"
				read -p "Enter the new breed: " new_breed
				update_animal "$id_search" "breed" "$new_breed"
				read -p "Enter the new sex: " new_sex
				update_animal "$id_search" "sex" "$new_sex"
				read -p "Enter the new weight: " new_weight
				update_animal "$id_search" "weight" "$new_weight"
				read -p "Enter the new age: " new_age
				update_animal "$id_search" "age" "$new_age"
				;;
			8)
				echo "Exiting update loop."
				break
			;;
				*)
				echo "Invalid choice. Please enter a valid option."
				;;
		esac
	done
else
    echo "Exiting animal update function"
fi
