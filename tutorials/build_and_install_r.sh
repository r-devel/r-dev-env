#!/bin/bash
R_VERSION="R-4-2-3"
SOURCE_DIR="/workspace/r-dev/r_source_code"
BUILD_DIR="/workspace/r-dev/r_build"

# put svn repo and build directory where we can see them in the workspace
TOP_SRCDIR="/workspaces/r-dev-env/svn/R-devel"
BUILDDIR="/workspaces/r-dev-env/bin/R"

# svn checkout will create TOP_SRCDIR if necessary,
svn checkout https://svn.r-project.org/R/trunk/ "$TOP_SRCDIR"

# go to build dir
cd "$BUILDDIR"

# run the configure script from the R sources to create the makefile in the build directory
"$TOP_SRCDIR/configure" --enable-R-shlib --without-recommended-packages

# make R binary
make

# install, overriding the system version of R
sudo make install

# run the R check before doing any development/testing
make check

