#!/bin/bash

# Database filename
DB_FILE="../animal_inventory.db"

# Function to insert animal information into the database
insert_animal() {
    sqlite3 "$DB_FILE" << EOF
    INSERT INTO animals (name, species, breed, sex, weight, age)
    VALUES ('$1', '$2', '$3', '$4', '$5', '$6');
EOF
}

# Main script
echo "Adding new animal to the database..."

# Prompt user for animal information
read -p "Name: " name
read -p "Species: " species
read -p "Breed: " breed
read -p "Sex (M/F): " sex
read -p "Weight (lbs): " weight
read -p "Age (years): " age

# Call the function to insert the animal info into the database
insert_animal "$name" "$species" "$breed" "$sex" "$weight" "$age"

# Check if animal was successfully added
if [ $? -eq 0 ]; then
    echo "New animal added to database successfully."
else
    echo "Failed to add new animal to the database."
fi
