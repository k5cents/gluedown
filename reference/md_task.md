# Markdown task list (extension)

take a character vector and return a glue vector of valid bullet list
items. When printed together, these bullet list items create a bullet
list. This container block is rendered as the `<ul>` HTML tag, with each
element of the vector creating a separate `<li>` tag. On venues
supporting GitHub Flavored Markdown, this list will be specially
rendered with the list item market replaces with a
`<input type="checkbox">` HTML tag.

## Usage

``` r
md_task(x, check = NULL)
```

## Arguments

- x:

  A character vector of task list items.

- check:

  A optional numeric vector of list elements which should be checked
  off.

## Value

A `glue` vector with length equal to `x`.

## Details

GFM enables the tasklist extension, where an additional processing step
is performed on list items.

A task list item is a list item where the first block in it is a
paragraph which begins with a task list item marker and at least one
whitespace character before any other content.

A task list item marker consists of an optional number of spaces, a left
bracket, either a whitespace character or the letter `x` in either
lowercase or uppercase, and then a right bracket.

When rendered, the task list item marker is replaced with a semantic
checkbox element; in an HTML output, this would be an
`<input type="checkbox">` element.

If the character between the brackets is a whitespace character, the
checkbox is unchecked. Otherwise, the checkbox is checked.

This spec does not define how the checkbox elements are interacted with:
in practice, implementors are free to render the checkboxes as disabled
or inmutable elements, or they may dynamically handle dynamic
interactions (i.e. checking, unchecking) in the final rendered document.

## See also

Other container block functions:
[`md_bullet()`](https://k5cents.github.io/gluedown/reference/md_bullet.md),
[`md_list()`](https://k5cents.github.io/gluedown/reference/md_list.md),
[`md_order()`](https://k5cents.github.io/gluedown/reference/md_order.md),
[`md_quote()`](https://k5cents.github.io/gluedown/reference/md_quote.md)

## Examples

``` r
md_task(c("Wake up", "Eat Breakfast", "Brush Teeth"), check = c(1, 3))
#> * [x] Wake up
#> * [ ] Eat Breakfast
#> * [x] Brush Teeth
```
