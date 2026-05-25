# Markdown horizontal rule (4.1)

Create a glue vector of characters used to represent a *thematic break*.
This markdown leaf block is rendered as the `<hr>` HTML tag.

## Usage

``` r
md_rule(char = c("*", "-", "_"), n = 3, space = FALSE)
```

## Arguments

- char:

  The type of rule; either: `-`, `_`, or `*`. Defaults to `*`.

- n:

  The width of the rule; an integer indicating number of times to repeat
  each character. Defaults to the minimum of 3.

- space:

  logical or numeric; How many spaces to place between each `char`.
  Defaults to `FALSE`, which places 0 spaces.

## Value

A repeated-character `glue` vector with length 1.

## Details

A line consisting of 0-3 spaces of indentation, followed by a sequence
of three or more matching `-`, `_`, or `*` characters, each followed
optionally by any number of spaces or tabs, forms a thematic break.

## See also

Other leaf block functions:
[`md_blank()`](https://k5cents.github.io/gluedown/reference/md_blank.md),
[`md_chunk()`](https://k5cents.github.io/gluedown/reference/md_chunk.md),
[`md_fence()`](https://k5cents.github.io/gluedown/reference/md_fence.md),
[`md_heading()`](https://k5cents.github.io/gluedown/reference/md_heading.md),
[`md_indent()`](https://k5cents.github.io/gluedown/reference/md_indent.md),
[`md_label()`](https://k5cents.github.io/gluedown/reference/md_label.md),
[`md_paragraph()`](https://k5cents.github.io/gluedown/reference/md_paragraph.md),
[`md_reference()`](https://k5cents.github.io/gluedown/reference/md_reference.md),
[`md_setext()`](https://k5cents.github.io/gluedown/reference/md_setext.md),
[`md_table()`](https://k5cents.github.io/gluedown/reference/md_table.md)

## Examples

``` r
md_rule()
#> ***
md_rule("_")
#> ___
md_rule(n = 10)
#> **********
md_rule(space = TRUE)
#> * * *
```
