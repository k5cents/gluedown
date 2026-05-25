# Disallow certain raw HTML

Take a character vector of raw HTML text (possibly via
[`md_convert()`](https://k5cents.github.io/gluedown/reference/md_convert.md))
and disallow certain tags by replacing `<` with `&lt;`.

## Usage

``` r
md_disallow(html)
```

## Arguments

- html:

  A character vector of *markdown* text to be converted.

## Value

A `glue` vector of length 1 containing HTML tags.

## Details

GFM enables the tagfilter extension, where the following HTML tags will
be filtered when rendering HTML output:

- `<title>`

- `<textarea>`

- `<style>`

- `<xmp>`

- `<iframe>`

- `<noembed>`

- `<noframes>`

- `<script>`

- `<plaintext>`

Filtering is done by replacing the leading `<` with the entity `&lt;`.
These tags are chosen in particular as they change how HTML is
interpreted in a way unique to them (i.e. nested HTML is interpreted
differently), and this is usually undesireable (sic) in the context of
other rendered Markdown content.

All other HTML tags are left untouched.

## See also

Other inline functions:
[`md_autolink()`](https://k5cents.github.io/gluedown/reference/md_autolink.md),
[`md_bold()`](https://k5cents.github.io/gluedown/reference/md_bold.md),
[`md_code()`](https://k5cents.github.io/gluedown/reference/md_code.md),
[`md_convert()`](https://k5cents.github.io/gluedown/reference/md_convert.md),
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
md_disallow("<title>GitHub Flavored Markdown Spec</title>")
#> &lt;title>GitHub Flavored Markdown Spec</title>
```
