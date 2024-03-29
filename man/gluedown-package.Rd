% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gluedown-package.R
\docType{package}
\name{gluedown-package}
\alias{gluedown}
\alias{gluedown-package}
\title{gluedown: A package to format character vectors with markdown.}
\description{
The \code{gluedown} package helps transition from R's powerful
vectors to formatted markdown text. The functions use \code{\link[glue:glue]{glue::glue()}} to
wrap character vectors in valid markdown syntax. In combination with the
\code{knitr} package, this allows users to directly print R vectors as formatted
text for improved clarity and readability.
}
\section{Glue wrappers}{

The \verb{md_*()} functions return \code{glue} objects, which are returned using
\code{\link[=cat]{cat()}} by default. This allows users to both manipulate the formatted
strings as they would with any character vector and still present the
string to the user when an \code{knitr} chunk option is set to return code
results \code{'asis'}.
}

\section{Other wrappers}{

The \code{\link[=md_table]{md_table()}} and \code{\link[=md_convert]{md_convert()}} functions wrap around \code{\link[knitr:kable]{knitr::kable()}}
and \code{\link[markdown:renderMarkdown]{markdown::markdownToHTML()}} respectively. The later allows users to
convert \verb{md_*()} outputs to HTML fragments.
}

\seealso{
Useful links:
\itemize{
  \item \url{https://k5cents.github.io/gluedown/}
  \item \url{https://github.com/k5cents/gluedown/}
  \item Report bugs at \url{https://github.com/k5cents/gluedown/issues}
}

}
\author{
\strong{Maintainer}: Kiernan Nicholls \email{k5cents@gmail.com} (\href{https://orcid.org/0000-0002-9229-7897}{ORCID}) [copyright holder]

}
\keyword{internal}
