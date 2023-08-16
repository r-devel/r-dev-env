#!/bin/bash

 
# Path to the settings.json file
settings_file_path="/home/vscode/.vscode-remote/data/Machine/settings.json"

 
# Read the existing JSON content
settings_data=$(cat "$settings_file_path")


# Update the desired setting using jq (a command-line JSON processor)
updated_settings_data=$(echo "$settings_data" | jq '."r.rterm.linux"="/usr/bin/R"')

 
# Write the updated JSON content back to the file
echo "$updated_settings_data" > "$settings_file_path"
