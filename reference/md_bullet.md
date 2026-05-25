# Markdown bullet list

take a character vector and return a glue vector of valid bullet list
items. When printed together, these bullet list items create a bullet
list. This container block is rendered as the `<ul>` HTML tag, with each
element of the vector creating a separate `<li>` tag.

## Usage

``` r
md_bullet(x, marker = c("*", "-", "+"))
```

## Arguments

- x:

  The vector of bullet point list items.

- marker:

  The bullet list marker to use; one of `-`, `+`, or `*`.

## Value

A `glue` vector with length equal to `x`.

## Details

A list is a sequence of one or more list items of the same type. The
list items may be separated by any number of blank lines.

Two list items are of the same type if they begin with a list marker of
the same type. Two list markers are of the same type if (a) they are
bullet list markers using the same character (`-`, `+`, or `*`)...

## See also

Other container block functions:
[`md_list()`](https://k5cents.github.io/gluedown/reference/md_list.md),
[`md_order()`](https://k5cents.github.io/gluedown/reference/md_order.md),
[`md_quote()`](https://k5cents.github.io/gluedown/reference/md_quote.md),
[`md_task()`](https://k5cents.github.io/gluedown/reference/md_task.md)

## Examples

``` r
md_bullet(state.name[1:5])
#> * Alabama
#> * Alaska
#> * Arizona
#> * Arkansas
#> * California
md_bullet(sample(state.name, 5), marker = "+")
#> + Vermont
#> + Minnesota
#> + Idaho
#> + Oregon
#> + Pennsylvania
```
