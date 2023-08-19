#!/bin/bash

mkdir -p /home/vscode/.local/bin

chmod +x /workspaces/r-dev-env/scripts/rterm.sh

mv /workspaces/r-dev-env/scripts/rpath.sh /home/vscode/.local/bin/rterm
