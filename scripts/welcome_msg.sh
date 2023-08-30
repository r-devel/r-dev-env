#!/bin/bash

# clear the screen before displaying welcome message
clear

# welcome message to add to bashrc
echo -e "
Welcome to the Containerised R Development Environment v$CONTAINER_VERSION

Here you can modify, compile and use R as described in
the r development guide:
    https://contributor.r-project.org/rdevguide/GetStart.html#building-r


To help you, we have already set the following environment variables:

BUILDDIR = \"$BUILDDIR\"
TOP_SRCDIR = \"$TOP_SRCDIR\"
PATCHDIR = \"$PATCHDIR\"

Have fun \U0001F601
"
