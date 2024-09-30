# R Dev Container

![Release](https://img.shields.io/github/v/release/r-devel/r-dev-env)

The aim of the R Dev Container is to provide a standard environment for the
exploration and development of the R source code. A prototype was developed
under Google Summer of Code 2023 and development is continuing under Google
Summer of Code 2024.

## Getting started

### Run in a web browser with GitHub Codespace

Click on the button below followed by "Create Codespace" to create and enter
your own web based containerised develoment environment.

[![Open in GitHub
Codespaces](https://github.com/codespaces/badge.svg)](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=647768262&machine=premiumLinux&devcontainer_path=.devcontainer%2Fdevcontainer.json&location=WestUs2)

The [Starting Codespace
section](https://contributor.r-project.org/r-dev-env/container_setup/creating_codespace/)
of the R Dev Container Docs will walk you through the process. Then you can work
through the tutorials in the docs to lean how to use the codespace for R
development.

More details about GitHub codespaces can be found in the [GitHub Codespaces
Docs](https://docs.github.com/en/codespaces/overview). GitHub currently offers
up to 60 hours for free on dual core codespaces.

### Run on your local computer

The R Dev Container can also be run locally on your computer.  Running the
environment requires you to have Docker, VSCode, and the VSCode Dev Containers
extension installed.  Upon opening a copy of the [r-dev-env
repository](https://github.com/r-devel/r-dev-env) in VSCode you will be prompted
to start the dev container.

The [Local setup
section](https://contributor.r-project.org/r-dev-env/tutorials/localsetup/) of
the R Dev Container Docs will walk you through the process.  Then you can work
through the following the tutorials in the docs to learn how to use the
codespace for R development.

More information about Dev Containers can be found in the [Microsoft
Documentation](https://code.visualstudio.com/docs/devcontainers/containers).

## Project Background

The standard development process used by members of the R Core Team involves an
iterative process of making changes to the source code, re-building R and
exploring/testing the changes made.  This process presents a big hurdle for new
contributors to R, as setting up their system to build R can be non-trivial,
requiring a lot of trouble-shooting, especially on Windows and macOS.  On Linux
and macOS, it is not straight-forward to work with different versions of R
side-by-side and care needs to be taken not to corrupt or over-write the user's
existing version of R/R packages.

For these reasons, we propose to create containerized development environments
for R.  Our focus will be on creating a complete environment, including an IDE,
that will provide a familiar space for R developers to work on contributions to
base R.

## Contributors

GSoC contributor: Atharva Shirdhankar

Mentors: Heather Turner, James Tripp, Iain Emsley
