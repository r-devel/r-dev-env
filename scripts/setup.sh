#!/bin/bash

#ENV VAR ($BUILDDIR & $TOP_SRCDIR) are created inside docker container itself.

svn checkout https://svn.r-project.org/R/tags/ "$TOP_SRCDIR"

cd "$BUILDDIR"

"$TOP_SRCDIR/configure" --enable-R-shlib --without-recommended-packages

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
