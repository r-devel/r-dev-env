# Set site library for full use of VSCode-R extension.
# This is where packages required by VSCode-R extension are installed, specifically
# - jsonlite and rlang for R Session Watcher (needed to open HTML help pages)
# - languageserver for code completion
# - httpgd for http graphics device
# These are built and installed for the default R version when container is built.

.Library.site <- "/usr/local/lib/R/site-library"
# .libPaths() already includes site library for default R version.
.libPaths(c(.libPaths(), .Library.site))


# The remotes package is installed to install httpgd from GitHub
# The gdiff package is installed to support visual difference testing

# Configure r-universe for binary package installations dynamically
linux_binary_repo <- function(universe){
  runiverse <- sprintf('r-universe.dev/bin/linux/%s-%s/%s/',
                       system2('lsb_release', '-sc', stdout = TRUE),
                       R.version$arch,
                       substr(getRversion(), 1, 3))
  sprintf('https://%s.%s', universe, runiverse)
}

# Set repos for CRAN and nx10 (httpgd) to use r-universe linux binaries
options(repos = c(
  cran = linux_binary_repo("cran"),
  nx10 = linux_binary_repo("nx10")
))

# VSCode httpgd graphics device integration (optional)
if (interactive() && Sys.getenv("TERM_PROGRAM") == "vscode") {
  if (requireNamespace("httpgd", quietly=TRUE)) {
    options(vsc.plot = FALSE)
    options(device = function(...) {
      httpgd::hgd(silent = TRUE)
      .vsc.browser(httpgd::hgd_url(history = FALSE), viewer = "Beside")
    })
  }
}
# For PNG graphics uncomment following lines
# options(vsc.use_httpgd = FALSE,
#         vsc.dev.args = list(width = 800, height = 600))
