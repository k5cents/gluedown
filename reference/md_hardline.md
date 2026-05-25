# Markdown hard line breaks

Take a character vector and return a collapsed glue vector with each
original element separated by two spaces and a newline. This inline is
rendered with a `<br />` HTML tag.

## Usage

``` r
md_hardline(..., method = c("spaces", "backslash"))
```

## Arguments

- ...:

  Any number of character vectors.

- method:

  The syntax used to create the hard line break: `"spaces"` appends two
  trailing spaces before the newline (default); `"backslash"` appends a
  backslash before the newline.

## Value

A `glue` vector with elements of `...` separated by a hard line break
and a single newline.

## Details

A line break (not in a code span or HTML tag) that is preceded by two or
more spaces and does not occur at the end of a block is parsed as a hard
line break (rendered in HTML as a `<br />` tag). CommonMark also
supports a backslash before a line ending as an alternative hard line
break syntax.

## See also

Other inline functions:
[`md_autolink()`](https://k5cents.github.io/gluedown/reference/md_autolink.md),
[`md_bold()`](https://k5cents.github.io/gluedown/reference/md_bold.md),
[`md_code()`](https://k5cents.github.io/gluedown/reference/md_code.md),
[`md_convert()`](https://k5cents.github.io/gluedown/reference/md_convert.md),
[`md_disallow()`](https://k5cents.github.io/gluedown/reference/md_disallow.md),
[`md_escape()`](https://k5cents.github.io/gluedown/reference/md_escape.md),
[`md_image()`](https://k5cents.github.io/gluedown/reference/md_image.md),
[`md_issue()`](https://k5cents.github.io/gluedown/reference/md_issue.md),
[`md_italic()`](https://k5cents.github.io/gluedown/reference/md_italic.md),
[`md_link()`](https://k5cents.github.io/gluedown/reference/md_link.md),
[`md_softline()`](https://k5cents.github.io/gluedown/reference/md_softline.md),
[`md_strike()`](https://k5cents.github.io/gluedown/reference/md_strike.md),
[`md_text()`](https://k5cents.github.io/gluedown/reference/md_text.md)

## Examples

``` r
# compare the following
md_bold(c("One", "Two"))
#> **One**
#> **Two**
md_hardline(md_bold(c("One", "Two")), md_italic("Three"))
#> **One**  
#> **Two**  
#> _Three_  
md_hardline("foo", "bar", method = "backslash")
#> foo\
#> bar\
```
