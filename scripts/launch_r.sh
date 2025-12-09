#!/bin/bash

# `which_r.sh` sets the R binary used in the command below
exec ./scripts/allow_ptrace /usr/bin/R "$@"
