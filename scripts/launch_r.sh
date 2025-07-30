#!/bin/bash
export LD_PRELOAD=/workspaces/r-dev-env/scripts/allow_ptrace.so
# which_r.sh needs updating to switch R version here vs in vscode settings
# exec /workspaces/r-dev-env/build/r-devel/bin/R "$@"
exec /usr/bin/R "$@"