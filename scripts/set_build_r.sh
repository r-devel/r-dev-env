
set_build_r() {
  if [ -z "$1" ]; then
     echo "Usage: set_build_r <label>. Label example - rdev, r-dev-raw"
    echo "BUILDDIR is currently set to $BUILDDIR"
    echo "TOP_SRCDIR is currently set to $TOP_SRCDIR"
  else
    NAME=$1
    export BUILDDIR="/workspaces/r-dev-env/build/$NAME"
    export TOP_SRCDIR="/workspaces/r-dev-env/svn/$NAME"
    echo "BUILDDIR is now set to $BUILDDIR"
    echo "TOP_SRCDIR is now set to $TOP_SRCDIR"
  fi
}
