<script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/2.0.8/clipboard.min.js"></script>
## Creating a Patch File

We can also create a patch file for the update and changes that we made to the source code.

1) Assuming we have made a change and we want to submit a patch.

If necessary, update the version of R you are working on, with the latest changes in <https://svn.r-project.org/R/trunk/>.

E.g. if the version of R you are working on is named "R-devel-working"

```{.bash .clipboard-target .code-block-1}
cd $TOP_SRCDIR/R-devel-working
svn update
cd $BUILDDIR/R-devel-working
make # this will run the configure as before
```
<button class="btn custom-btn" data-clipboard-target=".code-block-1">
   Copy to Clipboard
</button>

2) Now run R's test suite to make sure that your change has not broken anything:

```{.bash .clipboard-target .code-block-2}
make check
```
<button class="btn custom-btn" data-clipboard-target=".code-block-2">
   Copy to Clipboard
</button>

3) Then create a patch. The patch file will be saved inside the patchdir directory.

```{.bash .clipboard-target .code-block-3}
cd "$TOP_SRCDIR"
svn update
svn diff > $PATCHDIR/patch.diff
```
<button class="btn custom-btn" data-clipboard-target=".code-block-3">
   Copy to Clipboard
</button>