# Markdown autolink

Take a character vector and wrap each element in `<` and `>` to return a
glue vector of autolink text. This inline is rendered as the `<href>`
HTML tag.

## Usage

``` r
md_autolink(url)
```

## Arguments

- url:

  A character vector of absolute URLs.

## Value

A `glue` vector of length equal to `x`.

## Details

Autolinks are absolute URIs and email addresses inside `<` and `>`. They
are parsed as links, with the URL or email address as the link label.

A URI autolink consists of `<`, followed by an absolute URI followed by
`>`. It is parsed as a link to the URI, with the URI as the link’s
label.

An absolute URI, for these purposes, consists of a scheme followed by a
colon (`:`) followed by zero or more characters other than ASCII
whitespace and control characters, `<`, and `>`. If the URI includes
these characters, they must be percent-encoded (e.g. `%20` for a space).

For purposes of this spec, a scheme is any sequence of 2–32 characters
beginning with an ASCII letter and followed by any combination of ASCII
letters, digits, or the symbols plus (”+”), period (”.”), or hyphen
(”-”).

## See also

Other inline functions:
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
[`md_strike()`](https://k5cents.github.io/gluedown/reference/md_strike.md),
[`md_text()`](https://k5cents.github.io/gluedown/reference/md_text.md)

## Examples

``` r
md_autolink("http://foo.bar.baz")
#> <http://foo.bar.baz>
```
