# Markdown block quotes

Take a character vector and prepend each element in a greater-than
symbol to create a glue vector of block quote markdown text. This inline
is rendered as a `<blockquote>` HTML tag.

## Usage

``` r
md_quote(x)
```

## Arguments

- x:

  The character vector of quotes.

## Value

A character vector with a greater-than symbol (`>`) prepended to each
element.

## Details

A block quote marker consists of 0-3 spaces of initial indent, plus (a)
the character `>` together with a following space, or (b) a single
character `>` not followed by a space.

The following rules define block quotes:

1.  **Basic case.** If a string of lines *Ls* constitute a sequence of
    blocks *Bs*, then the result of prepending a block quote marker to
    the beginning of each line in *Ls* is a block quote containing *Bs*.

2.  **Laziness.** If a string of lines *Ls* constitute a block quote
    with contents *Bs*, then the result of deleting the initial block
    quote marker from one or more lines in which the next non-whitespace
    character after the block quote marker is paragraph continuation
    text is a block quote with *Bs* as its content. Paragraph
    continuation text is text that will be parsed as part of the content
    of a paragraph, but does not occur at the beginning of the
    paragraph.

3.  **Consecutiveness.** A document cannot contain two block quotes in a
    row unless there is a blank line between them.

Nothing else counts as a block quote.

## See also

Other container block functions:
[`md_bullet()`](https://k5cents.github.io/gluedown/reference/md_bullet.md),
[`md_list()`](https://k5cents.github.io/gluedown/reference/md_list.md),
[`md_order()`](https://k5cents.github.io/gluedown/reference/md_order.md),
[`md_task()`](https://k5cents.github.io/gluedown/reference/md_task.md)

## Examples

``` r
md_quote("Give me liberty, or give me death!")
#> > Give me liberty, or give me death!
md_quote(stringr::sentences[1:3])
#> > The birch canoe slid on the smooth planks.
#> > Glue the sheet to the dark blue background.
#> > It's easy to tell the depth of a well.
```
