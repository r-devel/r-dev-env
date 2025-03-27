# Building R from Source

## 1. Environment Variables

The following environment variables define paths for building R:

- `BUILDDIR`: `/workspaces/r-dev-env/build/r-devel`
- `TOP_SRCDIR`: `/workspaces/r-dev-env/svn/r-devel`

These variables are set in the codespace image and available at startup.

 

![alt text](../assets/rdev6.png)

 

## 2. SVN Checkout

Get a local copy of R source code from the repository:

```bash
svn checkout https://svn.r-project.org/R/trunk/ $TOP_SRCDIR
```

 

After checkout, you'll see:

 

![alt text](../assets/rdev8.png)

 

## 3. Download Packages

Get recommended packages:

```bash
$TOP_SRCDIR/tools/rsync-recommended
```

 

![alt text](../assets/rdev9.png)

 

## 4. Set Up Build Directory

Keep source directory clean by using a separate build directory:

1. Create build directory:

   ```bash
   mkdir -p $BUILDDIR
   ```

2. Change to build directory:

   ```bash
   cd $BUILDDIR
   ```

 

## 5. Configure the Build

Run configure (~1 minute):

```bash
$TOP_SRCDIR/configure --with-valgrind-instrumentation=1
```

 

!!! Note
    The `--with-valgrind-instrumentation` option enables effective use of
    valgrind. See the [docs](https://cran.r-project.org/doc/manuals/R-exts.html#Using-valgrind)
    for details.

 

After configuration:

 

![alt text](../assets/rdev7.png)

 

## 6. Build R

Build R (5-10 minutes):

```bash
make
```

 

## 7. Run Tests

Run standard tests:

```bash
make check
```

 

If tests fail, see [SVN Help](./svn_help.md).

 

## 8. Configure R Terminal

Set R version for VSCode:

```bash
which_r
```

 

You'll see:

```text
Which version of R should be used in new R terminals?
1. R 4.4.0 (release version built into this container)
Additional R builds available:
  2. r-devel
Enter the number corresponding to the selected version:
```

 

Select `r-devel` to use your built version.[^1]

[^1]: To switch back to release version, run `which_r` and select `1`.
    Selection persists across restarts.

 

## 9. Next Steps

Start contributing! Follow the [R Contribution Workflow](./contribution_workflow.md).
