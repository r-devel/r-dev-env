#!/bin/bash
export LD_PRELOAD=/workspaces/r-dev-env/scripts/allow_ptrace.so
if [ -z "$R_BINARY" ]; then
  R_BINARY="/usr/bin/R"
fi
exec $R_BINARY "$@"