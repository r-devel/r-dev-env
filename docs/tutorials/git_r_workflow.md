# Alternate git-r workflow for R Development

This guide briefly covers using **git-r** inside the 
r-dev-env container to develop, build, and push changes
to R source.


#### 1. Update Your Local Source

- Open a terminal in the container.
- Clone the R SVN mirror repository if you haven’t already:

    ```
    git clone https://github.com/r-devel/r-svn.git /workspaces/r-dev-env/r-source
    ```

- Navigate to your cloned R SVN mirror repository:

    ```
    cd /workspaces/r-dev-env/r-source
    ```

- Fetch the latest commits:

    ```
    git fetch origin
    ```

- Synchronize the internal SVN metadata used by R’s build system:

    ```
    git r svn-revision
    ```


#### 2. Build R from Source

- Use `git-r` commands to configure, build, and install R:

    ```
    git r configure --enable-R-shlib --enable-memory-profiling --without-recommended-packages
    git r build
    git r install
    ```

- To include recommended packages:

    ```
    git r pull-recommended
    git r build-recommended
    ```


#### 3. Make Your Code Changes

- Make edits or additions within the source tree (`src/`, `R/`, etc.).
 For example:

    ```
    echo "// Fix for bug 12345" >> src/main/arithmetic.c
    ```

- Commit your changes locally to track them with Git:

    ```
    git add src/main/arithmetic.c
    git commit -m "Fix arithmetic bug (12345)"
    ```


#### 4. Push Your Changes to Your Fork of r-svn

- Add your personal fork as a remote (replace YOUR-USERNAME):

    ```
    git remote add myfork https://github.com/YOUR-USERNAME/r-svn.git
    ```

- Create a feature branch based on `devel`:

    ```
    git checkout -b feature/12345-arithmetic-fix
    ```

- Push your branch to your fork:

    ```
    git push myfork feature/12345-arithmetic-fix
    ```

- Create a pull request on GitHub to propose your changes to the 
official repository:

    ```
    https://github.com/YOUR-USERNAME/r-svn/pull/new/feature/12345-arithmetic-fix
    ```


#### 5. Submit Your Patch to R’s Bugzilla

- Use `git-r` to generate an SVN-compatible patch file for Bugzilla submission:

    ```
    git r svn-diff > ../patches/12345-arithmetic-fix.diff
    ```

- Upload this patch file to [R’s Bugzilla](https://bugs.r-project.org/) under
 the corresponding bug report.

