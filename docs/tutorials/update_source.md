## Updating Source Code

After following through the Contribution workflow and making the following changes, we need to update it inside the source code directory. To do so, first we need to follow this steps:

#### 1) Change Directory to TOP_SRCDIR

If you are currently inside the BUILDDIR directory or root directory(/workspaces/r-dev-env) make sure to change it to TOP_SRCDIR so that we can update the changes made inside our source code.

```bash
cd $TOP_SRCDIR
```

#### 2) Update using svn

Now we want to update the source code for that we will use svn command update

```bash
svn update
```

#### 3) Check changes made using diff

To cross check the changes we made in source code. We will use this command

```bash
svn diff
```

#### 4) Revert Changes(Optional step)

In some cases, we might want to revert the changes we made. We can use the revert command

To revert the changes made in specific file, we can use

```bash
svn revert src/library/utils/R/askYesNo.R
```

To revert changes in a directory

```bash
svn revert src/lib/utils
```

To revert all local changes

```bash
svn revert -R .
```

#### 5) Change Directory and Rebuild

To rebuild the R version and reflect on the changes made, we want to change directory to BUILDDIR from TOP_SRCDIR

```bash
cd $BUILDDIR
```

#### 6) Rebuild the Source Code

Now rebuild using make command

```bash
make check
make
```