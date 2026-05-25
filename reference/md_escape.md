# Backslash escape all punctuation

Take a character vector containing punctuation and return a glue vector
with every punctuation mark prepended with double escape backslashes.

## Usage

``` r
md_escape(x)
```

## Arguments

- x:

  A character vector of strings containing punctuation that might
  accidentally be considered markdown syntax.

## Value

A character string with all `[:punct:]` properly escaped with prepended
backslashes.

## Details

When trying to format text containing markdown syntax characters, it's
necessary to "escape" those characters so that they are ignored by
formatting.

Any ASCII punctuation character may be backslash-escaped... Escaped
characters are treated as regular characters and do not have their usual
Markdown meanings.

## See also

Other inline functions:
[`md_autolink()`](https://k5cents.github.io/gluedown/reference/md_autolink.md),
[`md_bold()`](https://k5cents.github.io/gluedown/reference/md_bold.md),
[`md_code()`](https://k5cents.github.io/gluedown/reference/md_code.md),
[`md_convert()`](https://k5cents.github.io/gluedown/reference/md_convert.md),
[`md_disallow()`](https://k5cents.github.io/gluedown/reference/md_disallow.md),
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
md_escape("# six seasons and a movie")
#> \# six seasons and a movie
```
