# Set site library for full use of VSCode-R extension.
# This is where packages required by VSCode-R extension are installed, specifically
# - jsonlite and rlang for R Session Watcher (needed to open HTML help pages)
# - languageserver for code completion
# - httpgd for http graphics device
# These are built and installed for the default R version when container is built.

.Library.site <- "/usr/local/lib/R/site-library"
# .libPaths() already includes site library for default R version.
.libPaths(c(.libPaths(), .Library.site))

# Source initialization script for VSCode R extension
source("~/.vscode-R/init.R")
.First.sys()

# Configure r-universe for binary package installations dynamically
linux_binary_repo <- function(universe){
  runiverse <- sprintf('r-universe.dev/bin/linux/%s-%s/%s/',
                       system2('lsb_release', '-sc', stdout = TRUE),
                       R.version$arch,
                       substr(getRversion(), 1, 3))
  sprintf('https://%s.%s', universe, runiverse)
}

# Set repos for CRAN to use r-universe linux binaries
options(repos = c(
  cran = linux_binary_repo("cran")
))
rm(linux_binary_repo)

# http graphics device requires unigd to be built for current R version
build_ver <- installed.packages()["unigd", "Built"]
r_ver <- paste(R.version$major, substr(R.version$minor, 1, 1), sep = ".")
if (substr(build_ver, 1, 3) != r_ver){
    message("installing unigd package (graphics backend) for R ", r_ver)
    suppressMessages(install.packages("unigd", quiet = TRUE))
}

# For PNG graphics uncomment following lines
# options(vsc.use_httpgd = FALSE,
#         vsc.dev.args = list(width = 800, height = 600))
