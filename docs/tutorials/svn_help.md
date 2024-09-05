## Checking out a different revision

You can check out a specific revision of the R sources with

```bash
svn checkout -r 1234 https://svn.r-project.org/R/trunk/ $TOP_SRCDIR
```

### Finding the last revision that passed check

Occasionally, the latest revision of the R sources does not pass `make check`.
In this case, it can be a good idea to revert to an earlier revision until the R
Core Team have made further updates to fix the issue.

Visit the [Build from
SVN](https://github.com/r-devel/r-svn/actions/workflows/build-svn.yaml) page
that summarises attempted builds of R using GitHub actions on the unofficial
GitHub mirror.  Find the latest run that completed successfully (green
checkmark) and use the commit message to search for the corresponding Subversion
revision.  For example, to search the last 10 revisions for the log message
"More @apifun and such annotations"

```bash
cd $TOP_SRCDIR
svn log --limit 10 --search "More @apifun and such annotations"
```

```
/workspaces/r-dev-env/svn/r-devel $ svn log --limit 10 --search "More @apifun and such annotations"
------------------------------------------------------------------------
r86726 | luke | 2024-06-12 18:00:19 +0000 (Wed, 12 Jun 2024) | 2 lines

More @apifun and such annotations.

------------------------------------------------------------------------
r86723 | luke | 2024-06-11 20:31:36 +0000 (Tue, 11 Jun 2024) | 2 lines

More @apifun and such annotations.

------------------------------------------------------------------------
```

If you have already attempted to build R, you can re-run the make with the
version identified in your search as follows:

```
svn checkout -r 86726 https://svn.r-project.org/R/trunk/ $TOP_SRCDIR
cd $BUILDDIR
make
make check
```

Otherwise, follow the full instructions in [Building R](./building_r.md),
updating the svn checkout command to use the required revision.

## Further Subversion Help

For further help on Subversion, refer to the online book [Version Control with
Subversion](https://svnbook.red-bean.com/).
