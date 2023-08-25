## Installing Multiple R versions
To install multiple R versions inside a single codespace.


1) We have 2 env var path $BUILLDIR and $TOP_SRCDIR, we will leverage this var paths and build differeent R version inside it.

2) In basic contribution workflow we have seen for checking out R source code from svn we use command `svn checkout https://svn.r-project.org/R/trunk/ "$TOP_SRCDIR"`.
But to able to install multiple R versions we need create sub-directory for different R versions. Let's say we are installing R-2.5.1 or R-devel version. We can create a sub directory for a specific version by using command.

```cmd
svn checkout https://svn.r-project.org/R/trunk/ "$TOP_SRCDIR/r-devel"
```
The following command will checkout source code from svn into directory $TOP_SRCDIR/r-devel(TOP_SRCDIR = /workspaces/r-dev-env/svn/).

3) Now we need to build the R version using source code we just checkout. To do so we can use the $BUILDDIR env var. We have seen earlier that to create directory using the following env var we use command `mkdir -p "$BUILDDIR"`. To create a sub directory for our version we have svn checkout that is r-devel, we can use command

```cmd
mkdir -p "$BUILDDIR/r-devel"
```

This will creates as a directory named as $BUILDDIR/r-devel(BUILDDOR = /workspaces/r-dev-env/build).

4) After creating the build directory for our r-devel branch. We can just change directory using cd command.

```cmd
cd "$BUILDDIR/r-devel"
```

5) Now we need to configure R build and we can configure using the command

```cmd
"$TOP_SRCDIR/r-devel/configure" --enable-R-shlib --without-recommended-packages
```

6) Finally, we can run make check and make command to build our R version.

```cmd
make check
make
```

> **Note** : We can install different R versions using the following steps but whenever we checkout or build the R source code. Please be caution and use the proper directory naming. For example we have 3 versions "4.2.4", "4.3" and "r-devel" directories. To build r-devel we can only use "$TOP_SRCDIR/r-devel" and "$BUILDDIR/r-devel" directory path.