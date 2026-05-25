# Markdown italic emphasis

Take a character vector and wrap each element in single underscores to
create a glue vector of italic emphasis text. This inline is rendered as
the `<em>` HTML tag.

## Usage

``` r
md_italic(x)
```

## Arguments

- x:

  The text to be emphasized in italics.

## Value

A `glue` vector of length equal to `x`.

## Details

A single `*` or `_` can open or close emphasis... Emphasis begins with a
delimiter that can open emphasis and ends with a delimiter that can
close emphasis, and that uses the same character (`_` or `*`) as the
opening delimiter.

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
[`md_link()`](https://k5cents.github.io/gluedown/reference/md_link.md),
[`md_softline()`](https://k5cents.github.io/gluedown/reference/md_softline.md),
[`md_strike()`](https://k5cents.github.io/gluedown/reference/md_strike.md),
[`md_text()`](https://k5cents.github.io/gluedown/reference/md_text.md)

## Examples

``` r
md_italic("Example")
#> _Example_
md_italic(state.name)
#> _Alabama_
#> _Alaska_
#> _Arizona_
#> _Arkansas_
#> _California_
#> _Colorado_
#> _Connecticut_
#> _Delaware_
#> _Florida_
#> _Georgia_
#> _Hawaii_
#> _Idaho_
#> _Illinois_
#> _Indiana_
#> _Iowa_
#> _Kansas_
#> _Kentucky_
#> _Louisiana_
#> _Maine_
#> _Maryland_
#> _Massachusetts_
#> _Michigan_
#> _Minnesota_
#> _Mississippi_
#> _Missouri_
#> _Montana_
#> _Nebraska_
#> _Nevada_
#> _New Hampshire_
#> _New Jersey_
#> _New Mexico_
#> _New York_
#> _North Carolina_
#> _North Dakota_
#> _Ohio_
#> _Oklahoma_
#> _Oregon_
#> _Pennsylvania_
#> _Rhode Island_
#> _South Carolina_
#> _South Dakota_
#> _Tennessee_
#> _Texas_
#> _Utah_
#> _Vermont_
#> _Virginia_
#> _Washington_
#> _West Virginia_
#> _Wisconsin_
#> _Wyoming_
```
