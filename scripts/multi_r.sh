#!/bin/bash

# Specify the parent directory
parent_dir="$BUILDDIR"

# Path to the settings.json file
settings_file_path="/home/vscode/.vscode-remote/data/Machine/settings.json"

echo "Do you want to switch rterm path to custom R build / default R build? (type C or D)"
read option

if [ "$option" = "C" ]; then
    # Check if the parent directory exists
    if [ -d "$parent_dir" ]; then
        echo "Subdirectories in $parent_dir:"
        
        # Create an array to store subdirectory names
        subdirs=()
        
        # Loop through subdirectories and populate the array
        for dir in "$parent_dir"/*; do
            if [ -d "$dir" ]; then
                subdir=$(basename "$dir")
                subdirs+=("$subdir")
                echo "${#subdirs[@]}. $subdir"
            fi
        done
        
        if [ "${#subdirs[@]}" -gt 0 ]; then
            read -p "Enter the number of the subdirectory to switch to: " choice
            
            # Check if the choice is valid
            if [ "$choice" -gt 0 ] && [ "$choice" -le "${#subdirs[@]}" ]; then
                chosen_subdir="${subdirs[$((choice - 1))]}"
                cd "$parent_dir/$chosen_subdir" || exit
                echo "Switched to subdirectory: $chosen_subdir"
                
                # Update the settings.json with the chosen subdirectory path
                updated_settings_data=$(cat "$settings_file_path" | jq --arg subdir "$parent_dir/$chosen_subdir/bin/R" '."r.rterm.linux"=$subdir')
                echo "$updated_settings_data" > "$settings_file_path"
                
                # Start an interactive shell in the chosen subdirectory
                bash
            else
                echo "Invalid choice."
            fi
        else
            echo "No subdirectories found."
        fi
    else
        echo "Parent directory does not exist."
    fi
elif [ "$option" = "D" ]; then
    updated_settings_data=$(cat "$settings_file_path" | jq '."r.rterm.linux"="/usr/bin/R"')
    echo "$updated_settings_data" > "$settings_file_path"
else
    echo "Invalid option selected."
    exit 1
fi
