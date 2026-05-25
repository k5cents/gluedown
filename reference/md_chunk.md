# Markdown code block

Take a character vector of lines and return a glue vector

## Usage

``` r
md_chunk(x, type = c("tick", "tilde", "indent"), ...)
```

## Arguments

- x:

  A character vector of lines to be wrapped concatenated into a single
  block, possibly created by
  [`readLines()`](https://rdrr.io/r/base/readLines.html) or
  [`deparse()`](https://rdrr.io/r/base/deparse.html).

- type:

  The type of code block to be created. Either "tick", "tilde" (which
  call
  [`md_fence()`](https://k5cents.github.io/gluedown/reference/md_fence.md))
  or "indent" (which calls
  [`md_indent()`](https://k5cents.github.io/gluedown/reference/md_indent.md)).

- ...:

  Arguments to be passed to
  [`md_fence()`](https://k5cents.github.io/gluedown/reference/md_fence.md)
  or
  [`md_indent()`](https://k5cents.github.io/gluedown/reference/md_indent.md).

## Value

A `glue` object of length 1, with elements of `x` formatted via
[`md_fence()`](https://k5cents.github.io/gluedown/reference/md_fence.md)
or
[`md_indent()`](https://k5cents.github.io/gluedown/reference/md_indent.md).

## Details

Turn a character vector of lines into a single code block either
indented or fenced in tildes or backticks. This markdown leaf block can
be rendered as nested HTML `<code>` and `<pre>` tags. This function
either calls
[`md_fence()`](https://k5cents.github.io/gluedown/reference/md_fence.md)
or
[`md_indent()`](https://k5cents.github.io/gluedown/reference/md_indent.md)
based on the `type` argument.

## See also

Other leaf block functions:
[`md_blank()`](https://k5cents.github.io/gluedown/reference/md_blank.md),
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
md_chunk("$ sudo apt install r-base-dev", info = "bash")
#> ```bash
#> $ sudo apt install r-base-dev
#> ```
md_indent(
  n = c(4, 4, 6),
  x = c(
    "library(dplyr)",
    "starwars %>%",
    "filter(species == 'Droid')"
  )
)
#>     library(dplyr)
#>     starwars %>%
#>       filter(species == 'Droid')
```
