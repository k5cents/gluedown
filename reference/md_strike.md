# Markdown strikethrough (extension)

Take a character vector and wrap each element in tildes to create a glue
vector of strikethrough text. This inline is rendered as the `<strike>`
HTML tag.

## Usage

``` r
md_strike(x)
```

## Arguments

- x:

  A character vector of text to be striked through.

## Value

A `glue` vector of length equal to `x`.

## Details

GFM enables the strikethrough extension, where an additional emphasis
type is available. Strikethrough text is any text wrapped in two tildes
(`~`).

## See also

Other inline functions:
[`md_autolink()`](https://k5cents.github.io/gluedown/reference/md_autolink.md),
[`md_bold()`](https://k5cents.github.io/gluedown/reference/md_bold.md),
[`md_code()`](https://k5cents.github.io/gluedown/reference/md_code.md),
[`md_convert()`](https://k5cents.github.io/gluedown/reference/md_convert.md),
[`md_disallow()`](https://k5cents.github.io/gluedown/reference/md_disallow.md),
[`md_escape()`](https://k5cents.github.io/gluedown/reference/md_escape.md),
[`md_hardline()`](https://k5cents.github.io/gluedown/reference/md_hardline.md),
[`md_image()`](https://k5cents.github.io/gluedown/reference/md_image.md),
[`md_issue()`](https://k5cents.github.io/gluedown/reference/md_issue.md),
[`md_italic()`](https://k5cents.github.io/gluedown/reference/md_italic.md),
[`md_link()`](https://k5cents.github.io/gluedown/reference/md_link.md),
[`md_softline()`](https://k5cents.github.io/gluedown/reference/md_softline.md),
[`md_text()`](https://k5cents.github.io/gluedown/reference/md_text.md)

Other markdown extensions:
[`md_issue()`](https://k5cents.github.io/gluedown/reference/md_issue.md),
[`md_table()`](https://k5cents.github.io/gluedown/reference/md_table.md)

## Examples

``` r
md_strike("Example")
#> ~~Example~~
md_strike(state.name[1:3])
#> ~~Alabama~~
#> ~~Alaska~~
#> ~~Arizona~~
```
