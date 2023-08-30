#!/bin/bash

mkdir -p /home/vscode/.local/bin
mkdir -p $PATCHDIR

chmod +x /workspaces/r-dev-env/scripts/rterm.sh
chmod +x /workspaces/r-dev-env/scripts/multi_r.sh

mv /workspaces/r-dev-env/scripts/rterm.sh /home/vscode/.local/bin/rterm
cp /workspaces/r-dev-env/scripts/multi_r.sh /home/vscode/.local/bin/multi_r
