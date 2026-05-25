# Markdown bold emphasis

Take a character vector and wrap each element in double asterisks to
create a glue vector of bold emphasis text. This inline is rendered as
the `<stong>` HTML tag.

## Usage

``` r
md_bold(x)
```

## Arguments

- x:

  The text to be emphasized in bold.

## Value

A `glue` vector of length equal to `x`.

## Details

A double `**` or `__` can open or close emphasis... Emphasis begins with
a delimiter that can open emphasis and ends with a delimiter that can
close emphasis, and that uses the same character (`__` or `**`) as the
opening delimiter.

## See also

Other inline functions:
[`md_autolink()`](https://k5cents.github.io/gluedown/reference/md_autolink.md),
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
[`md_strike()`](https://k5cents.github.io/gluedown/reference/md_strike.md),
[`md_text()`](https://k5cents.github.io/gluedown/reference/md_text.md)

## Examples

``` r
md_bold("Example")
#> **Example**
md_bold(state.name)
#> **Alabama**
#> **Alaska**
#> **Arizona**
#> **Arkansas**
#> **California**
#> **Colorado**
#> **Connecticut**
#> **Delaware**
#> **Florida**
#> **Georgia**
#> **Hawaii**
#> **Idaho**
#> **Illinois**
#> **Indiana**
#> **Iowa**
#> **Kansas**
#> **Kentucky**
#> **Louisiana**
#> **Maine**
#> **Maryland**
#> **Massachusetts**
#> **Michigan**
#> **Minnesota**
#> **Mississippi**
#> **Missouri**
#> **Montana**
#> **Nebraska**
#> **Nevada**
#> **New Hampshire**
#> **New Jersey**
#> **New Mexico**
#> **New York**
#> **North Carolina**
#> **North Dakota**
#> **Ohio**
#> **Oklahoma**
#> **Oregon**
#> **Pennsylvania**
#> **Rhode Island**
#> **South Carolina**
#> **South Dakota**
#> **Tennessee**
#> **Texas**
#> **Utah**
#> **Vermont**
#> **Virginia**
#> **Washington**
#> **West Virginia**
#> **Wisconsin**
#> **Wyoming**
```
