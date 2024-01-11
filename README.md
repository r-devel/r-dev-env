# R Dev Container

[![Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)

# Containerised R Development Environment
The containerized development environment for R is a Google Summer of Code 2023 project. Our aim is to provide a standard environment to enable the exploration and development of the R source code. The project is currently under active development.

Click on the button below followed by "Create Codespace" to create and enter your own web based containerised develoment environment.

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=647768262&machine=premiumLinux&devcontainer_path=.devcontainer%2Fdevcontainer.json&location=WestUs2)

More details about GitHub codespaces can be found [here](https://docs.github.com/en/codespaces/overview). GitHub currently offers up to 60 hours for free on dual core codespaces.

# Run on your local computer

The environment can be run locally on your computer. Running the environment requires you to have Docker, VSCode, and the VSCode Dev Containers extension installed. Upon opening a copy of the [r-dev-env repository](https://github.com/r-devel/r-dev-env) in VSCode you will be prompted to start the dev container. More information about Dev Containers can be found in the [Microsoft Documentation](https://code.visualstudio.com/docs/devcontainers/containers).

# Project Background

​The standard development process used by members of the R Core Team involves an iterative process of making changes to the source code, re-building R and exploring/testing the changes made. This process presents a big hurdle for new contributors to R, as setting up their system to build R can be non-trivial, requiring a lot of trouble-shooting, especially on Windows and macOS. On Linux and macOS, it is not straight-forward to work with different versions of R side-by-side and care needs to be taken not to corrupt or over-write the user's existing version of R/R packages.

For these reasons, we propose to create containerized development environments for R. Our focus will be on creating a complete environment, including an IDE, that will provide a familiar space for R developers to work on contributions to base R.​

# Contributors

GSoC contributor: Atharva Shirdhankar

Evaluating mentor: Heather Turner

Mentor: James Tripp

## Tutorials 
- [Getting Started with Codespace](https://contributor.r-project.org/r-dev-env/tutorials/creating_codespace/)
- [Running R on Codespace](https://contributor.r-project.org/r-dev-env/tutorials/running_r/)
- [Building R](https://contributor.r-project.org/r-dev-env/tutorials/building_r/)
- [Contribution Workflow](https://contributor.r-project.org/r-dev-env/tutorials/contribution_workflow/)
- [Updating Source Code](https://contributor.r-project.org/r-dev-env/tutorials/update_source/)
- [Creating Patch File](https://contributor.r-project.org/r-dev-env/tutorials/patch_update/)
- [Multiple R version](https://contributor.r-project.org/r-dev-env/tutorials/multi_r_compilation/)
- [Restarting And Stopping Codespace](https://contributor.r-project.org/r-dev-env/tutorials/codespacestartstop/)
- [Using R Dev Environment Locally](https://contributor.r-project.org/r-dev-env/tutorials/localsetup/)
- [Useful Resources](https://contributor.r-project.org/r-dev-env/resources/)
