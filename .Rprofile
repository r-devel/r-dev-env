# Set site library for full use of VSCode-R extension.
# This is where packages required by VSCode-R extension are installed, specifically
# - jsonlite and rlang for R Session Watcher (needed to open HTML help pages)
# - languageserver for code completion
# - httpgd for http graphics device
# These are built and installed for the default R version when container is built.

.Library.site <- "/usr/local/lib/R/site-library"
# .libPaths() already includes site library for default R version.
.libPaths(c(.libPaths(), .Library.site))

# For PNG graphics uncomment following lines
# options(vsc.use_httpgd = FALSE,
#         vsc.dev.args = list(width = 800, height = 600))
