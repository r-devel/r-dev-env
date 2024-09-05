## R Development Container 0.3

- Implemented Gitpod setup with GitHub Actions workflow to build Docker images for the Gitpod workspace.
- Improved `which_r` script with version choice validation and updated both `which_r` and `set_build_r` scripts for enhanced functionality.
- Resolved local setup permission issues to ensure smoother operation within the devcontainer environment on Linux.
- Restructured documentation to incorporate Gitpod alternative setup.
- Implemented a workflow to optimize images so that documentation files are more lightweight.

## R Development Container 0.2

- Documentation split into set of markdown files. These are used to create the documentation website <https://contributor.r-project.org/r-dev-env/> and the user-focused pages can be accessed directly within the codespace, linked from an index that opens when the codespace first starts. New documentation pages/topics:
  - Restarting and stopping the codespace
  - Live Share
  - Local Setup
  - Updating Source Code
  - Creating a patch file
  - Multiple R Versions
  - SVN Help
  - Contributor Guide (for R Dev Container itself)
  - Troubleshooting
- Building R documentation now instructs to build R with recommended packages as it only takes a few more minutes to set up and enables all the tests to be run with `make check`.
- Updated GitHub Actions, so that the container is rebuilt twice a month with updated software, including the latest version of R.
- Disconnected Codespace from r-dev-env GitHub repository, so changes are not tracked as changes to code for the container itself.
- Updated Codespace settings so that checkouts of the R sources are recognised as Subversion repositories, connecting to VS Code version control tab.
- Updated Codespace settings so that the R code linter is turned off (cannot define linter for base R!)
- Enabled httpgd graphics device to replace the default of plotting to PNG.
- Modified the default settings of `$BUILDDIR` and `$TOP_SRCDIR` to give a more logical setup for working with multiple R versions.
- Added `which_r` script to set the R version to use in R terminals, rather than using `sudo make install` to overwrite installed R release version.
- Added `set_build_r` bash function to facilitate custom settings of `$BUILDDIR` and `$TOP_SRCDIR` for working with multiple R versions.

## R Development Container 0.1

First version of the R Development Container, including:

- DevContainer definition for creating a codespace allowing users to build R in a web based environment
- Instructions for building the current version of R from the SVN trunk within the DevContainer in the README.md file
- Contributor workflow instructions in the README.md file
- Docker image build from the dev-container branch which contains the requirements for building base R. The image is available from <https://github.com/r-devel/r-dev-env/pkgs/container/r-dev-env>
- Project website build from the website branch and available at <https://contributor.r-project.org/r-dev-env/>

We hope the R Development Container helps you in your R journey 😊
