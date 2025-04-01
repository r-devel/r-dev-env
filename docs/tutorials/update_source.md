# Updating R Source Code

The R Core Team commit changes to the development version of R sometimes
multiple times a day. It's a good idea to update your local copy of the source
code from time to time, especially before creating a patch. To do so, follow
these steps:

## 1. Close R Terminal

If you have an R terminal open, quit R or close the terminal.

## 2. Go to the Source Directory

In a bash terminal, change to the source directory:

```bash
cd $TOP_SRCDIR
```

## 3. Review Local Changes

Use the Subversion diff command to review changes you have made to source code:

```bash
svn diff
```

## 4. Revert Changes (Optional)

If you no longer want to keep your local changes, you can revert them.

### Revert Specific Files

To revert changes made in a specific file:

```bash
svn revert src/library/utils/R/askYesNo.R
```

### Revert Directories

To revert changes in a directory:

```bash
svn revert src/lib/utils
```

### Revert All Changes

To revert all local changes:

```bash
svn revert -R .
```

## 5. Rebuild and Check Local Changes

If you have no local changes remaining, skip to the next step.

Otherwise, go to the build directory to build and check R with your local
changes:

```bash
cd $BUILDDIR
make
make check
```

If the check fails with an error, you have broken something with your local
changes. Fix this before proceeding. Otherwise go back to the source directory
to continue:

```bash
cd $TOP_SRCDIR
```

## 6. Update Using SVN

Use the Subversion command `update` to update your local copy with the latest
changes by the R Core Team:

```bash
svn update
```

## 7. Rebuild and Check Updates

To rebuild R with the latest changes from the R Core Team and any local changes
you have kept:

```bash
cd $BUILDDIR
make
make check
```

If the check fails, this will be due to recent changes made by the R Core
Team. See [SVN Help](./svn_help.md) for how to revert to a version that passes
check.
