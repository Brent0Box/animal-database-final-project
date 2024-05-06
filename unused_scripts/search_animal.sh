#!/bin/bash

# Database filename
DB_FILE="../animal_inventory.db"

# Function to search for an animal by ID
search_by_id() {
    local search_term="$1"
    local search_results

    search_results=$(sqlite3 "$DB_FILE" <<EOF
    SELECT * FROM animals WHERE id=$search_term;
EOF
    )

    # Check if any results were found
    if [[ -z "$search_results" ]]; then
        echo "No animal found with ID $search_term."
    else
        echo "$search_results"
    fi
}

# Function to search for an animal by name
search_by_name() {
    local search_term="$1"
    local search_results

    search_results=$(sqlite3 "$DB_FILE" <<EOF
    SELECT * FROM animals WHERE name='$search_term';
EOF
    )

    # Check if any results were found
    if [[ -z "$search_results" ]]; then
        echo "No animal found with the name '$search_term'."
    else
        echo "$search_results"
    fi
}

# Function to prompt the user to select an animal ID when multiple animals have the same name
select_animal_id() {
    local search_results="$1"
    local search_term="$2"

    echo "Multiple animals found with the name '$search_term':"
    echo "$search_results"
    echo "Enter the ID of the desired animal: "
    read selected_id

    # Verify if the selected ID is valid
    verify_id "$selected_id" "$search_results"
}

# Function to verify if the selected ID is valid
verify_id() {
    local selected_id="$1"
    local search_results="$2"

    if [[ $(echo "$search_results" | grep -w "$selected_id" | wc -l) -eq 0 ]]; then
        echo "Invalid ID. Please enter a valid ID."
        select_animal_id "$search_results" "$search_term"
    else
        search_by_id "$selected_id"
    fi
}

# Main script
echo "Search for an animal by name or ID:"
read -p "Enter the name or ID of the animal: " search_input

# Check if the search term is a number (ID) or a name
if [[ "$search_input" =~ ^[0-9]+$ ]]; then
    search_by_id "$search_input"
else
    search_results=$(search_by_name "$search_input")
    # If multiple animals have the same name, prompt the user to select one by ID
    if [[ $(echo "$search_results" | wc -l) -gt 1 ]]; then
        select_animal_id "$search_results" "$search_input"
    else
        echo "$search_results"
    fi
fi
