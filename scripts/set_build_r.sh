#!/bin/bash

# Default values for build and source directories
#BUILDDIR="/workspaces/r-dev-env/build/"
#TOP_SRCDIR="/workspaces/r-dev-env/svn/"
#DEFAULT_LABEL="r-devel"

# New environment variable
NEW_LABEL=${1:-$DEFAULT_LABEL}

# Replace "r-devel" with the new label in default values
NEW_BUILDDIR="${BUILDDIR}${NEW_LABEL}"
NEW_TOP_SRCDIR="${TOP_SRCDIR}${NEW_LABEL}"

# Print the set directories
echo "The build directory is set to: $NEW_BUILDDIR"
echo "The source directory is set to: $NEW_TOP_SRCDIR"

# Export the directories as environment variables
export NEW_BUILDDIR
export NEW_TOP_SRCDIR
