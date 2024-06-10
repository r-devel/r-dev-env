#!/bin/bash

# File to store the paths
STORAGE_FILE="/workspaces/r-dev-env/paths.txt"
DEFAULT_LABEL="r-devel"
DEFAULT_BUILDDIR="/workspaces/r-dev-env/build/$DEFAULT_LABEL"
DEFAULT_TOP_SRCDIR="/workspaces/r-dev-env/svn/$DEFAULT_LABEL"

# Ensure the storage file exists
touch $STORAGE_FILE

# Function to save the new directories to the storage file
save_path() {
    if ! grep -q "^$1:" "$STORAGE_FILE"; then
        BUILDDIR="/workspaces/r-dev-env/build/$1"
        TOP_SRCDIR="/workspaces/r-dev-env/svn/$1"
        echo "$1:$BUILDDIR:$TOP_SRCDIR" >> $STORAGE_FILE
        echo "New environment $1 saved."
    else
        echo "Environment label $1 already exists."
    fi
}

# Function to switch to a saved directory
switch_path() {
    if [[ $1 == $DEFAULT_LABEL ]]; then
        export BUILDDIR="$DEFAULT_BUILDDIR"
        export TOP_SRCDIR="$DEFAULT_TOP_SRCDIR"
        echo "Switched to $DEFAULT_LABEL environment."
        echo "The build directory is set to: $BUILDDIR"
        echo "The source directory is set to: $TOP_SRCDIR"
    elif grep -q "^$1:" "$STORAGE_FILE"; then
        SAVED_PATH=$(grep "^$1:" "$STORAGE_FILE")
        IFS=':' read -r -a PATH_ARRAY <<< "$SAVED_PATH"
        export BUILDDIR="${PATH_ARRAY[1]}"
        export TOP_SRCDIR="${PATH_ARRAY[2]}"
        echo "Switched to $1 environment."
        echo "The build directory is set to: $BUILDDIR"
        echo "The source directory is set to: $TOP_SRCDIR"
    else
        echo "Environment label $1 not found."
    fi
}

# Function to list all saved directories
list_paths() {
    echo "Saved environments:"
    echo "$DEFAULT_LABEL: $DEFAULT_BUILDDIR $DEFAULT_TOP_SRCDIR (default)"
    cat $STORAGE_FILE | while IFS=: read -r label builddir srcdir; do
        echo "$label: $builddir $srcdir"
    done
}

# Check if the label is for switching
if [[ $1 == "switch" && -n $2 ]]; then
    switch_path $2
elif [[ -n $1 ]]; then
    # Save the new directories
    save_path $1
else
    list_paths
fi
