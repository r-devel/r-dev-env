#!/bin/bash
R_VERSION="R-4-2-3"
SOURCE_DIR="/workspace/r-dev/r_source_code"
BUILD_DIR="/workspace/r-dev/r_build"

R_VERSION_SOURCE_DIR=$SOURCE_DIR/$R_VERSION
R_VERSION_BUILD_DIR=$BUILD_DIR/$R_VERSION

mkdir -p $R_VERSION_SOURCE_DIR
mkdir -p $R_VERSION_BUILD_DIR

cd $R_VERSION_SOURCE_DIR

svn checkout https://svn.r-project.org/R/tags/$R_VERSION .

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