#!/bin/bash

# This script is run after the workspace is created


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
#rm -rf .git

# copy launch.json for debugging config if present
if [ -f "$WORK_DIR/.devcontainer/launch.json" ]; then
    cp "$WORK_DIR/.devcontainer/launch.json" "$VSCODE_DIR/launch.json"
fi

# copying vscode extension settings from devcontainer json to vscode settings json using jq
if [ -f "$DEVCONTAINER_JSON" ]; then
        jq '.customizations.vscode.settings' "$DEVCONTAINER_JSON" > "$VSCODE_DIR/settings.json"
fi

# Update r.rterm.linux setting to use the launch_r.sh script with full dynamic path
if [ -f "$VSCODE_DIR/settings.json" ]; then
    tmpfile="${VSCODE_DIR/settings.json}.tmp.$$"
    jq --arg rterm "$WORK_DIR/scripts/launch_r.sh" '."r.rterm.linux"=$rterm' "$VSCODE_DIR/settings.json" > "$tmpfile" && mv "$tmpfile" "$VSCODE_DIR/settings.json"
fi

# Compile the ptrace helper executable
gcc -O2 -o "$WORK_DIR/scripts/allow_ptrace" "$WORK_DIR/scripts/allow_ptrace.c"
chmod +x "$WORK_DIR/scripts/allow_ptrace"

# Mark the wrapper executable
chmod +x "$WORK_DIR/scripts/launch_r.sh"

}


# Run the main function
local_script
