# Markdown paragraphs breaks

Take a character vector and return a glue vector of paragraphs separated
by double newlines. This leaf block is rendered as distinct `<p>` HTML
tags.

## Usage

``` r
md_paragraph(...)
```

## Arguments

- ...:

  Any number of character vectors.

## Value

A `glue` vector with elements of `...` separated by two newlines.

## Details

A sequence of non-blank lines that cannot be interpreted as other kinds
of blocks forms a paragraph. The contents of the paragraph are the
result of parsing the paragraph’s raw content as inlines. The
paragraph’s raw content is formed by concatenating the lines and
removing initial and final whitespace... Paragraphs can contain multiple
lines, but no blank lines.

## See also

Other leaf block functions:
[`md_blank()`](https://k5cents.github.io/gluedown/reference/md_blank.md),
[`md_chunk()`](https://k5cents.github.io/gluedown/reference/md_chunk.md),
[`md_fence()`](https://k5cents.github.io/gluedown/reference/md_fence.md),
[`md_heading()`](https://k5cents.github.io/gluedown/reference/md_heading.md),
[`md_indent()`](https://k5cents.github.io/gluedown/reference/md_indent.md),
[`md_label()`](https://k5cents.github.io/gluedown/reference/md_label.md),
[`md_reference()`](https://k5cents.github.io/gluedown/reference/md_reference.md),
[`md_rule()`](https://k5cents.github.io/gluedown/reference/md_rule.md),
[`md_setext()`](https://k5cents.github.io/gluedown/reference/md_setext.md),
[`md_table()`](https://k5cents.github.io/gluedown/reference/md_table.md)

## Examples

``` r
md_paragraph(stringr::sentences[1:3])
#> The birch canoe slid on the smooth planks.
#> 
#> Glue the sheet to the dark blue background.
#> 
#> It's easy to tell the depth of a well.
#> 
```
