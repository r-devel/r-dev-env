library(magick)
library(tools)

# Define the directory containing images
image_dir <- file.path("docs", "assets")

# Get all photos in the directory with specified extensions
files <- dir(image_dir, pattern = "\\.(jpeg|jpg|png)$", ignore.case = TRUE)

# Process each file
for (i in seq_along(files)) {
    # Read the image
    file_path <- file.path(image_dir, files[i])
    img <- tryCatch({
        image_read(file_path)
    }, error = function(e) {
        message("Error reading image: ", file_path)
        next
    })

    # Convert to webp
    img <- image_convert(img, "webp")

    # Define the output path, changing the extension to .webp
    output_path <- file_path_sans_ext(file_path)
    output_path <- paste0(output_path, ".webp")

    # Write the optimized image (overwrite original image) as WebP
    tryCatch({
        image_write(img, output_path)
    }, error = function(e) {
        message("Error writing image: ", output_path)
    })
}
