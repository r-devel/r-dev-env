#!/bin/bash

mkdir -p /home/vscode/.local/bin
mkdir -p $PATCHDIR

chmod +x /workspaces/r-dev-env/scripts/which_r.sh
chmod +x /workspaces/r-dev-env/scripts/set_build_r.sh

cp /workspaces/r-dev-env/scripts/which_r.sh /home/vscode/.local/bin/which_r
cp /workspaces/r-dev-env/scripts/set_build_r.sh /home/vscode/.local/bin/set_build_r

#remove git directory
cd /workspaces/r-dev-env
rm -rf .git
