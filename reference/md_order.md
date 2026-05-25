# Markdown ordered list

take a character vector and return a glue vector of valid ordered list
items. When printed together, these ordered list items create a ordered
list. This container block is rendered as the `<ol>` HTML tag, with each
element of the vector creating a separate `<li>` tag.

## Usage

``` r
md_order(x, marker = c(".", ")"), seq = TRUE, pad = TRUE)
```

## Arguments

- x:

  The vector of numbered list items.

- marker:

  The ordered list marker following each arabic digits; either `.` or
  `)`.

- seq:

  logical; Should sequential numbers be used? Defaults to `TRUE`. If
  `FALSE`, each element will be preceded by the number one; many
  markdown engines will automatically render repeated ones as a
  sequential list.

- pad:

  logical; If sequential numbers are used, should they be padded with
  zeroes on the left to match the width of the greatest number? Defaults
  to `TRUE`.

## Value

A `glue` vector with length equal to `x`.

## Details

A list is a sequence of one or more list items of the same type. The
list items may be separated by any number of blank lines.

Two list items are of the same type if they begin with a list marker of
the same type. Two list markers are of the same type if (b) they are
ordered list numbers with the same delimiter (either `.` or `)`).

A list is an ordered list if its constituent list items begin with
ordered list markers, and a bullet list if its constituent list items
begin with bullet list markers.

The start number of an ordered list is determined by the list number of
its initial list item. The numbers of subsequent list items are
disregarded.

## See also

Other container block functions:
[`md_bullet()`](https://k5cents.github.io/gluedown/reference/md_bullet.md),
[`md_list()`](https://k5cents.github.io/gluedown/reference/md_list.md),
[`md_quote()`](https://k5cents.github.io/gluedown/reference/md_quote.md),
[`md_task()`](https://k5cents.github.io/gluedown/reference/md_task.md)

## Examples

``` r
md_order(state.name[1:5])
#> 1. Alabama
#> 2. Alaska
#> 3. Arizona
#> 4. Arkansas
#> 5. California
md_order(sample(state.name, 5), marker = ")")
#> 1) Mississippi
#> 2) Iowa
#> 3) Illinois
#> 4) Alaska
#> 5) Texas
md_order(sample(state.name, 5), seq = FALSE)
#> 1. Texas
#> 1. California
#> 1. Massachusetts
#> 1. Utah
#> 1. North Dakota
```
