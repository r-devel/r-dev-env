#!/bin/bash

# This script is run after the workspace is created


local_script(){

# Workspace root is $PWD at the start
WORK_DIR=$PWD
VSCODE_DIR="$WORK_DIR/.vscode"
DEVCONTAINER_JSON="$WORK_DIR/.devcontainer/devcontainer.json"
SCRIPTS_DIR="$WORK_DIR/scripts"

# Create patch directory in workspace root ($PWD at start)
PATCHDIR="$WORK_DIR/patches"
mkdir -p $PATCHDIR
mkdir -p $VSCODE_DIR

# Copy the which_r and set_build_r function definitions to .bashrc
cat $SCRIPTS_DIR/which_r.sh >> ~/.bashrc
cat $SCRIPTS_DIR/set_build_r.sh >> ~/.bashrc

# Copy over the welcome message script to be run when bash terminal starts
cat $SCRIPTS_DIR/welcome_msg.sh >> ~/.bashrc

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

# Remove the .vscode/settings.json file if it exists so that
# it does not interfere with the devcontainer.json
rm -f "$WORK_DIR/.vscode/settings.json"

# 1. Build the ptrace helper library
gcc -shared -fPIC -o "$SCRIPTS_DIR/allow_ptrace.so" "$SCRIPTS_DIR/allow_ptrace.c"

# 2. Mark the wrapper executable
chmod +x "$SCRIPTS_DIR/launch_r.sh"