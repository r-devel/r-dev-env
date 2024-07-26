# This script is run after the workspace is created
#!/bin/bash

# Define helper environment variables based on workspace root ($PWD at start)
export WORK_DIR=$PWD
export BUILDDIR="$WORK_DIR/build/r-devel"
export TOP_SRCDIR="$WORK_DIR/svn/r-devel"
export PATCHDIR="$WORK_DIR/patches"

# Define directory where bash will look for scripts
SCRIPT_DIR="$HOME/.local/bin"

# Create necessary directories
mkdir -p $SCRIPT_DIR
mkdir -p $PATCHDIR

# Set executable permissions for the scripts
chmod +x $WORK_DIR/scripts/which_r.sh
chmod +x $WORK_DIR/scripts/set_build_r.sh

# Copy over the scripts from the workspace directory to the script directory
cp $WORK_DIR/scripts/which_r.sh $SCRIPT_DIR/which_r
cp $WORK_DIR/scripts/set_build_r.sh $SCRIPT_DIR/set_build_r

# Copy over the welcome message script to be run when bash terminal starts
cat $WORK_DIR/scripts/welcome_msg.sh >> ~/.bashrc

# Following not needed?
#cat $WORK_DIR/scripts/which_r.sh >> ~/.bashrc
#cat $WORK_DIR/scripts/set_build_r.sh >> ~/.bashrc
#bash ~/.bashrc

# Remove git directory if it exists
rm -rf .git
