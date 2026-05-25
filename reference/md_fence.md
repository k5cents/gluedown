# Markdown fenced code block

Turn a character vector of lines into a single code block with lines
bookended with a code fence of backticks or tildes. This markdown leaf
block can be rendered as HTML `<code>` tags inside `<pre>` tags.

## Usage

``` r
md_fence(x, char = c("`", "~"), info = "r")
```

## Arguments

- x:

  A character vector of lines to be wrapped concatenated into a single
  block, possibly created by possibly created by
  [`readLines()`](https://rdrr.io/r/base/readLines.html) or
  [`deparse()`](https://rdrr.io/r/base/deparse.html).

- char:

  The character to use in the code fence; either backtick characters...
  or tildes (`~`). Defaults to backticks.

- info:

  The info string text to follow the initial code fence, typically a
  code for the language of the lines of `x`. Defaults to `r`.

## Value

A character vector wrapped on either side by code fences.

## Details

A code fence is a sequence of at least three consecutive backtick
characters ... or tildes (`~`). (Tildes and backticks cannot be mixed.)
A fenced code block begins with a code fence, indented no more than
three spaces.

The line with the opening code fence may optionally contain some text
following the code fence; this is trimmed of leading and trailing
whitespace and called the info string...

The content of the code block consists of all subsequent lines, until a
closing code fence of the same type as the code block began with
(backticks or tildes), and with at least as many backticks or tildes as
the opening code fence...

A fenced code block may interrupt a paragraph, and does not require a
blank line either before or after.

The content of a code fence is treated as literal text, not parsed as
inlines. The first word of the info string is typically used to specify
the language of the code sample, and rendered in the class attribute of
the code tag. However, this spec does not mandate any particular
treatment of the info string (see the `info` argument).

## See also

Other leaf block functions:
[`md_blank()`](https://k5cents.github.io/gluedown/reference/md_blank.md),
[`md_chunk()`](https://k5cents.github.io/gluedown/reference/md_chunk.md),
[`md_heading()`](https://k5cents.github.io/gluedown/reference/md_heading.md),
[`md_indent()`](https://k5cents.github.io/gluedown/reference/md_indent.md),
[`md_label()`](https://k5cents.github.io/gluedown/reference/md_label.md),
[`md_paragraph()`](https://k5cents.github.io/gluedown/reference/md_paragraph.md),
[`md_reference()`](https://k5cents.github.io/gluedown/reference/md_reference.md),
[`md_rule()`](https://k5cents.github.io/gluedown/reference/md_rule.md),
[`md_setext()`](https://k5cents.github.io/gluedown/reference/md_setext.md),
[`md_table()`](https://k5cents.github.io/gluedown/reference/md_table.md)

## Examples

``` r
md_fence(deparse(sd))
#> ```r
#> function (x, na.rm = FALSE) 
#> sqrt(var(if (is.vector(x) || is.factor(x)) x else as.double(x), 
#>     na.rm = na.rm))
#> ```
md_fence(c("library(dplyr)", "starwars %>%", "  filter(species == 'Droid')"))
#> ```r
#> library(dplyr)
#> starwars %>%
#>   filter(species == 'Droid')
#> ```
```
