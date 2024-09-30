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

    # Resize the image to 1000 px width using Lanczos filter for resampling
    img <- image_resize(img, geometry_size_pixels(width = 1000), filter = "Lanczos")

    # Define the output path, changing the extension to .png
    output_path <- file_path_sans_ext(file_path)
    output_path <- paste0(output_path, ".png")

    # Write the optimized image (overwrite original image) as PNG with compression
    tryCatch({
        image_write(img, output_path, format = "png", compression = "Zip")
    }, error = function(e) {
        message("Error writing image: ", output_path)
    })
}
