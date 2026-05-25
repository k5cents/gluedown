# Markdown indented code block

Turn a character vector of lines into a single code block with each line
indented four spaces. This markdown leaf block can be rendered as nested
HTML `<code>` and `<pre>` tags. This is the code block format required
by legacy Reddit-flavored Markdown.

## Usage

``` r
md_indent(x, n = 4)
```

## Arguments

- x:

  A character vector of lines to be wrapped concatenated into a single
  block, possibly created by
  [`readLines()`](https://rdrr.io/r/base/readLines.html) or
  [`deparse()`](https://rdrr.io/r/base/deparse.html).

- n:

  A numeric vector

## Value

A `glue` object of length 1, with the elements of `x` preceded with 4
spaces and separated by a newline.

## Details

An indented code block is composed of one or more indented chunks
separated by blank lines. An indented chunk is a sequence of non-blank
lines, each indented four or more spaces. The contents of the code block
are the literal contents of the lines, including trailing line endings,
minus four spaces of indentation. An indented code block has no info
string.

## See also

Other leaf block functions:
[`md_blank()`](https://k5cents.github.io/gluedown/reference/md_blank.md),
[`md_chunk()`](https://k5cents.github.io/gluedown/reference/md_chunk.md),
[`md_fence()`](https://k5cents.github.io/gluedown/reference/md_fence.md),
[`md_heading()`](https://k5cents.github.io/gluedown/reference/md_heading.md),
[`md_label()`](https://k5cents.github.io/gluedown/reference/md_label.md),
[`md_paragraph()`](https://k5cents.github.io/gluedown/reference/md_paragraph.md),
[`md_reference()`](https://k5cents.github.io/gluedown/reference/md_reference.md),
[`md_rule()`](https://k5cents.github.io/gluedown/reference/md_rule.md),
[`md_setext()`](https://k5cents.github.io/gluedown/reference/md_setext.md),
[`md_table()`](https://k5cents.github.io/gluedown/reference/md_table.md)

## Examples

``` r
md_indent(deparse(md_bold))
#>     function (x) 
#>     {
#>         glue::glue("**{x}**")
#>     }
```
