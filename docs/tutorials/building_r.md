# Building R from Source

## 1. Environment Variables

The following environment variables define important paths for building R:

- `BUILDDIR`: Build directory location at `/workspaces/r-dev-env/build/r-devel`
- `TOP_SRCDIR`: Source directory location at `/workspaces/r-dev-env/svn/r-devel`

These environment variables are set in the codespace image and are available
when the codespace starts.

![alt text](../assets/rdev6.png)

## 2. SVN Checkout

The SVN checkout command creates a local copy of a specific tag/branch from the R repository.
To check out the latest version of the trunk (main branch) of the R sources to `$TOP_SRCDIR`:

```bash
svn checkout https://svn.r-project.org/R/trunk/ $TOP_SRCDIR
```

After checking out, you'll see a file structure like this:

![alt text](../assets/rdev8.png)

## 3. Download Recommended Packages

To build R with the recommended packages, run the `tools/rsync-recommended` script from the source directory:

```bash
$TOP_SRCDIR/tools/rsync-recommended
```

![alt text](../assets/rdev9.png)

## 4. Set Up Build Directory

To keep the source directory clean, we'll use a separate build directory:

1. Create the build directory:
   ```bash
   mkdir -p $BUILDDIR
   ```

2. Change to the build directory:
   ```bash
   cd $BUILDDIR
   ```

## 5. Configure the Build

Run the configure script from the source directory (~1 minute on codespace):

```bash
$TOP_SRCDIR/configure --with-valgrind-instrumentation=1
```

!!! Note
    The `--with-valgrind-instrumentation` option is set to 1 for effective use
    of valgrind. See the [Using valgrind](https://cran.r-project.org/doc/manuals/R-exts.html#Using-valgrind)
    section of the R-admin manual for more information.

After configuration, you'll see a file structure like this:

![alt text](../assets/rdev7.png)

## 6. Build R

Run `make` to build R (5-10 minutes on codespace):

```bash
make
```

## 7. Run Tests

Check that the build passes R's standard tests:

```bash
make check
```

This takes a couple of minutes. If any tests fail, see [SVN Help](./svn_help.md) for how to revert to a working version.

## 8. Configure R Terminal

Run `which_r` to set which R version to use in VSCode's R terminals:

```bash
which_r
```

You'll see this prompt:
```
Which version of R should be used in new R terminals?
  1. R 4.4.0 (release version built into this container)
  Additional R builds available:
    2. r-devel
Enter the number corresponding to the selected version:
```

Select the number for `r-devel`. New R terminals will now use your newly built version.[^1]

[^1]: To switch back to the release version, run `which_r` and select `1`. Your selection is saved in VSCode settings and persists across codespace restarts.

## 9. Next Steps

Now that you've built the development version of R, you can start contributing to the project.
Follow the [R Contribution Workflow](./contribution_workflow.md) tutorial to learn how.
