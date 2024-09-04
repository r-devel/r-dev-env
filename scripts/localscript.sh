# This script is run after the workspace is created
#!/bin/bash

local_script(){

# Workspace root is $PWD at the start
WORK_DIR=$PWD
VSCODE_DIR="$WORK_DIR/.vscode"
DEVCONTAINER_JSON="$WORK_DIR/.devcontainer/devcontainer.json"

# Create patch directory in workspace root ($PWD at start)
PATCHDIR="$WORK_DIR/patches"
mkdir -p $PATCHDIR
mkdir -p $VSCODE_DIR

# Copy the which_r and set_build_r function definitions to .bashrc
cat $WORK_DIR/scripts/which_r.sh >> ~/.bashrc
cat $WORK_DIR/scripts/set_build_r.sh >> ~/.bashrc

# Copy over the welcome message script to be run when bash terminal starts
cat $WORK_DIR/scripts/welcome_msg.sh >> ~/.bashrc

#bash ~/.bashrc

# Remove git directory if it exists
rm -rf .git

# copying vscode extension settings from devcontainer json to vscode settings json using jq
if [ -f "$DEVCONTAINER_JSON" ]; then
        jq '.customizations.vscode.settings' "$DEVCONTAINER_JSON" > "$VSCODE_DIR/settings.json"
fi


}


# Run the main function
local_script
