# This script is run everytime workspace is started (when bash terminal started)
#!/bin/bash

# define helper environment variables based on workspace root ($PWD at start)
export WORK_DIR=$PWD
export BUILDDIR="$WORK_DIR/build/r-devel"
export TOP_SRCDIR="$WORK_DIR/svn/r-devel"
export PATCHDIR="$WORK_DIR/patches"

# clear the screen before displaying welcome message
clear

# welcome message to add to bashrc
echo -e "
Welcome to the R Dev Container v$CONTAINER_VERSION

Here you can modify, compile and use R as described in
the r development guide:
    https://contributor.r-project.org/rdevguide/GetStart.html#building-r


To help you, we have already set the following environment variables:

BUILDDIR = \"$BUILDDIR\"
TOP_SRCDIR = \"$TOP_SRCDIR\"
PATCHDIR = \"$PATCHDIR\"

Have fun \U0001F601
"

# open INDEX.md if INIT file exists
if [ -f "INIT" ]; then
    sleep 2
    code INDEX.md
    rm INIT
fi
