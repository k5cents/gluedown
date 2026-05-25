# Markdown ATX headings

Turn a character vector into a vector of valid markdown ATX headings.
These markdown leaf blocks can be rendered as the `<h1>` through `<h6>`
HTML tags. See
[`md_setext()`](https://k5cents.github.io/gluedown/reference/md_setext.md)
to create setext (underlined) headings.

## Usage

``` r
md_heading(x, level = 1)
```

## Arguments

- x:

  A character vector of heading text.

- level:

  A numeric vector of use to determine the number of heading hash
  characters to preceed each element of `x`. The heading level is equal
  to the number of `#` characters in the opening sequence.

## Value

A `glue` vector of headings with length equal to `x`.

## Details

An ATX heading consists of a string of characters, parsed as inline
content, between an opening sequence of 1–6 unescaped `#` characters and
an optional closing sequence of any number of unescaped `#` characters.
The opening sequence of `#` characters must be followed by a space or by
the end of line. The optional closing sequence of `#`s must be preceded
by a space and may be followed by spaces only. The opening \# character
may be indented 0-3 spaces. The raw contents of the heading are stripped
of leading and trailing spaces before being parsed as inline content.
The heading level is equal to the number of `#` characters in the
opening sequence.

## See also

Other leaf block functions:
[`md_blank()`](https://k5cents.github.io/gluedown/reference/md_blank.md),
[`md_chunk()`](https://k5cents.github.io/gluedown/reference/md_chunk.md),
[`md_fence()`](https://k5cents.github.io/gluedown/reference/md_fence.md),
[`md_indent()`](https://k5cents.github.io/gluedown/reference/md_indent.md),
[`md_label()`](https://k5cents.github.io/gluedown/reference/md_label.md),
[`md_paragraph()`](https://k5cents.github.io/gluedown/reference/md_paragraph.md),
[`md_reference()`](https://k5cents.github.io/gluedown/reference/md_reference.md),
[`md_rule()`](https://k5cents.github.io/gluedown/reference/md_rule.md),
[`md_setext()`](https://k5cents.github.io/gluedown/reference/md_setext.md),
[`md_table()`](https://k5cents.github.io/gluedown/reference/md_table.md)

## Examples

``` r
md_heading("Overview")
#> # Overview
md_heading(x = c("One", "Two"), level = 1:2)
#> # One
#> ## Two
md_heading(x = c("Installation", "Usage"), level = 2)
#> ## Installation
#> ## Usage
```
