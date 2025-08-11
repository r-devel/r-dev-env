#!/bin/bash
export LD_PRELOAD=/workspaces/r-dev-env/scripts/allow_ptrace.so
# exec /workspaces/r-dev-env/build/r-devel/bin/R "$@"
exec /usr/bin/R "$@"
