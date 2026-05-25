# Markdown blank line

Create a blank line between other markdown block-level elements.

## Usage

``` r
md_blank()
```

## Value

A `glue` vector of length one containing two newline characters.

## Details

Blank lines between block-level elements are ignored, except for the
role they play in determining whether a list is tight or loose.

Blank lines at the beginning and end of the document are also ignored.

## See also

Other leaf block functions:
[`md_chunk()`](https://k5cents.github.io/gluedown/reference/md_chunk.md),
[`md_fence()`](https://k5cents.github.io/gluedown/reference/md_fence.md),
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
md_blank
#> function () 
#> {
#>     glue::glue("\n")
#> }
#> <bytecode: 0x55c765d5c7f0>
#> <environment: namespace:gluedown>
```
