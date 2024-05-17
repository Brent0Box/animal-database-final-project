#!/bin/bash

# Define the path to your scripts
script_path="../scripts"

# Function to display the main menu
show_menu() {
    echo "Welcome to C.E.O. Rescue Pet Inventory - Please make a selection:"
    echo "1) Initialize Database"
    echo "2) Enter a new animal"
    echo "3) Update an animal"
    echo "4) Remove an animal"
    echo "5) Display Database"
    echo "6) Display Species"
    echo "7) Generate Summary Report"
    echo "8) Generate HTML file"
    echo "9) Delete Database"
    echo "10) Exit"
}

# Function to handle post-operation choices
post_operation() {
    while true; do
	    echo "Do you want to repeat this operation or go back to the main menu?"
	    echo "1) Repeat"
	    echo "2) Main Menu"
	    read -p "Enter your choice [1-2]: " post_choice
	    case $post_choice in
	        1) return 1;;
	        2) return 0;;
	        *) echo "Invalid choice, returning to main menu";;
	    esac
    done
}

# Function to execute an operation and handle post-operation actions
execute_and_post_operation() {
    local operation_script="$1"
    while true; do
        bash "$operation_script"
        if post_operation; then
            break  # Go back to the main menu
        fi
    done
}

# Main loop
while true; do
    show_menu
    read -p "Enter your choice [1-10]: " choice

    case $choice in
        1)
            bash "$script_path/initialize_database.sh"
            ;;
        2)
            execute_and_post_operation "$script_path/add_animal.sh"
            ;;
        3)
            bash  "$script_path/update_animal.sh"
            ;;
        4)
            execute_and_post_operation "$script_path/delete_animal.sh"
            ;;

        5)
            bash "$script_path/display_database.sh"
            ;;
	6)
	    perl "$script_path/get_species.pl"
	    ;;
	7)
	    python3 "$script_path/summary_report.py"
	    ;;
	8)
	    perl "$script_path/generate_html.pl"
	    ;;
        9)
            bash "$script_path/delete_database.sh"
            ;;
        10)
            echo "Exiting program."
            exit 0
            ;;
        *)
            echo "Invalid option selected. Please try again."
            ;;
    esac
done
