#!/bin/bash
R_VERSION="R-4-2-3"
SOURCE_DIR="/workspace/r-dev/r_source_code"
BUILD_DIR="/workspace/r-dev/r_build"

# put svn repo and build directory where we can see them in the workspace
TOP_SRCDIR="/workspaces/r-dev-env/svn/R-devel"
BUILDDIR="/workspaces/r-dev-env/bin/R"

# svn checkout will create TOP_SRCDIR if necessary,
svn checkout https://svn.r-project.org/R/trunk/ "$TOP_SRCDIR"

./configure --prefix=$R_VERSION_BUILD_DIR --enable-R-shlib- -without-recommended-packages

make check
make
make install

# create sys links for new binaries
BINARIES=$R_VERSION_BUILD_DIR/bin/*

for f in $BINARIES
do
if [[ "$f" != *\.* ]]
then
binary_name="$(basename -- $f)"
source=$R_VERSION_BUILD_DIR/bin/$binary_name 
target=/usr/local/bin/$binary_name
sudo rm -f $target
sudo ln -s $source $target
fi
done

# install language server in new R version
Rscript -e "install.packages('languageserver', repos='https://cran.rstudio.com')"