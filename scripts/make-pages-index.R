# Writes the GitHub Pages entry point after Quarto render.
# Quarto cleans docs/ on each render, so this file is recreated every time.
# The script finds the project root from its own path so it does not depend
# on the working directory, and it does not assume a Unix shell.

args <- commandArgs(trailingOnly = FALSE)
file_arg <- grep("^--file=", args, value = TRUE)
if (length(file_arg) == 0) {
  stop("Could not locate this script. Run it with Rscript.")
}
script_dir <- dirname(normalizePath(sub("^--file=", "", file_arg[[1]])))
root <- normalizePath(file.path(script_dir, ".."))
docs <- file.path(root, "docs")
if (!dir.exists(docs)) {
  dir.create(docs, recursive = TRUE)
}

html <- c(
  "<!DOCTYPE html>",
  "<html lang=\"en\">",
  "<head>",
  "<meta charset=\"utf-8\">",
  "<title>Global Patterns in Reported Human Rabies Deaths (2010\u20132024)</title>",
  "<meta http-equiv=\"refresh\" content=\"0; url=rabies_analysis.html\">",
  "<link rel=\"canonical\" href=\"rabies_analysis.html\">",
  "</head>",
  "<body>",
  "<p><a href=\"rabies_analysis.html\">Global Patterns in Reported Human Rabies Deaths (2010\u20132024)</a></p>",
  "</body>",
  "</html>"
)
writeLines(html, file.path(docs, "index.html"), useBytes = FALSE)
file.create(file.path(docs, ".nojekyll"))
message("Wrote ", file.path(docs, "index.html"))
