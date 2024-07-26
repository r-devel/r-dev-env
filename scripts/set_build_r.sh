set_build_r() {
  if [ -z "$1" ]; then
    echo "Usage: set_build_r <name>"
    echo "BUILDDIR is currently set to $BUILDDIR"
    echo "TOP_SRCDIR is currently set to $TOP_SRCDIR"
  else
    NAME=$1
    export BUILDDIR="$WORK_DIR/build/$NAME"
    export TOP_SRCDIR="$WORK_DIR/svn/$NAME"
    echo "BUILDDIR is now set to $BUILDDIR"
    echo "TOP_SRCDIR is now set to $TOP_SRCDIR"
   fi
}
