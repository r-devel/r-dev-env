A patch file captures the local changes (additions and deletions) to the source code. It can be shared on [R's Bugzilla](https://bugs.r-project.org/) to propose a change to R, e.g. a fix for a bug.

To make a patch

1) Update your local copy of the source

If you have not recently updated your local copy of the R Subversion repository, follow the instructions in [Updating the Source Code](./update_source.md) to do this first.

2) Create a patch file

Go to the source directory and use `svn diff` to create a patch. 

```bash
cd $TOP_SRCDIR
svn diff > $PATCHDIR/patch.diff
```

The patch file will be saved in the directory specified by the PATCHDIR environment variable that is defined when the codespace starts

```bash
echo $PATCHDIR/patch.diff
```