

which_r() {
  # Specify the parent directory
  parent_dir="$WORK_DIR/build"
  
  if [ "$HOME" = '/home/gitpod' ]; then
    JSON_FILE_PATH="$WORK_DIR/.vscode/settings.json"
    
  elif [ "$HOME" = '/home/vscode' ]; then
    JSON_FILE_PATH="/home/vscode/.vscode-remote/data/Machine/settings.json"

  else
    echo "Unknown WORK_DIR: $WORK_DIR"
    exit 1
  fi
  # Path to the settings.json file
  settings_file_path=$JSON_FILE_PATH

  built_in_r_version=$(R --version | grep "^R version" | awk '{print $3}')

  # Ask user which R version to use
  echo "Which version of R should be used in new R terminals?"
  echo "  1. R $built_in_r_version (release version built into this container)"

  # Check for additional R versions in subdirectories
  if [ -d "$parent_dir" ]; then
    # Create an array to store subdirectory names
    subdirs=()

    # Loop through subdirectories and print numbered list
    counter=2  # Start counter at 2 to avoid conflict with built-in R
    for dir in "$parent_dir"/*; do
      if [ -d "$dir/bin" ] && [ -x "$dir/bin/R" ]; then
        subdir=$(basename "$dir")
        subdirs+=("$subdir")  # Populate subdirs array
        echo "  $counter. $subdir"
        ((counter++))
      fi
    done
  fi

  # If no additional R builds were found
  if [ ${#subdirs[@]} -eq 0 ]; then
    range=1
    echo "No additional R builds available."
  else
    range=$((counter - 1))
  fi

  # Get user choice
  read -p "Enter the number corresponding to the selected version: " choice

  # Define selected version based on choice
  if [[ "$choice" -eq 1 ]]; then
    # Use built-in R
    selected_version="/usr/bin/R"
  elif [[ "$choice" -ge 2 ]] && [[ "$choice" -lt "$counter" ]]; then
    # Use R from chosen subdirectory
    chosen_subdir="${subdirs[((choice - 2))]}"
    selected_version="$parent_dir/$chosen_subdir/bin/R"
  else
    # Invalid choice, default to built-in R
    if [[ $range -eq 1 ]]; then
      echo "Invalid choice, please enter 1. Defaulting to built-in R version."
    else
      echo "Invalid choice, please select options between 1 to $range. Defaulting to built-in R version."
    fi
    selected_version="/usr/bin/R"
  fi

  # Update settings.json with the chosen R path
  updated_settings_data=$(cat "$settings_file_path" | jq --arg subdir "$selected_version" '."r.rterm.linux"=$subdir')
  echo "$updated_settings_data" > "$settings_file_path"

  echo "R terminal will now use version: $selected_version"
}
