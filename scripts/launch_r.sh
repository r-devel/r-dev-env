#!/usr/bin/env bash
# Preload helper for ptrace
export LD_PRELOAD="$(dirname "$0")/allow_ptrace.so"

# VS Code sets the env var R_RPATH_LINUX to the path from r.rpath.linux
if [ -n "${R_RPATH_LINUX:-}" ] && [ -x "$R_RPATH_LINUX" ]; then
  R_BINARY="$R_RPATH_LINUX"
else
  R_BINARY="/usr/bin/R"
fi

exec "$R_BINARY" "$@"
