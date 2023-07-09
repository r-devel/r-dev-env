# R Dev Container

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=613269999&machine=premiumLinux&devcontainer_path=.devcontainer%2Fdevcontainer.json&location=WestUs2)

A containerised development environment for editing and compiling the R source code. The environment contains the VSCode IDE and tools needed to compile R.

## Getting started

You can run this environment on GitHub using [codespaces](https://github.com/features/codespaces)

### Codespaces

Click on the 'Open in GitHub Codespaces' button and then click the green 'Create Codespace' button.

<p align="center">
    <img src="screenshots/create_codespace.png" width="80%">
</p>


The codespace setup screen will then be shown. Starting the container may take a minute or so.

<p align="center">
    <img src="screenshots/setting_up_codespace.png" width="80%">
</p>


You will be taken to a VSCode editor within your browser.

<p align="center">
    <img src="screenshots/vscode_in_codespace.png" width="80%">
</p>

## Running R

Create a file in VS Code ending with a .R extension. You can create new files by clicking on the new file icon in VS Code.

<p align="center">
    <img src="screenshots/plus_file_icon.png" width="80%">
</p>

Open the file by clicking on the filename. You should see R:(note attached) in the bottom bar.

<p align="center">
    <img src="screenshots/unattached_r.png" width="80%">
</p>

Click on the R:(note attached) button to launch R in the terminal. You can then send code from the .R file to the termianl r by pressing cmd + enter.

<p align="center">
    <img src="screenshots/running_r_code.png" width="80%">
</p>

## R Contribution Workflow

### Build Setup
1. Environment Variables
    - We have environment variables for setting path to install and build R and source code. And also for R source code version.
    - The path ENV variable for R Build and R Source code are BUILDDIR and TOP_SRCDIR respectively. And for R source code version it is R_VERSION.
    - The environment variables are set in the codespace image and are available when the codespace starts.
    - The R_VERSION_BUILD_DIR has BUILDDIR path as base path and R_VERSION is added as suffix.
      
      ![image](https://github.com/r-devel/r-dev-env/assets/72031540/6b6cb661-cde3-4c69-845a-a6a281c18ec2)
2. svn checkout
   - The svn checkout cmd lets us create working of a repository with specific tag/branch.
   - Example:
    ```bash
     svn checkout https://svn.r-project.org/R/tags/$R_VERSION/ "$R_VERSION_SOURCE_DIR"
     ```
   - Here we are checking out R source with specific version and the checkout files and folders will be stored inside R_VERSION_SOURCE_DIR directory.
   - Output : We get file structure something like this after checking out R source code from R svn repository.
     ![image](https://github.com/r-devel/r-dev-env/assets/72031540/5c560a5e-a40d-4c68-9013-d6eec7327020)

3. cd to BUILDDIR
   - We need to change our directory to R build directory(BUILDDIR) to build and configure our R source code.
   - ```bash
     cd $R_VERSION_BUILD_DIR
     ```
   - The R_VERSION_BUILD_DIR has BUILDDIR path as base path and R_VERSION is added as suffix.
5. configure source code
   - After we change directory to BUILDDIR we can build R and source code.
   - ```bash
     "$R_VERSION_SOURCE_DIR/configure" --enable-R-shlib --without-recommended-packages
     make
     sudo make install
     ```
   - The configure cmd help us build R and files and folders are stored inside BUILDDIR directory.
   - Output : We get file structure something like this after using configure command.
     
     ![image](https://github.com/r-devel/r-dev-env/assets/72031540/b6279710-1176-4c56-9a09-7c41c582e5f8)

6. After having configured setup, we can now make changes in source code and make our contributions.

### Contribution Workflow
1. R-org uses bugzilla for bug tracking and svn as a version control system.
2. We can find listed and known bugs on bugzilla. Link : https://bugs.r-project.org/buglist.cgi?bug_status=__open__
3. Example Contribution Workflow using DevContainer:
   -  We will use bug [17616](https://bugs.r-project.org/show_bug.cgi?id=17616)
   -  To confirm the bug we will click on `R:(not attach)` option which is in the bottom right of our R-dev codespace. It will open R terminal for us.
     
       ![image](https://github.com/r-devel/r-dev-env/assets/72031540/4ad3ed18-108a-4f29-ab6c-7f32d81721a7)
       ![image](https://github.com/r-devel/r-dev-env/assets/72031540/b3bdd3da-903d-4330-81c3-e41147d5dcd4)

   -  We can now run R cmds. The expected output with bug (the second parameter label has the number of the factor level, "2", rather than the label of the factor level, "chilled") :
      ```R
      > lm(uptake~C(Treatment, contr.treatment), CO2)
        Call:
        lm(formula = uptake ~ C(Treatment, contr.treatment), data = CO2)

        Coefficients:
                   (Intercept)  C(Treatment, contr.treatment)2  
                         30.64                           -6.86
      ```
 4. Edit the source code of stats::`contrasts<-()`  to implement the proposed fix. The source code can be found in $BUILDDIR/src/library/stats/R/contrasts.R. Before fix:
    ```R
    if(is.function(value)) value <- value(nlevels(x))
    ```
       With fix:
     ```R
      if(is.function(value)) value <- value(levels(x))
     ```
 5. Re-build the stats package (we only need to re-build the part we have modified). We can rebuild the package by following simple steps
    - First we need to be inside $BUILDDIR, for that we can change directory to `cd $BUILDDIR`.
    - After that we can run cmd `make` and `sudo make install` in a series to build our package again and we can now see our changes getting  reflected.
 6. Check fix has worked as expected by re-running the reprex. Expected output without bug
    ```R
    > lm(uptake~C(Treatment, contr.treatment), CO2)
      Call:
      lm(formula = uptake ~ C(Treatment, contr.treatment), data = CO2)

      Coefficients:
                         (Intercept)  C(Treatment, contr.treatment)chilled  
                               30.64                                 -6.86 
                               ```
## Useful Links

* [R in Visual Studio code](https://code.visualstudio.com/docs/languages/r)

* [VSCode R Wiki](https://github.com/REditorSupport/vscode-R/wiki)

* [Getting started with Dev Containers](https://code.visualstudio.com/docs/devcontainers/tutorial)

* [Install Docker Desktop](https://www.docker.com/products/docker-desktop/)

* [Installing Docker on Linux](https://docs.docker.com/desktop/install/linux-install/)

* [Dev Container Documentation](https://code.visualstudio.com/docs/devcontainers/containers)
