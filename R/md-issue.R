#' Markdown GitHub issue
#'
#' Take a character vector and numeric vector and concatenate them into a glue
#' vector of valid GitHub issue autolinks (username/repo#issue).
#'
#' @details
#' Within conversations on GitHub, references to issues and pull requests are
#' [automatically converted to shortened links](https://help.github.com/en/github/writing-on-github/autolinked-references-and-urls#issues-and-pull-requests).
#' @param repo A character vector in the format `"user/rep"`.
#' @param num The issue or pull number _without_ hash symbol.
#' @return A character vector which GitHub can automatically hyperlink.
#' @family inline functions
#' @family markdown extensions
#' @examples
#' md_issue("kiernann/gluedown", 1:5)
#' @export
md_issue <- function(repo, num) {
  if (any(is.na(as.numeric(num)))) {
    stop("The num must be coercible to numeric.")
  }
  if (!grepl("/", repo)) {
    warning("Your repo is not ideally formatted. A forward slash was not detected.")
  }
  glue::glue("{repo}#{num}")
}
