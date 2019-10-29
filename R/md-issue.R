#' @title Markdown Issue
#' @description A markdown feature unique to GitHub. Allows users to hyperlink
#' a specific issue or pull request using a username, repository name, and
#' issue number.
#' @param repo A character vector in the format `"user/rep"`.
#' @param num The issue or pull number _without_ hash symbol.
#' @return A character vector which GitHub can automatically hyperlink.
#' @family inline functions
#' @family markdown extensions
#' @examples
#' md_issue("kiernann/gluedown", 1)
#' @export
md_issue <- function(repo, num) {
  if (is.na(as.numeric(num))) {
    stop("The num must be coercible to numeric.")
  }
  if (!grepl("/", repo)) {
    warning("Your repo is not ideally formatted. A forward slash was not detected.")
  }
  glue::glue("{repo}#{num}")
}
