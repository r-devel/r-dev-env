A patch file captures the local changes (additions and deletions) to the source
code. It can be shared on [R's Bugzilla](https://bugs.r-project.org/) to propose
a change to R, e.g. a fix for a bug.

To make a patch

1) Update your local copy of the source

If you have not recently updated your local copy of the R Subversion repository,
follow the instructions in [Updating the Source Code](./update_source.md) to do
this first.

2) Create a patch file

Go to the source directory and use `svn diff` to create a patch.

**Use a descriptive patch name with the bug number and a short description,
rather than a generic name like `patch.diff`.**

```bash
cd $TOP_SRCDIR
svn diff > $PATCHDIR/16629-infinite-recursion.diff
```

The example above uses `16629-infinite-recursion.diff` - this name follows the
convention: bug number (16629), short description (infinite-recursion), and
`.diff` extension, making patches easy to identify and review.

The patch file will be saved in the directory specified by the PATCHDIR
environment variable that is defined when the codespace starts.

```bash
ls $PATCHDIR
```

lists all patch files in your patch directory, allowing you to easily
see and verify the patch files you have created.
