#!/bin/bash

export WORK_DIR=$PWD
export BUILDDIR="$WORK_DIR/build/r-devel"
export TOP_SRCDIR="$WORK_DIR/svn/r-devel"
export PATCHDIR="$WORK_DIR/patches"

SCRIPT_DIR="$HOME/.local/bin"

local_script() {

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

local_script