#!/bin/bash

# Set some variables for the menu
options=("Option 1" "Option 2" "Option 3" "Quit")

# Define a function to display the menu and get the user's choice
function show_menu {
  echo "Select an option:"
  for i in "${!options[@]}"; do
    echo "$((i+1)). ${options[$i]}"
  done
  read -p "Enter choice: " choice
  case $choice in
    [1-3]) echo "You chose ${options[$((choice-1))]}";;
    4) echo "Exiting..."; exit 0;;
    *) echo "Invalid choice.";;
  esac
}

# Call the show_menu function in a loop until the user chooses to quit
while true; do
  show_menu
done

