# Markdown GitHub issue

Take a character vector and numeric vector and concatenate them into a
glue vector of valid GitHub issue autolinks (username/repo#issue).

## Usage

``` r
md_issue(repo, num)
```

## Arguments

- repo:

  A character vector in the format `"user/rep"`.

- num:

  The issue or pull number *without* hash symbol.

## Value

A character vector which GitHub can automatically hyperlink.

## Details

Within conversations on GitHub, references to issues and pull requests
are [automatically converted to shortened links](https://git.io/Jvtb9).

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
[`md_italic()`](https://k5cents.github.io/gluedown/reference/md_italic.md),
[`md_link()`](https://k5cents.github.io/gluedown/reference/md_link.md),
[`md_softline()`](https://k5cents.github.io/gluedown/reference/md_softline.md),
[`md_strike()`](https://k5cents.github.io/gluedown/reference/md_strike.md),
[`md_text()`](https://k5cents.github.io/gluedown/reference/md_text.md)

Other markdown extensions:
[`md_strike()`](https://k5cents.github.io/gluedown/reference/md_strike.md),
[`md_table()`](https://k5cents.github.io/gluedown/reference/md_table.md)

## Examples

``` r
md_issue("k5cents/gluedown", 1:5)
#> k5cents/gluedown#1
#> k5cents/gluedown#2
#> k5cents/gluedown#3
#> k5cents/gluedown#4
#> k5cents/gluedown#5
```
