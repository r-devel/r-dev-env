#!/bin/bash

# Specify the parent directory
parent_dir="/workspaces/r-dev-env/build"  # Assuming this is the correct path

# Path to the settings.json file
settings_file_path="/home/vscode/.vscode-remote/data/Machine/settings.json"

# Ask user which R version to use
echo "Which version of R should be used in new R terminals?"
echo "  1. R 4.4.0 (release version built into this container)"

# Check for additional R versions in subdirectories
if [ -d "$parent_dir" ]; then
  echo "  Additional R builds available:"
  
  # Create an array to store subdirectory names
  subdirs=()
  
  # Loop through subdirectories and print numbered list
  counter=2  # Start counter at 2 to avoid conflict with built-in R
  for dir in "$parent_dir"/*; do
    if [ -d "$dir" ]; then
      subdir=$(basename "$dir")
      subdirs+=("$subdir")  # Populate subdirs array
      echo "    $counter. $subdir"
      ((counter++))
    fi
  done
fi

# Get user choice
read -p "Enter the number corresponding to the selected version: " choice

# Validate user choice
if [[ ! "$choice" =~ ^[1-9]$ ]]; then
  echo "Invalid choice. Please enter a number between 1 and $(($counter - 1))"
  exit 1
fi

# Define selected version based on choice
if [[ $choice -eq 1 ]]; then
  # Use built-in R
  selected_version="/usr/bin/R"
else
  # Use R from chosen subdirectory
  chosen_subdir="${subdirs[((choice - 2))]}"  
  selected_version="$parent_dir/$chosen_subdir/bin/R"  
fi

# Update settings.json with the chosen R path
updated_settings_data=$(cat "$settings_file_path" | jq --arg subdir "$selected_version" '."r.rterm.linux"=$subdir')
echo "$updated_settings_data" > "$settings_file_path"

echo "R terminal will now use version: $selected_version"

