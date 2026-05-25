# Markdown generic list

Turn a character vector into a valid markdown list block. This is a
generic function that calls
[`md_bullet()`](https://k5cents.github.io/gluedown/reference/md_bullet.md),
[`md_order()`](https://k5cents.github.io/gluedown/reference/md_order.md),
or
[`md_task()`](https://k5cents.github.io/gluedown/reference/md_task.md)
depending on what string is provided in the `type` argument.

## Usage

``` r
md_list(x, type = c("bullet", "ordered", "task"), ...)
```

## Arguments

- x:

  A character vector of list items.

- type:

  The type of list to create; either bullet, ordered, or task.

- ...:

  Arguments passed to the appropriate list type function.

## Value

A `glue` vector with length equal to `x`.

## See also

Other container block functions:
[`md_bullet()`](https://k5cents.github.io/gluedown/reference/md_bullet.md),
[`md_order()`](https://k5cents.github.io/gluedown/reference/md_order.md),
[`md_quote()`](https://k5cents.github.io/gluedown/reference/md_quote.md),
[`md_task()`](https://k5cents.github.io/gluedown/reference/md_task.md)

## Examples

``` r
md_list(state.name[1:5], type = "bullet", marker = "+")
#> + Alabama
#> + Alaska
#> + Arizona
#> + Arkansas
#> + California
md_list(state.name[6:10], type = "ordered", marker = ")")
#> 1) Colorado
#> 2) Connecticut
#> 3) Delaware
#> 4) Florida
#> 5) Georgia
md_list(state.name[11:15], type = "task", check = 3:5)
#> * [ ] Hawaii
#> * [ ] Idaho
#> * [x] Illinois
#> * [x] Indiana
#> * [x] Iowa
```
