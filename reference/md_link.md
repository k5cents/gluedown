# Markdown inline link (6.6)

Take character vectors of link texts, link destinations, and optional
titles and return single glue vector of valid markdown inline links.
This inline is rendered as the `<href>` HTML tag.

## Usage

``` r
md_link(text, url, title = NULL, ..., .name = FALSE)
```

## Arguments

- text:

  A character vector of text with another vector of URLs passed to the
  `url` argument.

- url:

  A character vector of URLs.

- title:

  The optional title of the link.

- ...:

  A sequence of `text = "/url"` named vector pairs. If any such pairs
  are provided, `.name` will be considered `TRUE`.

- .name:

  logical; if `TRUE`, the pairs in `...` will be used instead of any
  values supplied to `x` and `url`.

## Value

A `glue` vector of collapsed display text and associated URLs.

## Details

A link contains link text (the visible text), a link destination (the
URI that is the link destination), and optionally a link title. There
are two basic kinds of links in Markdown. In inline links the
destination and title are given immediately after the link text.

A link text consists of a sequence of zero or more inline elements
enclosed by square brackets (`[` and `]`)...

An inline link consists of a link text followed immediately by a left
parenthesis `(`, optional whitespace, an optional link destination, an
optional link title separated from the link destination by whitespace,
optional whitespace, and a right parenthesis `)`. The link’s text
consists of the inlines contained in the link text (excluding the
enclosing square brackets). The link’s URI consists of the link
destination, excluding enclosing `<...>` if present, with
backslash-escapes in effect as described above. The link’s title
consists of the link title, excluding its enclosing delimiters, with
backslash-escapes in effect as described above.

## See also

Other inline functions:
[`md_autolink()`](https://k5cents.github.io/gluedown/reference/md_autolink.md),
[`md_bold()`](https://k5cents.github.io/gluedown/reference/md_bold.md),
[`md_code()`](https://k5cents.github.io/gluedown/reference/md_code.md),
[`md_convert()`](https://k5cents.github.io/gluedown/reference/md_convert.md),
[`md_disallow()`](https://k5cents.github.io/gluedown/reference/md_disallow.md),
[`md_escape()`](https://k5cents.github.io/gluedown/reference/md_escape.md),
[`md_hardline()`](https://k5cents.github.io/gluedown/reference/md_hardline.md),
[`md_image()`](https://k5cents.github.io/gluedown/reference/md_image.md),
[`md_issue()`](https://k5cents.github.io/gluedown/reference/md_issue.md),
[`md_italic()`](https://k5cents.github.io/gluedown/reference/md_italic.md),
[`md_softline()`](https://k5cents.github.io/gluedown/reference/md_softline.md),
[`md_strike()`](https://k5cents.github.io/gluedown/reference/md_strike.md),
[`md_text()`](https://k5cents.github.io/gluedown/reference/md_text.md)

## Examples

``` r
md_link(1:5, glue::glue("https://{state.abb[1:5]}.gov"), state.name[1:5])
#> [1](https://AL.gov "Alabama")
#> [2](https://AK.gov "Alaska")
#> [3](https://AZ.gov "Arizona")
#> [4](https://AR.gov "Arkansas")
#> [5](https://CA.gov "California")
md_link(CRAN = "https://cran.r-project.org/")
#> [CRAN](https://cran.r-project.org/)
```
