## Creating a Patch File

We can also create a patch file for the update and changes that we made to the source code.

1. Assuming we have made a change and we want to submit a patch.

If necessary, update R-devel

```bash
cd $TOP_SRCDIR
svn update
cd $BUILDDIR
make # this will run the configure as before
```

2. Now run R's test suite to make sure that your change has not broken anything:

```bash
make check

```

3. Then create a patch

```bash
cd "$TOP_SRCDIR"
svn update
svn diff > patch.diff
```

This is not ideal though as the patch file will be in $TOP_SRCDIR and we want to keep that clean. Also we want our patches easy to find. Perhaps we can also define a PATCHDIR?

PATCHDIR=/workspaces/r-dev-env/patches
mkdir $PATCHDIR
svn diff > $PATCHDIR/patch.diff