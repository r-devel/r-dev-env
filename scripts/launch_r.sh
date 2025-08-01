#!/bin/bash
export LD_PRELOAD=/workspaces/r-dev-env/scripts/allow_ptrace.so
exec /usr/bin/R "$@"