#!/bin/bash

export LD_PRELOAD="./scripts/allow_ptrace.so"
# # `which_r.sh` sets the R binary used in the command below
exec /usr/bin/R "$@"
