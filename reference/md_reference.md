# Markdown link reference

Take character vectors of link texts, link destinations, and optional
titles and return single glue vector of valid markdown link references.
This markdown leaf block then uses the `label` placed *elsewhere* in a
markdown document to render `<href>` HTML tags.

## Usage

``` r
md_reference(label, url, title = NULL, ..., .name = FALSE)
```

## Arguments

- label:

  A link label that is referenced elsewhere in the document.

- url:

  The URL to hyperlink the referenced text with.

- title:

  An *optional* link title; defaults to `NULL`.

- ...:

  A sequence of `label = "/url"` named vector pairs. If any such pairs
  are provided, `.name` will be considered `TRUE`.

- .name:

  logical; if `TRUE`, the pairs in `...` will be used instead of any
  values supplied to `x` and `url`.

## Value

A single `glue` vector of length equal to that of `label` and `url`,
with elements the concatenated arguments.

## Details

A full reference link (6.6) consists of a link text immediately followed
by a link label that matches a link reference definition elsewhere in
the document...

A link reference definition consists of a link label, indented up to
three spaces, followed by a colon (`:`), optional whitespace (including
up to one line ending), a link destination, optional whitespace
(including up to one line ending), and an optional link title, which if
it is present must be separated from the link destination by whitespace.
No further non-whitespace characters may occur on the line.

A link reference definition does not correspond to a structural element
of a document. Instead, it defines a label which can be used in
reference links and reference-style images elsewhere in the document.
Link reference definitions can come either before or after the links
that use them.

## See also

Other leaf block functions:
[`md_blank()`](https://k5cents.github.io/gluedown/reference/md_blank.md),
[`md_chunk()`](https://k5cents.github.io/gluedown/reference/md_chunk.md),
[`md_fence()`](https://k5cents.github.io/gluedown/reference/md_fence.md),
[`md_heading()`](https://k5cents.github.io/gluedown/reference/md_heading.md),
[`md_indent()`](https://k5cents.github.io/gluedown/reference/md_indent.md),
[`md_label()`](https://k5cents.github.io/gluedown/reference/md_label.md),
[`md_paragraph()`](https://k5cents.github.io/gluedown/reference/md_paragraph.md),
[`md_rule()`](https://k5cents.github.io/gluedown/reference/md_rule.md),
[`md_setext()`](https://k5cents.github.io/gluedown/reference/md_setext.md),
[`md_table()`](https://k5cents.github.io/gluedown/reference/md_table.md)

## Examples

``` r
md_reference(CRAN = "https://cran.r-project.org/")
#> [CRAN]: https://cran.r-project.org/
md_reference(label = 1:2, url = c("https://one.org", "https://two.com"))
#> [1]: https://one.org
#> [2]: https://two.com
md_reference("tv", "https://www.tidyverse.org/", title = "tidyverse")
#> [tv]: https://www.tidyverse.org/ "tidyverse"
```
