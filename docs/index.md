# R Dev Container

## Project Background

The standard development process used by members of the R Core Team involves an iterative process of making changes to the source code, re-building R and exploring/testing the changes made. This process presents a big hurdle for new contributors to R, as setting up their system to build R can be non-trivial, requiring a lot of trouble-shooting, especially on Windows and macOS. On Linux and macOS, it is not straight-forward to work with different versions of R side-by-side and care needs to be taken not to corrupt or over-write the user's existing version of R/R packages.

For these reasons, we propose to create containerized development environments for R. Our focus will be on creating a complete environment, including an IDE, that will provide a familiar space for R developers to work on contributions to base R.

## Contributors

GSoC contributor: Atharva Shirdhankar

Mentors: Heather Turner, James Tripp, Iain Emsley
