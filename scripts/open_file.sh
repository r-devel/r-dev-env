#!/bin/bash

# Wait for VS Code server to be fully up
while ! pgrep -f "node.*vscode-server" > /dev/null; do
    echo "Waiting for VS Code server to start..."
    sleep 15
done

# Open the file in VS Code
code /workspaces/r-dev-env/WELCOME.md