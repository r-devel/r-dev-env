#!/bin/bash

setup_environment() {

      # Create necessary directories
      mkdir -p $SCRIPT_DIR
      mkdir -p $PATCHDIR

      # Set executable permissions for the scripts
      chmod +x $WORK_DIR/scripts/which_r.sh
      chmod +x $WORK_DIR/scripts/set_build_r.sh

      # Copy the scripts to the script directory
      cp $WORK_DIR/scripts/which_r.sh $SCRIPT_DIR/which_r
      cp $WORK_DIR/scripts/set_build_r.sh $SCRIPT_DIR/set_build_r

      # Remove git directory if it exists
      rm -rf .git
}


local_script() {
  if [ "$WORK_DIR" = '/workspace/r-dev-env' ]; then
      SCRIPT_DIR="/home/gitpod/.local/bin"
      # Ensure PATCHDIR is set; if not, set a default value
      PATCHDIR=${PATCHDIR:-/workspace/patchdir}
      setup_environment


  elif [ "$WORK_DIR" = '/workspaces/r-dev-env' ]; then
      SCRIPT_DIR="/home/vscode/.local/bin"
      setup_environment

    
  else
    echo "Unknown WORK_DIR: $WORK_DIR"
    exit 1
  fi
}


local_script