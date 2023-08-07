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

## Getting started

You can run this environment on GitHub using [codespaces](https://github.com/features/codespaces)

### Codespaces

Click on the 'Open in GitHub Codespaces' button and then click the green 'Create Codespace' button.

> You will see the message "Codespace usage for this repository is paid for by ...", with your username. Don't panic!
> 
> **Note : Github Codespaces offers 120 core hours of free usage per month for every Github user. So the actual number of free hours is 120 divided by the number of cores you are using to run your codespaces.**
>
> **Here for the R-dev-env codespace we have set the codespace usage to 4 cores which leads to 30hrs of free usage per month. And it can also be changed according to your preference.**
> 
> For more details about codespaces billing, see the [Codespaces Billing Docs](https://github.com/features/codespaces). You can calculate your GitHub services usage with the [GitHub Services Pricing Calculator](https://github.com/pricing/calculator) and check your usage allowance under "Codespaces" on https://github.com/settings/billing.
![image](https://github.com/r-devel/r-dev-env/assets/72031540/d42c5d89-7f1d-46fc-8fdd-44e03311c9b2)


The codespace setup screen will then be shown. Starting the container may take a minute or so.

<p align="center">
    <img src="screenshots/setting_up_codespace.png" width="80%">
</p>


You will be taken to a VSCode editor within your browser.

![image](https://github.com/r-devel/r-dev-env/assets/72031540/0597c261-a110-496c-86a4-9fb08f5dc34d)





- [Running R]()
- [Building R]()
- [Contribution Workflow]()
- [Restarting And Stopping Codespace]()
- [Using Locally]()
- [Useful Resources]()
