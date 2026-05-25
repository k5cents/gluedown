# gluedown: A package to format character vectors with markdown.

The `gluedown` package helps transition from R's powerful vectors to
formatted markdown text. The functions use
[`glue::glue()`](https://glue.tidyverse.org/reference/glue.html) to wrap
character vectors in valid markdown syntax. In combination with the
`knitr` package, this allows users to directly print R vectors as
formatted text for improved clarity and readability.

## Glue wrappers

The `md_*()` functions return `glue` objects, which are returned using
[`cat()`](https://rdrr.io/r/base/cat.html) by default. This allows users
to both manipulate the formatted strings as they would with any
character vector and still present the string to the user when an
`knitr` chunk option is set to return code results `'asis'`.

## Other wrappers

The
[`md_table()`](https://k5cents.github.io/gluedown/reference/md_table.md)
and
[`md_convert()`](https://k5cents.github.io/gluedown/reference/md_convert.md)
functions wrap around
[`knitr::kable()`](https://rdrr.io/pkg/knitr/man/kable.html) and
[`markdown::markdownToHTML()`](https://rdrr.io/pkg/markdown/man/renderMarkdown.html)
respectively. The later allows users to convert `md_*()` outputs to HTML
fragments.

## See also

Useful links:

- <https://k5cents.github.io/gluedown/>

- <https://github.com/k5cents/gluedown/>

- Report bugs at <https://github.com/k5cents/gluedown/issues>

## Author

**Maintainer**: Kiernan Nicholls <k5cents@gmail.com>
([ORCID](https://orcid.org/0000-0002-9229-7897)) \[copyright holder\]
