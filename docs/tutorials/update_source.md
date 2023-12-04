<script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/2.0.8/clipboard.min.js"></script>
## Updating Source Code

After following through the Contribution workflow and making the following changes, we need to update it inside the source code directory. To do so, first we need to follow this steps:

#### 1) Change Directory to TOP_SRCDIR

If you are currently inside the BUILDDIR directory or root directory(/workspaces/r-dev-env) make sure to change it to TOP_SRCDIR so that we can update the changes made inside our source code.

```{.bash .clipboard-target .code-block-1}
cd $TOP_SRCDIR
```
<button class="btn custom-btn" data-clipboard-target=".code-block-1">
   Copy to Clipboard
</button>

#### 2) Update using svn

Now we want to update the source code for that we will use svn command update

```{.bash .clipboard-target .code-block-2}
svn update
```
<button class="btn custom-btn" data-clipboard-target=".code-block-2">
   Copy to Clipboard
</button>

#### 3) Check changes made using diff

To cross check the changes we made in source code. We will use this command

```{.bash .clipboard-target .code-block-3}
svn diff
```
<button class="btn custom-btn" data-clipboard-target=".code-block-3">
   Copy to Clipboard
</button>

#### 4) Revert Changes(Optional step)

In some cases, we might want to revert the changes we made. We can use the revert command

To revert the changes made in specific file, we can use

```{.bash .clipboard-target .code-block-4}
svn revert src/library/utils/R/askYesNo.R
```
<button class="btn custom-btn" data-clipboard-target=".code-block-4">
   Copy to Clipboard
</button>

To revert changes in a directory

```{.bash .clipboard-target .code-block-5}
svn revert src/lib/utils
```
<button class="btn custom-btn" data-clipboard-target=".code-block-5">
   Copy to Clipboard
</button>

To revert all local changes

```{.bash .clipboard-target .code-block-6}
svn revert -R .
```
<button class="btn custom-btn" data-clipboard-target=".code-block-6">
   Copy to Clipboard
</button>

#### 5) Change Directory and Rebuild

To rebuild the R version and reflect on the changes made, we want to change directory to BUILDDIR from TOP_SRCDIR

```{.bash .clipboard-target .code-block-7}
cd $BUILDDIR
```
<button class="btn custom-btn" data-clipboard-target=".code-block-7">
   Copy to Clipboard
</button>

#### 6) Rebuild the Source Code

Now rebuild using make command

```{.bash .clipboard-target .code-block-8}
make check
make
```
<button class="btn custom-btn" data-clipboard-target=".code-block-8">
   Copy to Clipboard
</button>