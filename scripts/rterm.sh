#!/bin/bash

# Path to the settings.json file
settings_file_path="/home/vscode/.vscode-remote/data/Machine/settings.json"


# Read the existing JSON content
settings_data=$(cat "$settings_file_path")

echo "Do you want to switch rterm path to custom R build / default R build? (type C or D)"
read option

if [ "$option" = "C" ]; then
    updated_settings_data=$(echo "$settings_data" | jq '."r.rterm.linux"="/workspaces/r-dev-env/bin/R/bin/R"')
elif [ "$option" = "D" ]; then
    updated_settings_data=$(echo "$settings_data" | jq '."r.rterm.linux"="/usr/bin/R"')
else
    echo "Invalid option selected."
    exit 1
fi

echo "$updated_settings_data" > "$settings_file_path"

