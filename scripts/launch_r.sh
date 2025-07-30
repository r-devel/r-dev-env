#!/usr/bin/env bash
export LD_PRELOAD=/workspaces/r-dev-env/scripts/allow_ptrace.so

# If the first argument is a file, use that as R_BINARY; otherwise default.
if [ -x "$1" ]; then
  R_BINARY="$1"
  shift
else
  R_BINARY="/usr/bin/R"
fi

# Exec R with all remaining arguments
exec "$R_BINARY" "$@"
