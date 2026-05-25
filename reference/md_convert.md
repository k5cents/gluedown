# Convert markdown to HTML

Take a character vector of valid markdown text and pass it to
[`markdown::markdownToHTML()`](https://rdrr.io/pkg/markdown/man/renderMarkdown.html)
to create a glue vector of HTML fragments. Primarily used to test that
`md_*()` functions create vectors that meet the GFM spec and can be
rendered as HTML.

## Usage

``` r
md_convert(x, frag = TRUE, disallow = TRUE)
```

## Arguments

- x:

  A character vector of *markdown* text to be converted.

- frag:

  logical; Whether only a single HTML fragment should be returned.
  `TRUE` by default.

- disallow:

  logical; Should
  [`md_disallow()`](https://k5cents.github.io/gluedown/reference/md_disallow.md)
  be called on the converted output?

## Value

A `glue` vector of length 1 containing HTML tags.

## Details

GFM enables the `tagfilter` extension, where the following HTML tags
will be filtered when rendering HTML output...

## See also

Other inline functions:
[`md_autolink()`](https://k5cents.github.io/gluedown/reference/md_autolink.md),
[`md_bold()`](https://k5cents.github.io/gluedown/reference/md_bold.md),
[`md_code()`](https://k5cents.github.io/gluedown/reference/md_code.md),
[`md_disallow()`](https://k5cents.github.io/gluedown/reference/md_disallow.md),
[`md_escape()`](https://k5cents.github.io/gluedown/reference/md_escape.md),
[`md_hardline()`](https://k5cents.github.io/gluedown/reference/md_hardline.md),
[`md_image()`](https://k5cents.github.io/gluedown/reference/md_image.md),
[`md_issue()`](https://k5cents.github.io/gluedown/reference/md_issue.md),
[`md_italic()`](https://k5cents.github.io/gluedown/reference/md_italic.md),
[`md_link()`](https://k5cents.github.io/gluedown/reference/md_link.md),
[`md_softline()`](https://k5cents.github.io/gluedown/reference/md_softline.md),
[`md_strike()`](https://k5cents.github.io/gluedown/reference/md_strike.md),
[`md_text()`](https://k5cents.github.io/gluedown/reference/md_text.md)

## Examples

``` r
md_convert(x = md_bold("test"))
#> <p><strong>test</strong></p>
#> 
```
