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
    
    # Resize the image to 800 px width using Triangle filter for resampling
    img <- image_resize(img, geometry_size_pixels(width = 800), filter = "Triangle")
    
    
    # Define the output path (overwrite original image)
    output_path <- file_path
    
    # Write the optimized image (overwrite original image)
    tryCatch({
        image_write(img, output_path, format = "jpg", quality = 82)
    }, error = function(e) {
        message("Error writing image: ", output_path)
    })
}