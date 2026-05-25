# Markdown soft line breaks

Take a character vector and return a glue vector of separated by a
single newline. This inline is rendered as single `<p>` HTML tags.

## Usage

``` r
md_softline(...)
```

## Arguments

- ...:

  Any number of character vectors.

## Value

A `glue` vector with elements of `...` separated by a single newline.

## Details

A regular line break (not in a code span or HTML tag) that is not
preceded by two or more spaces or a backslash is parsed as a softbreak.
(A softbreak may be rendered in HTML either as a line ending or as a
space. The result will be the same in browsers. In the examples here, a
line ending will be used.)

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
[`md_link()`](https://k5cents.github.io/gluedown/reference/md_link.md),
[`md_strike()`](https://k5cents.github.io/gluedown/reference/md_strike.md),
[`md_text()`](https://k5cents.github.io/gluedown/reference/md_text.md)

## Examples

``` r
# compare the following
md_bold(c("One", "Two"))
#> **One**
#> **Two**

md_softline(md_bold(c("One", "Two")))
#> **One**
#> **Two**
```
