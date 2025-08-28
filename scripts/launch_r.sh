#!/bin/bash

WORK_DIR=$PWD
export LD_PRELOAD="$WORK_DIR/scripts/allow_ptrace.so"
# exec "$WORK_DIR/build/r-devel/bin/R" "$@"
exec /usr/bin/R "$@"
