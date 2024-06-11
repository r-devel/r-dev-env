#!/bin/bash

# Check if the label argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <label>"
  echo "BUILDDIR is currently set to $BUILDDIR"
  echo "TOP_SRCDIR is currently set to $TOP_SRCDIR"
else
  # Assign the argument to a variable
  LABEL=$1

  # Update the environment variables
  export BUILDDIR="/workspaces/r-dev-env/build/$LABEL"
  export TOP_SRCDIR="/workspaces/r-dev-env/svn/$LABEL"

  # Print the new values
  echo "BUILDDIR is now set to $BUILDDIR"
  echo "TOP_SRCDIR is now set to $TOP_SRCDIR"
fi
