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

# Function to validate numeric input
validate_numeric() {
    local input=$1
    if [[ ! $input =~ ^[0-9]+([.][0-9]+)?$ ]]; then
        echo "Error: Invalid input. Please enter a valid numeric value." >&2
        return 1
    fi
}

# Function to validate sex input
validate_sex() {
    local input=$1
    if [[ ! $input =~ ^[MFmf]$ ]]; then
        echo "Error: Invalid input. Please enter 'M' or 'F' for sex." >&2
        return 1
    fi
}

# Main script
echo "Adding new animal to the database..."

# Prompt user for animal information and validate inputs
read -p "Name: " name
read -p "Species: " species
read -p "Breed: " breed
read -p "Sex (M/F): " sex
until validate_sex "$sex"; do
    read -p "Sex (M/F): " sex
done
read -p "Weight (lbs): " weight
until validate_numeric "$weight"; do
    read -p "Weight (lbs): " weight
done
read -p "Age (years): " age
until validate_numeric "$age"; do
    read -p "Age (years): " age
done

# Call the function to insert the animal info into the database
insert_animal "$name" "$species" "$breed" "$sex" "$weight" "$age"

# Check if animal was successfully added
if [ $? -eq 0 ]; then
    echo "New animal added to database successfully. Unique ID is "$id"."
else
    echo "Failed to add new animal to the database."
fi
