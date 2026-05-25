# Markdown image links

Take character vectors of alternative text, image link destinations, and
optional titles and return single glue vector of valid markdown inline
image links. This inline is rendered as the `<img>` HTML tag. Note that
the expected arguments of `md_image()` are reversed from
[`md_link()`](https://k5cents.github.io/gluedown/reference/md_link.md)

## Usage

``` r
md_image(url, alt = "", title = NULL, ..., .name = FALSE, wrap = FALSE)
```

## Arguments

- url:

  A character vector of link destination (URL) strings.

- alt:

  A character vector of alternative text that can be used to refer to an
  image.

- title:

  The optional title of the link.

- ...:

  A sequence of `alt = "/url"` named vector pairs. If any such pairs are
  provided, `.name` will be considered `TRUE`.

- .name:

  logical; if `TRUE`, the pairs in `...` will be used instead of any
  values supplied to `x` and `url`.

- wrap:

  logical; if `TRUE`, the URL is wrapped in angle brackets (`<url>`),
  which is required when the destination contains spaces.

## Value

A `glue` vector of collapsed alternative text and associated URLs.

## Details

Syntax for images is like the syntax for links, with one difference.
Instead of link text, we have an image description. The rules for this
are the same as for link text, except that (a) an image description
starts with `![` rather than `[`, and (b) an image description may
contain links. An image description has inline elements as its contents.
When an image is rendered to HTML, this is standardly used as the
image’s `alt` attribute.

## See also

Other inline functions:
[`md_autolink()`](https://k5cents.github.io/gluedown/reference/md_autolink.md),
[`md_bold()`](https://k5cents.github.io/gluedown/reference/md_bold.md),
[`md_code()`](https://k5cents.github.io/gluedown/reference/md_code.md),
[`md_convert()`](https://k5cents.github.io/gluedown/reference/md_convert.md),
[`md_disallow()`](https://k5cents.github.io/gluedown/reference/md_disallow.md),
[`md_escape()`](https://k5cents.github.io/gluedown/reference/md_escape.md),
[`md_hardline()`](https://k5cents.github.io/gluedown/reference/md_hardline.md),
[`md_issue()`](https://k5cents.github.io/gluedown/reference/md_issue.md),
[`md_italic()`](https://k5cents.github.io/gluedown/reference/md_italic.md),
[`md_link()`](https://k5cents.github.io/gluedown/reference/md_link.md),
[`md_softline()`](https://k5cents.github.io/gluedown/reference/md_softline.md),
[`md_strike()`](https://k5cents.github.io/gluedown/reference/md_strike.md),
[`md_text()`](https://k5cents.github.io/gluedown/reference/md_text.md)

## Examples

``` r
if (file.exists("man/figures/logo.png")) md_image("man/figures/logo.png")
md_image("http://hexb.in/hexagons/eff.png")
#> ![](http://hexb.in/hexagons/eff.png)
md_image(EFF = "http://hexb.in/hexagons/eff.png")
#> ![EFF](http://hexb.in/hexagons/eff.png)
md_image("http://hexb.in/hexagons/eff.png", "EFF Hex Sticker", "Logo")
#> ![EFF Hex Sticker](http://hexb.in/hexagons/eff.png "Logo")
```
