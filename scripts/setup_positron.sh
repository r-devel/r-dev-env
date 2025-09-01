#!/bin/bash

# Setup script for Positron IDE with r-dev-env
# Configures custom R binaries and root folders for both Gitpod and Codespaces

echo "Setting up Positron IDE configuration for r-dev-env..."

# Create .vscode directory if it doesn't exist
mkdir -p .vscode

# Determine the correct workspace path based on environment
if [ -d "/workspace/r-dev-env" ]; then
    WORKSPACE_PATH="/workspace/r-dev-env"
    echo "Detected Gitpod environment"
elif [ -d "/workspaces/r-dev-env" ]; then
    WORKSPACE_PATH="/workspaces/r-dev-env"
    echo "Detected Codespaces/DevContainer environment"
else
    echo "Warning: Could not detect workspace environment"
    WORKSPACE_PATH="/workspace/r-dev-env"
fi

# Create Positron settings
cat > .vscode/settings.json << EOF
{
  "positron.r.customBinaries": ["$WORKSPACE_PATH/build/r-devel/bin/R"],
  "positron.r.customRootFolders": ["$WORKSPACE_PATH"]
}
EOF

echo "Positron configuration created at .vscode/settings.json"
echo "R binary path: $WORKSPACE_PATH/build/r-devel/bin/R"
echo ""
echo "After building R with --enable-R-shlib, use 'R: Select Interpreter' in Positron"
echo "to select the custom R binary for proper console functionality."
