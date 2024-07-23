#!/bin/bash

WORK_DIR=$PWD
PATCHDIR="$WORK_DIR/patches"

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

      cat $WORK_DIR/scripts/welcome_msg.sh >> ~/.bashrc
      cat $WORK_DIR/scripts/which_r.sh >> ~/.bashrc
      cat $WORK_DIR/scripts/set_build_r.sh >> ~/.bashrc
      bash ~/.bashrc


      # Remove git directory if it exists
      rm -rf .git
}

local_script