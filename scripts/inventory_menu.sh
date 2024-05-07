#!/bin/bash

# Define the path to your scripts
script_path="/c/Users/kodonoughue/csci50final/animal-database-final-project/scripts"

# Function to display the main menu
show_menu() {
    echo "Welcome to C.E.O. Rescue Pet Inventory - Please make a selection:"
    echo "1) Initialize Database"
    echo "2) Enter a new animal"
    echo "3) Update an animal"
    echo "4) Remove an animal"
    echo "5) Search by ID"
    echo "6) Display Database"
    echo "7) Delete Database"
    echo "8) Exit"
}

# Function to handle post-operation choices
post_operation() {
    echo "Do you want to repeat this operation or go back to the main menu?"
    echo "1) Repeat"
    echo "2) Main Menu"
    read -p "Enter your choice [1-2]: " post_choice
    case $post_choice in
        1) "$1";;
        2) return;;
        *) echo "Invalid choice, returning to main menu";;
    esac
}

# Main loop
while true; do
    show_menu
    read -p "Enter your choice [1-8]: " choice

    case $choice in
        1)
            bash "$script_path/initialize_database.sh"
            ;;
        2)
            bash "$script_path/add_animal.sh"
            post_operation bash "$script_path/add_animal.sh"
            ;;
        3)
            bash "$script_path/update_animal.sh"
            post_operation bash "$script_path/update_animal.sh"
            ;;
        4)
            bash "$script_path/delete_animal.sh"
            post_operation bash "$script_path/delete_animal.sh"
            ;;
        5)
            bash "$script_path/animal_id_search.sh"
            ;;
        6)
            bash "$script_path/display_database.sh"
            ;;
        7)
            bash "$script_path/delete_database.sh"
            ;;
        8)
            echo "Exiting program."
            exit 0
            ;;
        *)
            echo "Invalid option selected. Please try again."
            ;;
    esac
done

