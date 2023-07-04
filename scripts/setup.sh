#!/bin/bash
R_VERSION="R-4-2-3"
#SOURCE_DIR="/home/vscode/r_source_code"
#BUILD_DIR="/home/vscode/r_build"

R_VERSION_SOURCE_DIR=$TOP_SRCDIR/$R_VERSION
R_VERSION_BUILD_DIR=$BUILDDIR/$R_VERSION

mkdir -p $R_VERSION_SOURCE_DIR
mkdir -p $R_VERSION_BUILD_DIR

svn checkout https://svn.r-project.org/R/tags/$R_VERSION/ "$R_VERSION_SOURCE_DIR"


cd $R_VERSION_BUILD_DIR

#./configure" --prefix=$R_VERSION_BUILD_DIR --enable-R-shlib --without-recommended-packages
"$R_VERSION_SOURCE_DIR/configure" --enable-R-shlib --without-recommended-packages

make check
make
sudo make install


#After setup process(be in the build_dir for this process)
#Run R to test whats the bug and what output we are getting
#make required changes in source code for an issue/bug
# run "make check" then run "make" then "sudo make install"
# Run R again to test whether our changes are reflected or not and see whether we are getting expected outcome.

#Committing changes to SVN
#cd topdir
#run "svn status" to check which files we have made changes too
#run "svn update" to add those changes.
#run svn diff > path.diff
#cd $BUILDDIR
#make check

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