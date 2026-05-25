# Markdown code span

Take a character vector and wrap each element in backticks to create a
glue vector of inline code spans. This inline is rendered as a `<code>`
HTML tag.

## Usage

``` r
md_code(x)
```

## Arguments

- x:

  The text to be formatted as fixed-width inline code.

## Value

A `glue` vector of length equal to `x`.

## Details

A backtick string is a string of one or more backtick characters that is
neither preceded nor followed by a backtick.

A code span begins with a backtick string and ends with a backtick
string of equal length. The contents of the code span are the characters
between the two backtick strings, normalized in the following ways: \*
First, line endings are converted to spaces. \* If the resulting string
both begins and ends with a space character, but does not consist
entirely of space characters, a single space character is removed from
the front and back. This allows you to include code that begins or ends
with backtick characters, which must be separated by whitespace from the
opening or closing backtick strings.

## See also

Other inline functions:
[`md_autolink()`](https://k5cents.github.io/gluedown/reference/md_autolink.md),
[`md_bold()`](https://k5cents.github.io/gluedown/reference/md_bold.md),
[`md_convert()`](https://k5cents.github.io/gluedown/reference/md_convert.md),
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
md_code("ex_var")
#> `ex_var`
md_code(state.name[1:3])
#> `Alabama`
#> `Alaska`
#> `Arizona`
```
