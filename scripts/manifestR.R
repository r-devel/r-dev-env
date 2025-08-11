# manifestR.R
#
# Files takes the container arguments and creates two files inside the
# given container. These are the build history and manifest files.
#
# The build history file has the locations of the manifest and git history
# files. This is stored in the location given in histlines argument.
#
# The manifest file has the installed apt and R packages written into it
# along with the build time and commit hash for this build. This is is stored
# in the manifestdir location.
#
# Both are stored as markdown files on the container itself.

library(optparse)

option_list <- list(
  make_option(c("-r", "--registry"), type = "character", default = "ghcr.io",
              help = "Registry name"),
  make_option(c("-o", "--owner"), type = "character", default = "r-devel",
              help = "Current owner of the Repository"),
  make_option(c("-i", "--image"), type = "character", default = "devel",
              help = "Provide the image name [default %default]"),
  make_option(c("-t", "--historydir"), type = "character",
              default = "/tmp/hist_lines/", help = "location of history lines"),
  make_option(c("-m", "--manifestdir"), type = "character",
              default = "/tmp/manifests/",
              help = "Manifest file location  [default %default]"),
  make_option(c("-p", "--repository"), type = "character",
              default = "r-dev-env", help = "Repository name [ %default]")
)

parser <- OptionParser(usage = "%prog [options] file",
                       option_list = option_list)

args <- parse_args(parser, positional_arguments = 0)
opt <- args$options

#set up constants
build_time <- as.numeric(Sys.time())
tm <- as.POSIXlt(build_time, "UTC")
utc_time <- strftime(tm, "%Y-%m-%dT%H:%M:%S%z")

manifest_filename <- paste("manifest-", build_time, ".md", collapse = NULL,
                           sep = "")

history_filename <- paste("history-", build_time, ".md", collapse = NULL,
                          sep = "")

#set up docker
docker_id <- paste(opt$registry, "/", opt$repository, ":",
                   opt$image, collapse = NULL, sep = "")

container_id = system2("docker", args = c("run", "-it -d",  docker_id, "bash"),
                       stdout = TRUE)

write_all <- function() {
  write_manifest_details()
  write_history_details()
}

write_manifest_details <- function() {
  details <- get_manifest_details()
  write_manifest(details, opt$manifestdir, manifest_filename)
}

write_history_details <- function() {
  details <- get_build_history()
  write_manifest(details, opt$historydir, history_filename)
}

write_manifest <- function(manifestdata, filepth, filename) {

  my_directory <- file.path(filepth)
  if (!dir.exists(my_directory)) {
    dir.create(my_directory)
  }

  file_conn <- file(manifest_filename)
  writeLines(manifestdata, paste(my_directory, filename,
                                 sep = "/", collapse = NULL))
  close(file_conn)
}

get_manifest_details <- function() {

  buildregistry <- paste("registry", opt$registry, sep = ":")
  buildowner <- paste("owner", opt$owner, sep = ":")
  buildimage <- paste("image", opt$image, sep = ":")
  buildrepository <- paste("repository", opt$repository, sep = ":")
  buildtime <- paste("timestamp", build_time, sep = ":")

  r_ver <- r_version()
  rbuildversion <- paste("### R Version: ", r_ver, sep = "\n")

  r_package <- r_packages()
  rbuildpackages <- paste("### R Packages: ", r_package, sep = "\n")

  apt_package <- apt_packages()
  aptbuildpackages <- paste("### APT Packages: ", apt_package, sep = "\n")

  manifest_d <- manifest_string()

  title <- paste(opt$owner, opt$repository, sep = "/")
  build_title <- paste("# Build manifest for image ", title, ":", opt$image,
                       sep = "")

  builds <- paste(build_title, buildregistry, buildrepository, buildowner,
                  buildimage, buildtime, manifest_d,
                  rbuildversion, rbuildpackages, aptbuildpackages, " ",
                  sep = "\n\n")

  builds
}

get_build_history <- function() {

  platform <- "amd64"

  tags <- "default"

  commit <- get_commit_hash()

  diff_url <- paste("https://github.com/", opt$repository, collapse = NULL,
                    sep = "")

  diff <- paste("[Git diff](", diff_url, "/commit/", commit, ")",
                collapse = NULL, sep = "")
  dockerfile <- paste("[Dockerfile](", diff_url, "/blob/", commit, ")",
                      collapse = NULL, sep = "")
  manif <- paste("[Build manifest] (./", manifest_filename, ")",
                 collapse = NULL, sep = "")

  build_history <- paste(diff, dockerfile, manif, sep = "<br />")

  image_manifest <- paste("{", tags, ":", platform, "}", collapse = NULL,
                          sep = "")

  build_conf <- paste(utc_time, image_manifest, build_history, sep = " | ")

  build_conf
}


## Git helpers
get_commit_hash <- function() {
  arguments <- c("rev-parse", "HEAD")
  hash <- system2("git", args = arguments, stdout = TRUE)
  hash
}

get_commit_hash_tag <- function() {
  x <- get_commit_hash()
  tag <- substr(x, nchar(x) - 12 + 1, nchar(x))
  tag
}

##Linux Helper
get_linux_release <- function() {
  os <- docker_command(c("lsb_release", "-a"))
  release <- paste(os, sep = " ", collapse = "\n")
  release
}

#packages
r_version <- function() {

  r_version <- docker_command(c("R", "--version"))
  details <- strsplit(r_version, "\r", fixed = TRUE)
  version <- paste(details[[1]], details[[3]], sep = " ", collapse = "\n\n")
  version
}

r_packages <- function() {

  # from dockerstack
  r <- docker_command(c("R", "--silent", "-e",
                        "'installed.packages(.Library)[, c(1,3)]'"))
  #tidy the response by removing final > and the initial commands
  package <- paste(unlist(strsplit(r, "\r", fixed = TRUE)[3:length(r) - 1]),
                   sep = " ", collapse = "\n")
  package
}

apt_packages <- function() {
  e <- docker_command(c("apt", "list", "--installed"))
  #remove listing line and then clean up response
  install <- paste(strsplit(e, "\r", fixed = TRUE)[2:length(e)], sep = " ",
                   collapse = " \n")
  remove_local <- gsub("\\[installed,local\\]", "", install)
  install1 <- gsub("\\[32m", "", remove_local)
  installed <- unlist(paste(gsub("\\[0m/now", "", install1), sep = " ",
                            collapse = " \n"))
  installed
}

# manifest
manifest_string <- function() {
  m <- paste("default", get_commit_hash_tag(), utc_time, get_linux_release(),
             collapse = NULL, sep = " ")
  m
}

# Docker functions
docker_start <- function() {
  args <- system2("docker", args = c("run", "-it -d",  docker_id),
                                     stdout = TRUE)
  args
}

docker_stop <- function() {
  system2("docker", args = c("stop",  container_id))
}

docker_command <- function(arguments) {
  docker <- paste("run", "-it -d",  docker_id, "bash", "-c",
                  sep = " ", collapse = "")

  a <- paste('"', paste(arguments, sep = " ", collapse = " "), '"',
             collapse = NULL)

  cmd <- system2("docker", args = c(docker, a), stdout = TRUE)
  cmd
}

#container_id <- docker_start()
write_all()
