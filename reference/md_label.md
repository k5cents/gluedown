# Markdown link label

Create the link labels that can latter be referred to with a link
reference from
[`md_reference()`](https://k5cents.github.io/gluedown/reference/md_reference.md).

## Usage

``` r
md_label(text, label = NULL, ..., .name = FALSE)
```

## Arguments

- text:

  The text in the document to be hyperlinked.

- label:

  A link label that is referenced elsewhere in the document. If `NULL`
  (the default), a collapsed reference link `[text][]` is produced.

- ...:

  A sequence of `label = "text"` named vector pairs. If any such pairs
  are provided, `.name` will be considered `TRUE`.

- .name:

  logical; if `TRUE`, the pairs in `...` will be used instead of any
  values supplied to `x` and `url`.

## Value

A single `glue` vector of length equal to that of `label` and `url`,
with elements the concatenated arguments.

## Details

A link label begins with a left bracket and ends with the first right
bracket that is not backslash-escaped. Between these brackets there must
be at least one non-whitespace character.

When `label` is omitted, a *collapsed reference link* (`[text][]`) is
produced. The link label is then implicitly the same as the link text
(matched case-insensitively), so a matching
[`md_reference()`](https://k5cents.github.io/gluedown/reference/md_reference.md)
definition must use the same text as its label.

## See also

Other leaf block functions:
[`md_blank()`](https://k5cents.github.io/gluedown/reference/md_blank.md),
[`md_chunk()`](https://k5cents.github.io/gluedown/reference/md_chunk.md),
[`md_fence()`](https://k5cents.github.io/gluedown/reference/md_fence.md),
[`md_heading()`](https://k5cents.github.io/gluedown/reference/md_heading.md),
[`md_indent()`](https://k5cents.github.io/gluedown/reference/md_indent.md),
[`md_paragraph()`](https://k5cents.github.io/gluedown/reference/md_paragraph.md),
[`md_reference()`](https://k5cents.github.io/gluedown/reference/md_reference.md),
[`md_rule()`](https://k5cents.github.io/gluedown/reference/md_rule.md),
[`md_setext()`](https://k5cents.github.io/gluedown/reference/md_setext.md),
[`md_table()`](https://k5cents.github.io/gluedown/reference/md_table.md)

## Examples

``` r
md_label(CRAN = "The CRAN website")
#> [The CRAN website][CRAN]
md_label(text = c("one", "two"), label = 1:2)
#> [one][1]
#> [two][2]
md_label("CRAN")
#> [CRAN][]
```
