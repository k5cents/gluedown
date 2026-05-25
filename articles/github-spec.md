# GitHub Flavored Markdown

``` r

library(gluedown)
library(stringr)
library(rvest)
```

In this vignette, we will explore how the functions in `gluedown` enable
users to transition from R vectors to the kind of formatted markdown
text used in the GitHub Flavored Markdown (GFM) specification. Functions
like
[`md_bullet()`](https://k5cents.github.io/gluedown/reference/md_bullet.md)
and
[`md_quote()`](https://k5cents.github.io/gluedown/reference/md_quote.md)
may be used more often, but there are functions for practically every
section of the GFM spec including, some of which have limited practical
value (e.g.,
[`md_blank()`](https://k5cents.github.io/gluedown/reference/md_blank.md)
and
[`md_text()`](https://k5cents.github.io/gluedown/reference/md_text.md)).

In each section of this vignette, the GFM spec is quoted first and
followed by `gluedown` function usage. For each R code block containing
`gluedown` usage, the raw text is shows as `#>` comments followed by the
rendered HTML version, which is printed using the `results='asis'`
option of the `knitr` package. (To achieve this output, each block is
actually repeated twice, with the code of the second result printing
block hidden via `echo=FALSE`.)

## 3 Blocks and Inlines

> We can think of a document as a sequence of blocks—structural elements
> like paragraphs, block quotations, lists, headings, rules, and code
> blocks. Some blocks (like block quotes and list items) contain other
> blocks; others (like headings and paragraphs) contain inline
> content—text, links, emphasized text, images, code spans, and so on.

> We can divide blocks into two types: container blocks, which can
> contain other blocks, and leaf blocks, which cannot.

## 4 Leaf blocks

There are nine leaf block functions:

1.  [`md_rule()`](https://k5cents.github.io/gluedown/reference/md_rule.md)
2.  [`md_heading()`](https://k5cents.github.io/gluedown/reference/md_heading.md)
3.  [`md_setext()`](https://k5cents.github.io/gluedown/reference/md_setext.md)
4.  [`md_indent()`](https://k5cents.github.io/gluedown/reference/md_indent.md)
5.  [`md_fence()`](https://k5cents.github.io/gluedown/reference/md_fence.md)
6.  [`md_convert()`](https://k5cents.github.io/gluedown/reference/md_convert.md)
7.  [`md_reference()`](https://k5cents.github.io/gluedown/reference/md_reference.md)
8.  [`md_paragraph()`](https://k5cents.github.io/gluedown/reference/md_paragraph.md)
9.  [`md_blank()`](https://k5cents.github.io/gluedown/reference/md_blank.md)
10. [`md_table()`](https://k5cents.github.io/gluedown/reference/md_table.md)

### 4.1 Thematic breaks

> A line consisting of 0-3 spaces of indentation, followed by a sequence
> of three or more matching `-`, `_`, or `*` characters, each followed
> optionally by any number of spaces or tabs, forms a thematic break.

We can create thematic breaks with the
[`md_rule()`](https://k5cents.github.io/gluedown/reference/md_rule.md)
function, which allows users to define the type and number of valid
characters to use. All these options create the same `<hr>` HTML tag,
but look different in the underlying `.md` document.

``` r

md_rule()
#> ***
```

------------------------------------------------------------------------

``` r

md_rule(char = "-", n = 10, space = TRUE)
#> - - - - - - - - - -
```

------------------------------------------------------------------------

### 4.2 ATX Headings

> An ATX heading consists of a string of characters, parsed as inline
> content, between an opening sequence of 1–6 unescaped `#` characters
> and an optional closing sequence of any number of unescaped `#`
> characters… The raw contents of the heading are stripped of leading
> and trailing spaces before being parsed as inline content. The heading
> level is equal to the number of `#` characters in the opening
> sequence.

The heading for this section was created with
[`md_heading()`](https://k5cents.github.io/gluedown/reference/md_heading.md).

``` r

md_heading("4.2 ATX Headings", level = 3)
#> ### 4.2 ATX Headings
```

### 4.3 Setext headings

> A setext heading consists of one or more lines of text, each
> containing at least one non-whitespace character, with no more than 3
> spaces indentation, followed by a setext heading underline… A setext
> heading underline is a sequence of `=` characters or a sequence of `-`
> characters, with no more than 3 spaces indentation and any number of
> trailing spaces… The heading is a level 1 heading if `=` characters
> are used in the setext heading underline, and a level 2 heading if `-`
> characters are used.

I’m going to forgo printing these headings, just to preserve the
structure of this document. The
[`md_setext()`](https://k5cents.github.io/gluedown/reference/md_setext.md)
function can only be used to create level 1 (`<h1>`) and level 2
(`<h2>`) headings. A level 1 Setext heading is sometimes used as the
very first, initial title heading.

``` r

md_setext("Headings", level = 1)
#> Headings
#> ========
```

``` r

md_setext("4.3 Setext headings", level = 2)
#> 4.3 Setext headings
#> -------------------
```

``` r

md_setext("4.3 Setext headings", width = 50)
#> 4.3 Setext headings
#> ==================================================
```

### 4.4 Indented code blocks

> An indented code block is composed of one or more indented chunks
> separated by blank lines. An indented chunk is a sequence of non-blank
> lines, each indented four or more spaces. The contents of the code
> block are the literal contents of the lines, including trailing line
> endings, minus four spaces of indentation…

This function, along with the fenced code block alternative, are useful
for creating displayed code blocks (as opposed to executed chunks)
containing R source code, command line content, or any other
pre-formatted fixed-width content.

``` r

rescale01 <- function(x) {
  rng <- range(x, na.rm = TRUE)
  (x - rng[1]) / (rng[2] - rng[1])
}

# use deparse() to turn unevaluated expressions into character strings.
source <- deparse(rescale01)
# this new object is a regular character vector
print(source)
#> [1] "function (x) "                      "{"                                 
#> [3] "    rng <- range(x, na.rm = TRUE)"  "    (x - rng[1])/(rng[2] - rng[1])"
#> [5] "}"
```

``` r

md_indent(source)
#>     function (x) 
#>     {
#>         rng <- range(x, na.rm = TRUE)
#>         (x - rng[1])/(rng[2] - rng[1])
#>     }
```

    function (x) 
    {
        rng <- range(x, na.rm = TRUE)
        (x - rng[1])/(rng[2] - rng[1])
    }

### 4.5 Fenced code blocks

> A code fence is a sequence of at least three consecutive backtick
> characters … or tildes (`~`). (Tildes and backticks cannot be mixed.)
> A fenced code block begins with a code fence, indented no more than
> three spaces…
>
> The line with the opening code fence may optionally contain some text
> following the code fence; this is trimmed of leading and trailing
> whitespace and called the info string…
>
> The content of the code block consists of all subsequent lines, until
> a closing code fence of the same type as the code block began with
> (backticks or tildes), and with at least as many backticks or tildes
> as the opening code fence….
>
> The content of a code fence is treated as literal text, not parsed as
> inlines. The first word of the info string is typically used to
> specify the language of the code sample, and rendered in the class
> attribute of the code tag. However, this spec does not mandate any
> particular treatment of the info string.

The man feature of
[`md_fence()`](https://k5cents.github.io/gluedown/reference/md_fence.md)
is the ability to specify the info string which defines the code
language used to highlight syntax. Compare the following output to the
one produced by
[`md_indent()`](https://k5cents.github.io/gluedown/reference/md_indent.md).

``` r

md_fence(source)
```

    #> ```r
    #> function (x) 
    #> {
    #>     rng <- range(x, na.rm = TRUE)
    #>     (x - rng[1])/(rng[2] - rng[1])
    #> }
    #> ```

``` r

function (x) 
{
    rng <- range(x, na.rm = TRUE)
    (x - rng[1])/(rng[2] - rng[1])
}
```

``` r

md_fence(source, char = "~")
#> ~~~r
#> function (x) 
#> {
#>     rng <- range(x, na.rm = TRUE)
#>     (x - rng[1])/(rng[2] - rng[1])
#> }
#> ~~~
```

``` r

function (x) 
{
    rng <- range(x, na.rm = TRUE)
    (x - rng[1])/(rng[2] - rng[1])
}
```

``` r

md_fence("$ sudo apt install r-base-dev", info = "bash")
```

    #> ```bash
    #> $ sudo apt install r-base-dev
    #> ```

``` bash
$ sudo apt install r-base-dev
```

### 4.6 HTML blocks

> An HTML block is a group of lines that is treated as raw HTML (and
> will not be escaped in HTML output).

Markdown rendering engines (like the one used to convert this `.Rmd`
document to `.md` and then to `.html`) allow users to write valid HTML
code alongside regular markdown text.

``` r

lines <- c(
  "<table><tr><td>",
  "<pre>",
  "**Hello**,",
  "_world_.",
  "</pre>",
  " </td></tr></table>"
)
md_text(lines)
#> <table><tr><td>
#> <pre>
#> **Hello**,
#> _world_.
#> </pre>
#>  </td></tr></table>
```

[TABLE]

### 4.7 Link reference definitions

> A link reference definition consists of a link label, indented up to
> three spaces, followed by a colon (`:`), optional whitespace
> (including up to one line ending), a link destination, optional
> whitespace (including up to one line ending), and an optional link
> title, which if it is present must be separated from the link
> destination by whitespace. No further non-whitespace characters may
> occur on the line.
>
> A link reference definition does not correspond to a structural
> element of a document. Instead, it defines a label which can be used
> in reference links and reference-style images elsewhere in the
> document. Link reference definitions can come either before or after
> the links that use them.

The
[`md_reference()`](https://k5cents.github.io/gluedown/reference/md_reference.md)
function is used to create the link reference definition *only*, which
must then be paired with the same label elsewhere in the document. We
can put the definitions anywhere in the document, so when I type
`[CRAN]` here in this paragraph (like
[CRAN](https://cran.r-project.org/ "CRAN Home")), that text looks for
the label created below to create a hyperlink. The reference definition
printed to the document actually doesn’t show up anywhere in the
rendered `.html` file.

``` r

a <- c("cran", "tidy")
b <- c("https://cran.r-project.org/", "https://www.tidyverse.org/")
c <- c("CRAN Home", "Tidyverse Home")
```

``` r

md_reference(label = a, url = b, title = c)
#> [cran]: https://cran.r-project.org/ "CRAN Home"
#> [tidy]: https://www.tidyverse.org/ "Tidyverse Home"
```

### 4.8 Paragraphs

> A sequence of non-blank lines that cannot be interpreted as other
> kinds of blocks forms a paragraph. The contents of the paragraph are
> the result of parsing the paragraph’s raw content as inlines. The
> paragraph’s raw content is formed by concatenating the lines and
> removing initial and final whitespace.

Paragraphs are one instance are where it’s easy for markdown newcomers
can have difficulty writing the plain text in the proper format to
produce their desired outcome. Words separated by a single newline are
rendered as a single paragraph `<p>` tag. Using
[`md_paragraph()`](https://k5cents.github.io/gluedown/reference/md_paragraph.md),
we can take a vector of character text and output *distinct* paragraphs.

In section 6.12 and 6.13 you can compare the output of
[`md_paragraph()`](https://k5cents.github.io/gluedown/reference/md_paragraph.md)
with the other line break functions.

``` r

sentences <- sample(stringr::sentences, size = 5)
```

``` r

md_paragraph(sentences)
#> There was a sound of dry leaves outside.
#> 
#> Three for a dime, the young peddler cried.
#> 
#> The price is fair for a good antique clock.
#> 
#> He ran half way to the hardware store.
#> 
#> He offered proof in the form of a large chart.
```

There was a sound of dry leaves outside.

Three for a dime, the young peddler cried.

The price is fair for a good antique clock.

He ran half way to the hardware store.

He offered proof in the form of a large chart.

### 4.9 Blank lines

> Blank lines between block-level elements are ignored, except for the
> role they play in determining whether a list is tight or loose.
>
> Blank lines at the beginning and end of the document are also ignored.

Blank lines are, well, not super useful… but you can create them with
[`md_blank()`](https://k5cents.github.io/gluedown/reference/md_blank.md)!

``` r

md_blank()
```

### 4.10 Tables (extension)

> GFM enables the `table` extension, where an additional leaf block type
> is available.
>
> A table is an arrangement of data with rows and columns, consisting of
> a single header row, a delimiter row separating the header from the
> data, and zero or more data rows.
>
> Each row consists of cells containing arbitrary text, in which inlines
> are parsed, separated by pipes (`|`). A leading and trailing pipe is
> also recommended for clarity of reading, and if there’s otherwise
> parsing ambiguity. Spaces between pipes and cell content are trimmed.
> Block-level elements cannot be inserted in a table.
>
> The delimiter row consists of cells whose only content are hyphens
> (`-`), and optionally, a leading or trailing colon (`:`), or both, to
> indicate left, right, or center alignment respectively.

The
[`md_table()`](https://k5cents.github.io/gluedown/reference/md_table.md)
function wraps around
[`knitr::kable()`](https://rdrr.io/pkg/knitr/man/kable.html) to return R
objects (Typically data frames or matrices) as markdown tables. This is
useful for presenting data created using R in a format that’s more
readable than a plain-text data frame (or tibble) printout.

``` r

states <- head(state.x77)
print(states)
#>            Population Income Illiteracy Life Exp Murder HS Grad Frost   Area
#> Alabama          3615   3624        2.1    69.05   15.1    41.3    20  50708
#> Alaska            365   6315        1.5    69.31   11.3    66.7   152 566432
#> Arizona          2212   4530        1.8    70.55    7.8    58.1    15 113417
#> Arkansas         2110   3378        1.9    70.66   10.1    39.9    65  51945
#> California      21198   5114        1.1    71.71   10.3    62.6    20 156361
#> Colorado         2541   4884        0.7    72.06    6.8    63.9   166 103766
```

``` r

options(knitr.kable.NA = "")
md_table(states, align = "c")
#> |           | Population | Income | Illiteracy | Life Exp | Murder | HS Grad | Frost |  Area  |
#> |:----------|:----------:|:------:|:----------:|:--------:|:------:|:-------:|:-----:|:------:|
#> |Alabama    |    3615    |  3624  |    2.1     |  69.05   |  15.1  |  41.3   |  20   | 50708  |
#> |Alaska     |    365     |  6315  |    1.5     |  69.31   |  11.3  |  66.7   |  152  | 566432 |
#> |Arizona    |    2212    |  4530  |    1.8     |  70.55   |  7.8   |  58.1   |  15   | 113417 |
#> |Arkansas   |    2110    |  3378  |    1.9     |  70.66   |  10.1  |  39.9   |  65   | 51945  |
#> |California |   21198    |  5114  |    1.1     |  71.71   |  10.3  |  62.6   |  20   | 156361 |
#> |Colorado   |    2541    |  4884  |    0.7     |  72.06   |  6.8   |  63.9   |  166  | 103766 |
```

|            | Population | Income | Illiteracy | Life Exp | Murder | HS Grad | Frost |  Area  |
|:-----------|:----------:|:------:|:----------:|:--------:|:------:|:-------:|:-----:|:------:|
| Alabama    |    3615    |  3624  |    2.1     |  69.05   |  15.1  |  41.3   |  20   | 50708  |
| Alaska     |    365     |  6315  |    1.5     |  69.31   |  11.3  |  66.7   |  152  | 566432 |
| Arizona    |    2212    |  4530  |    1.8     |  70.55   |  7.8   |  58.1   |  15   | 113417 |
| Arkansas   |    2110    |  3378  |    1.9     |  70.66   |  10.1  |  39.9   |  65   | 51945  |
| California |   21198    |  5114  |    1.1     |  71.71   |  10.3  |  62.6   |  20   | 156361 |
| Colorado   |    2541    |  4884  |    0.7     |  72.06   |  6.8   |  63.9   |  166  | 103766 |

## 5 Container Blocks

> A container block is a block that has other blocks as its contents.
> There are two basic kinds of container blocks: block quotes and list
> items. Lists are meta-containers for list items.

### 5.1 Block quotes

> A block quote marker consists of 0-3 spaces of initial indent, plus
> (a) the character \> together with a following space, or (b) a single
> character \> not followed by a space.

I’ve been copy-pasting block quotes from the GFM spec in this vignette,
but we can also use
[`md_quote()`](https://k5cents.github.io/gluedown/reference/md_quote.md)
to grammatically create or manipulate strings and print them as block
quotes.

``` r

read_html("https://w.wiki/A58") %>% 
  html_element("blockquote") %>% 
  html_text(trim = TRUE) %>% 
  str_remove("\\[(.*)\\]") %>% 
  md_quote()
```

> We the People of the United States, in order to form a more perfect
> Union, establish Justice, insure domestic Tranquility, provide for the
> common defence, promote the general Welfare, and secure the Blessings
> of Liberty to ourselves and our Posterity, do ordain and establish
> this Constitution for the United States of America.

``` r

md_quote(sentences)
#> > There was a sound of dry leaves outside.
#> > Three for a dime, the young peddler cried.
#> > The price is fair for a good antique clock.
#> > He ran half way to the hardware store.
#> > He offered proof in the form of a large chart.
```

> There was a sound of dry leaves outside.

> Three for a dime, the young peddler cried.

> The price is fair for a good antique clock.

> He ran half way to the hardware store.

> He offered proof in the form of a large chart.

### 5.2 List items

> A list marker is a bullet list marker or an ordered list marker.
>
> A bullet list marker is a -, +, or \* character.
>
> An ordered list marker is a sequence of 1–9 arabic digits (`0-9`),
> followed by either a `.` character or a `)` character. (The reason for
> the length limit is that with 10 digits we start seeing integer
> overflows in some browsers.)

List items are automatically created in list blocks (section 5.4) via
[`md_order()`](https://k5cents.github.io/gluedown/reference/md_order.md)
and
[`md_bullet()`](https://k5cents.github.io/gluedown/reference/md_bullet.md).

### 5.3 Task list items (extension)

> GFM enables the `tasklist` extension, where an additional processing
> step is performed on list items.
>
> A task list item is a list item where the first block in it is a
> paragraph which begins with a task list item marker and at least one
> whitespace character before any other content.
>
> A task list item marker consists of an optional number of spaces, a
> left bracket (`[`), either a whitespace character or the letter x in
> either lowercase or uppercase, and then a right bracket (`]`).
>
> When rendered, the task list item marker is replaced with a semantic
> checkbox element; in an HTML output, this would be an
> `<input type="checkbox">` element.
>
> If the character between the brackets is a whitespace character, the
> checkbox is unchecked. Otherwise, the checkbox is checked.

Markdown extensions like this one are optionally supported on different
venues. On GitHub (in `README.md` files, issues, or comments, etc.)
these tasks list are rendered as check boxes, sometimes even
interactable. On other venues, like this very HTML vignette, these check
boxes just render are bullet lists with weird bracket boxes on each
line.

``` r

md_task(sentences, check = 3:4)
#> * [ ] There was a sound of dry leaves outside.
#> * [ ] Three for a dime, the young peddler cried.
#> * [x] The price is fair for a good antique clock.
#> * [x] He ran half way to the hardware store.
#> * [ ] He offered proof in the form of a large chart.
```

There was a sound of dry leaves outside.

Three for a dime, the young peddler cried.

The price is fair for a good antique clock.

He ran half way to the hardware store.

He offered proof in the form of a large chart.

### 5.4 Lists

> A list is a sequence of one or more list items of the same type. The
> list items may be separated by any number of blank lines.
>
> Two list items are of the same type if they begin with a list marker
> of the same type. Two list \> markers are of the same type if (a) they
> are bullet list markers using the same character (`-`, `+`, or `*`) or
> (b) they are ordered list numbers with the same delimiter (either `.`
> or `)`).
>
> A list is an ordered list if its constituent list items begin with
> ordered list markers, and a \> bullet list if its constituent list
> items begin with bullet list markers.
>
> The start number of an ordered list is determined by the list number
> of its initial list item. The numbers of subsequent list items are
> disregarded.

The
[`md_order()`](https://k5cents.github.io/gluedown/reference/md_order.md)
and
[`md_bullet()`](https://k5cents.github.io/gluedown/reference/md_bullet.md)
functions let users display character vectors as list blocks. The
functions let users adjust the which list item markets are used, but all
the options are rendered as the same `<ul>` or `<ol>` tags in the
rendered `.html` file.

``` r

states <- sample(state.name, size = 3)
```

``` r

md_bullet(states)
#> * Pennsylvania
#> * Washington
#> * Wisconsin
```

- Pennsylvania
- Washington
- Wisconsin

``` r

md_bullet(states, marker = "+")
#> + Pennsylvania
#> + Washington
#> + Wisconsin
```

- Pennsylvania
- Washington
- Wisconsin

``` r

md_order(states)
#> 1. Pennsylvania
#> 2. Washington
#> 3. Wisconsin
```

1.  Pennsylvania
2.  Washington
3.  Wisconsin

``` r

md_order(states, seq = FALSE, marker = ")")
#> 1) Pennsylvania
#> 1) Washington
#> 1) Wisconsin
```

1.  Pennsylvania
2.  Washington
3.  Wisconsin

## 6 Inlines

> Inlines are parsed sequentially from the beginning of the character
> stream to the end (left to right, in left-to-right languages). Thus,
> for example, in

### 6.1 Backslash escapes

> Any ASCII punctuation character may be backslash-escaped… Escaped
> characters are treated as regular characters and do not have their
> usual Markdown meanings:

If you want to display markdown syntax without rendering as the
corresponding HTML tags,
[`md_escape()`](https://k5cents.github.io/gluedown/reference/md_escape.md)
can prepend a backslash (actually, two) before every ASCII punctuation
character.

``` r

inline <- md_bold("example")
md_escape(inline)
#> \*\*example\*\*
```

\*\*example\*\*

### 6.3 - 6.8 Simple inlines

Here we are going to demonstrate how various simple inline block
functions are used to create text *within* a container block.

``` r

inlines <- c(
  md_code("6.3 Code spans"),
  md_italic("6.4 Emphasis"),
  md_bold("6.4 Strong emphasis"),
  md_strike("6.5 Strikethrough (extension)"),
  md_link("6.6 Links", "https://example.com/"),
  md_autolink("https://example.com/")
)
```

``` r

md_bullet(inlines, marker = "-")
#> - `6.3 Code spans`
#> - _6.4 Emphasis_
#> - **6.4 Strong emphasis**
#> - ~~6.5 Strikethrough (extension)~~
#> - [6.6 Links](https://example.com/)
#> - <https://example.com/>
```

- `6.3 Code spans`
- *6.4 Emphasis*
- **6.4 Strong emphasis**
- ~~6.5 Strikethrough (extension)~~
- [6.6 Links](https://example.com/)
- <https://example.com/>

### 6.7 Images

> Syntax for images is like the syntax for links, with one difference.
> Instead of link text, we have an image description. The rules for this
> are the same as for link text, except that (a) an image description
> starts with `![` rather than `[`, and (b) an image description may
> contain links. An image description has inline elements as its
> contents. When an image is rendered to HTML, this is standardly used
> as the image’s `alt` attribute.

``` r

md_image("https://www.r-project.org/Rlogo.png", alt = "R logo")
#> ![R logo](https://www.r-project.org/Rlogo.png)
```

![R logo](https://www.r-project.org/Rlogo.png)

R logo

### 6.11 Disallowed Raw HTML (extension)

> GFM enables the tagfilter extension, where the following HTML tags
> will be filtered when rendering HTML output:
>
> - `<title>`
> - `<textarea>`
> - `<style>`
> - `<xmp>`
> - `<iframe>`
> - `<noembed>`
> - `<noframes>`
> - `<script>`
> - `<plaintext>`
>
> Filtering is done by replacing the leading \< with the entity \<.
> These tags are chosen in particular as they change how HTML is
> interpreted in a way unique to them (i.e. nested HTML is interpreted
> differently), and this is usually undesireable in the context of other
> rendered Markdown content.

``` r

lines <- c(
  "<blockquote>",
  "  <xmp> is disallowed.  <XMP> is also disallowed.",
  "</blockquote>"
)
md_disallow(lines)
#> <blockquote>
#>   &lt;xmp> is disallowed.  &lt;XMP> is also disallowed.
#> </blockquote>
```

> \<xmp\> is disallowed. \<XMP\> is also disallowed.

All other HTML tags are left untouched.

### 6.12 - 6.13 Line breaks

The difference between *hard* line breaks, *soft* line breaks,
paragraphs, and regular text can be confusing. New markdown users often
struggle with knowing exactly how many invisible newlines or spaces are
needed to present each line in the way they want. The line break
functions below make it easier.

> A line break (not in a code span or HTML tag) that is preceded by two
> or more spaces and does not occur at the end of a block is parsed as a
> hard line break (rendered in HTML as a `<br />` tag):

``` r

# 6.12 Hard line breaks
md_hardline(sentences)
#> There was a sound of dry leaves outside.  
#> Three for a dime, the young peddler cried.  
#> The price is fair for a good antique clock.  
#> He ran half way to the hardware store.  
#> He offered proof in the form of a large chart.
```

There was a sound of dry leaves outside.  
Three for a dime, the young peddler cried.  
The price is fair for a good antique clock.  
He ran half way to the hardware store.  
He offered proof in the form of a large chart.

------------------------------------------------------------------------

> A regular line break (not in a code span or HTML tag) that is not
> preceded by two or more spaces or a backslash is parsed as a
> softbreak. (A softbreak may be rendered in HTML either as a line
> ending or as a space. The result will be the same in browsers. In the
> examples here, a line ending will be used.)

``` r

# 6.13 Soft line breaks
md_softline(sentences)
#> There was a sound of dry leaves outside.
#> Three for a dime, the young peddler cried.
#> The price is fair for a good antique clock.
#> He ran half way to the hardware store.
#> He offered proof in the form of a large chart.
```

There was a sound of dry leaves outside. Three for a dime, the young
peddler cried. The price is fair for a good antique clock. He ran half
way to the hardware store. He offered proof in the form of a large
chart.

------------------------------------------------------------------------

You can see how both hard line and soft line breaks are different from
the paragraphs as created using
[`md_paragraph()`](https://k5cents.github.io/gluedown/reference/md_paragraph.md)

``` r

md_paragraph(sentences)
#> There was a sound of dry leaves outside.
#> 
#> Three for a dime, the young peddler cried.
#> 
#> The price is fair for a good antique clock.
#> 
#> He ran half way to the hardware store.
#> 
#> He offered proof in the form of a large chart.
```

There was a sound of dry leaves outside.

Three for a dime, the young peddler cried.

The price is fair for a good antique clock.

He ran half way to the hardware store.

He offered proof in the form of a large chart.

### 6.14 Textual content

> Any characters not given an interpretation by the above rules will be
> parsed as plain textual content.

The
[`md_text()`](https://k5cents.github.io/gluedown/reference/md_text.md)
function is a catch-all wrapper around
[`glue::as_glue()`](https://glue.tidyverse.org/reference/as_glue.html)
with simply converts any character string into a `glue` object, which
when used in an `.Rmd.` document alongside the `results='asis'` allows
users to simply print text to the body of the document.

``` r

# 6.14 Textual content
md_text(sentences)
#> There was a sound of dry leaves outside.
#> Three for a dime, the young peddler cried.
#> The price is fair for a good antique clock.
#> He ran half way to the hardware store.
#> He offered proof in the form of a large chart.
```

There was a sound of dry leaves outside. Three for a dime, the young
peddler cried. The price is fair for a good antique clock. He ran half
way to the hardware store. He offered proof in the form of a large
chart.

------------------------------------------------------------------------

Compare this to the regular handling of character strings.

``` r

print(sentences)
#> [1] "There was a sound of dry leaves outside."      
#> [2] "Three for a dime, the young peddler cried."    
#> [3] "The price is fair for a good antique clock."   
#> [4] "He ran half way to the hardware store."        
#> [5] "He offered proof in the form of a large chart."
```

\[1\] “There was a sound of dry leaves outside.”  
\[2\] “Three for a dime, the young peddler cried.”  
\[3\] “The price is fair for a good antique clock.”  
\[4\] “He ran half way to the hardware store.”  
\[5\] “He offered proof in the form of a large chart.”

------------------------------------------------------------------------

The
[`md_text()`](https://k5cents.github.io/gluedown/reference/md_text.md)
function creates strings with the `glue` S3 class. This class works in
the same way as the [`cat()`](https://rdrr.io/r/base/cat.html)
functions.

``` r

cat(sentences)
#> There was a sound of dry leaves outside. Three for a dime, the young peddler cried. The price is fair for a good antique clock. He ran half way to the hardware store. He offered proof in the form of a large chart.
```

There was a sound of dry leaves outside. Three for a dime, the young
peddler cried. The price is fair for a good antique clock. He ran half
way to the hardware store. He offered proof in the form of a large
chart.
