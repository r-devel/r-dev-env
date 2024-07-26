# This script is run after the workspace is created
#!/bin/bash

# Workspace root is $PWD at the start
WORK_DIR=$PWD

# Create patch directory in workspace root ($PWD at start)
PATCHDIR="$WORK_DIR/patches"
mkdir -p $PATCHDIR

# Copy the which_r and set_build_r function definitions to .bashrc
cat $WORK_DIR/scripts/which_r.sh >> ~/.bashrc
cat $WORK_DIR/scripts/set_build_r.sh >> ~/.bashrc

# Copy over the welcome message script to be run when bash terminal starts
cat $WORK_DIR/scripts/welcome_msg.sh >> ~/.bashrc

#bash ~/.bashrc

# Remove git directory if it exists
rm -rf .git
