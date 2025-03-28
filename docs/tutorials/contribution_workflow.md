# Example Contribution Workflow using the R Dev Container

## 1. Starting R

- To start working in R, click on `R:(not attach)` in the bottom right of
  VSCode. This will open an R terminal.

![alt text](../assets/rdev11.png)

![alt text](../assets/rdev12.png)

- We can now run R commands. We will use the `utils::askYesNo()` function as
  an example:

```R
> askYesNo("Is this a good example?")
Is this a good example? (Yes/no/cancel) Yes
[1] TRUE
```

## 2. Editing Source Code

- Edit the source code of `utils::askYesNo()` to change the default options.
  The source code is in `$TOP_SRCDIR/src/library/utils/R/askYesNo.R`.
- You can redirect to that file using:

```bash
code $TOP_SRCDIR/src/library/utils/R/askYesNo.R
```

### Before and After Edit

#### Before edit

```R title="askYesNo.R" linenums="20"
prompts = getOption("askYesNo", gettext(c("Yes", "No", "Cancel"))),
```

#### After edit

```R title="askYesNo.R" linenums="20"
prompts = getOption("askYesNo", gettext(c("Oh yeah!", "Don't think so", "Cancel"))),
```

## 3. Rebuilding R

- We can re-build R with our changes. Since we have only modified the utils
  package, rebuilding R will only re-build the utils package.
- First we need to be inside $BUILDDIR.
- Quit R with `q()` or by closing the R terminal.
- In the bash terminal, change to the build directory:

```bash
cd $BUILDDIR
```

- Now run the `make` command to rebuild R with the changes you made in
  step 2. This will be much faster than the full build!

```bash
make
```

- Optionally run `make check` to run R's test suite with your local changes.
  You may skip this step while iterating on a bug fix or other development,
  until you are ready to [create a patch](./patch_update.md).

- To use the re-built R, simply open a new R terminal.

## 4. Cross-checking Changes

- Check the edit has worked as expected by re-running the example code:

```R
> askYesNo("Is this a good example?")
Is this a good example? (Oh yeah!/don't think so/cancel) Oh yeah!
[1] TRUE
