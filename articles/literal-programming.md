# Markdown Literal Programming

``` r

library(gluedown)
library(stringr)
library(rvest)
library(glue)
```

In literate programming, the typical paradigm of source code is
reversed; instead of a wall of code with the occasional comment, the
user writes *human* readable text (like this paragraph) with source code
interspersed. In the R language, this is primarily done with the
[`rmarkdown`](https://rmarkdown.rstudio.com/) package, which takes a
plaint text *R* markdown file (`.Rmd`) containing code “chunks” and
executes that code when converting to a regular markdown file (`.md`)
and then possibly some other format (`.html`, `.pdf`, etc).

Markdown is a lightweight plain-text language used to format text. Let’s
look at the original description of markdown from John Gruber’s website,
the creator of the markdown standard. Using the `rvest` package, we can
programmatically scrape Gruber’s blog, extract HTML paragraph tags, and
convert those tags to character vectors.

``` r

markdown_blog <- 
  read_html("https://daringfireball.net/projects/markdown/") %>% 
  html_elements("p") %>% 
  html_text()
```

Gruber first explains *what* exactly his markdown language is.

``` r

md_quote(markdown_blog[4])
```

> Markdown is a text-to-HTML conversion tool for web writers. Markdown
> allows you to write using an easy-to-read, easy-to-write plain text
> format, then convert it to structurally valid HTML.

He continues by outlining *why* markdown was created, his rationale for
it’s format, and some inspiration for it’s syntax.

``` r

md_quote(markdown_blog[6])
```

> The overriding design goal for Markdown’s formatting syntax is to make
> it as readable as possible. The idea is that a Markdown-formatted
> document should be publishable as-is, as plain text, without looking
> like it’s been marked up with tags or formatting instructions. While
> Markdown’s syntax has been influenced by several existing text-to-HTML
> filters, the single biggest source of inspiration for Markdown’s
> syntax is the format of plain text email.

This entire vignette was written in markdown and converted to HTML using
[pandoc](https://pandoc.org/). However, as you may have noticed, we
haven’t exactly been conforming to this original desire for markdown to
be readable as is. We didn’t copy the text from his blog and past it as
text into this vignette. This is where the `gluedown` package comes in.

The `gluedown` package helps ease the transition between the incredibly
powerful vector support in R and the readability of markdown. Since this
vignette was written in *R* Markdown (`.Rmd`), we are able to (1) use
the power of packages like `rvest` to collect, process, and/or analyze
some kind of data and then (2) transition that result to the human
readable markdown format.

When writing this vignette, *three* kinds of files are used.

1.  The `.Rmd` file containing source code is a programming environment
2.  The `.md` file created by `rmarkdown` is a human-readable plain text
    version of that input code also containing the output text.
3.  The `.html` format of this vignette created by `pandoc` is the final
    presentation format.

In the rest of this vignette, we will see some of the various use cases
for `gluedown`. We will see how easy it is to transition between R
vectors and readable results in markdown/HTML.

## Vector Lists

Printing vectors as markdown lists was the initial inspiration for the
package. In R, atomic vectors the fundamental object type that composes
more complex objects like lists and dataframes. The `state.name` vector
built into base R is a character vector of all 50 state names.

``` r

str(state.name, vec.len = 3)
#>  chr [1:50] "Alabama" "Alaska" "Arizona" ...
```

If we as a user want to use those state names as *text* in our markdown
document we can use the [`cat()`](https://rdrr.io/r/base/cat.html)
function and tell `rmarkdown` to print the results of that function “as
is” (rather than as code output).

``` r

cat(state.name[1:3])
```

Alabama Alaska Arizona

That output obviously isn’t very appealing. We could tweak our use of
[`cat()`](https://rdrr.io/r/base/cat.html) a little to separate them on
new lines.

``` r

cat(state.name[1:3], sep = "\n\n")
```

Alabama

Alaska

Arizona

This is more readable, but with some more work, we can use
[`cat()`](https://rdrr.io/r/base/cat.html) to print an ordered list.

``` r

cat(paste0(1:3, ". ", state.name[1:3]), sep = "\n")
```

1.  Alabama
2.  Alaska
3.  Arizona

This workflow gets tiresome, although it’s made slightly more simple
with the fantastic [`glue`](https://github.com/tidyverse/glue) package
from Jim Hester.

``` r

glue("{1:3}. {state.name[1:3]}")
```

1.  Alabama
2.  Alaska
3.  Arizona

This is the technique used in this package. Vector inputs are passed to
[`glue::glue()`](https://glue.tidyverse.org/reference/glue.html) and the
appropriate markdown syntax is implemented.

The
[`md_order()`](https://k5cents.github.io/gluedown/reference/md_order.md)
function simplifies the
[`glue::glue()`](https://glue.tidyverse.org/reference/glue.html)
workflow and allows users to more easily customize the appearance of the
list in *markdown* format.

``` r

# markdown only cares about the first number
md_order(state.name[1:3], seq = FALSE)
#> 1. Alabama
#> 1. Alaska
#> 1. Arizona
# markdown ignored padding and allows for use of parentheses
md_order(state.name[1:10], seq = TRUE, pad = TRUE, marker = ")")
#> 01) Alabama
#> 02) Alaska
#> 03) Arizona
#> 04) Arkansas
#> 05) California
#> 06) Colorado
#> 07) Connecticut
#> 08) Delaware
#> 09) Florida
#> 10) Georgia
```

Although, as we can see below, all these different options are rendered
as the same kind of HTML `<ol>` fragment.

``` r

md_order(state.name[1:3], seq = FALSE)
```

1.  Alabama
2.  Alaska
3.  Arizona

``` r

md_order(state.name[1:10], seq = TRUE, pad = TRUE, marker = ")")
```

1.  Alabama
2.  Alaska
3.  Arizona
4.  Arkansas
5.  California
6.  Colorado
7.  Connecticut
8.  Delaware
9.  Florida
10. Georgia

This ordered list is a markdown container *block*. As described in the
GitHub Flavored Markdown specification:

> We can think of a document as a sequence of blocks—structural elements
> like paragraphs, block quotations, lists, headings, rules, and code
> blocks. Some blocks (like block quotes and list items) contain other
> blocks; others (like headings and paragraphs) contain inline
> content—text, links, emphasized text, images, code spans, and so on.

We can nest `md_*()` functions to create inline content within a code
block. Let’s use some inline functions to create a new vector names
`inline` with five states, each formatted in another syntax. We’ll take
a look at what that vector *really* looks like with a simple
[`print()`](https://rdrr.io/r/base/print.html).

``` r

inlines <- c(
  md_bold(state.name[4]),
  md_code(state.name[5]),
  md_link(state.name[6], "https://Colorado.gov"),
  md_italic(state.name[7]),
  md_strike(state.name[8])
)

str(inlines, vec.len = 3)
#>  chr [1:5] "**Arkansas**" "`California`" "[Colorado](https://Colorado.gov)" ...
```

Using
[`md_bullet()`](https://k5cents.github.io/gluedown/reference/md_bullet.md)
we will print that vector as a bullet point list container block and
each list item will be rendered as a separate inline.

``` r

md_bullet(inlines)
```

- **Arkansas**
- `California`
- [Colorado](https://Colorado.gov)
- *Connecticut*
- ~~Delaware~~

These functions demonstrate how `gluedown` can be used to transition
between R vectors, simply formatted markdown text, and beautifully
formatted HTML text.

Aside from container blocks and inlines, there is a third type of
markdown content. The leaf blocks cannot contain inline content. The
thematic break is an example of a leaf block.

``` r

md_rule(char = "*", n = 80)
```

------------------------------------------------------------------------

Code blocks are another type of leaf block. The code we’ve been writing
so far is contained within `rmarkdown` *chunks*, which execute the code
within. By default, those code chunks are then displayed as regular code
blocks in the intermediary `.md` file. Sometimes we might want to use
code blocks to display other types of text. Perhaps we want to show the
content of a function. The
[`md_fence()`](https://k5cents.github.io/gluedown/reference/md_fence.md)
function creates a *new* code fence from the lines created by
[`deparse()`](https://rdrr.io/r/base/deparse.html).

``` r

lines <- deparse(md_bullet)
md_fence(lines)
function (x, marker = c("*", "-", "+")) 
{
    marker <- match.arg(marker)
    glue::glue("{marker} {x}")
}
```

Or perhaps we want to display some code from another language that isn’t
supposed to be executed

``` r

command <- "sudo apt install r-base-dev"
md_fence(paste("$", command), char = "~", info = "bash")
#> ~~~bash
#> $ sudo apt install r-base-dev
#> ~~~
```

## Pipes

The package has been designed to fit well in a traditional R workflow so
users can seamlessly create content with their code and display that
content with `gluedown`. In that spirit, all functions are designed to
fit within the tidyverse ecosystem by working with
[pipes](https://magrittr.tidyverse.org/reference/pipe.html). Pipes allow
users to pass the results of one function into the beginning of the
next. By ending this “pipeline” with
[`md_quote()`](https://k5cents.github.io/gluedown/reference/md_quote.md),
we chain together five coding steps:

1.  Read the HTML text of a Wikipedia page
2.  Extract the first `<blockquote>` tag
3.  Convert that tag to a character vector
4.  Remove Wikipedia’s bracketed note
5.  Print that vector as a markdown block quote

``` r

read_html("https://w.wiki/A58") %>% # 1
  html_element("blockquote") %>%    # 2
  html_text(trim = TRUE) %>%        # 3
  str_remove("\\[(.*)\\]") %>%      # 4
  md_quote()                        # 5
```

> We the People of the United States, in order to form a more perfect
> Union, establish Justice, insure domestic Tranquility, provide for the
> common defence, promote the general Welfare, and secure the Blessings
> of Liberty to ourselves and our Posterity, do ordain and establish
> this Constitution for the United States of America.

## Extensions

The package primarily uses [GitHub Flavored
Markdown](https://github.github.com/gfm/) (GFM), a site-specific version
of the [CommonMark specification](https://spec.commonmark.org/), an
unambiguous implementation of John Gruber’s [original
Markdown](https://daringfireball.net/projects/markdown/). With this
flavor, some useful extensions like [task
lists](https://help.github.com/en/articles/about-task-lists) are
supported on GitHub. Elsewhere, like this HTML vignette, a task list
will just render as a bullet list. You can learn more about how GFM us
implemented in this package’s other vignette.

``` r

legislation <- c("Houses passes", "Senate concurs", "President signs")
md_task(legislation, check = 1:2)
```

Houses passes

Senate concurs

President signs

Markdown tables are another extremely useful extension. The
[`md_table()`](https://k5cents.github.io/gluedown/reference/md_table.md)
functions wraps around the much more powerful
[`knitr::kable()`](https://rdrr.io/pkg/knitr/man/kable.html) function,
which allows data frames to be printed in a number of alternative
formats. Printing data frames is a very typical use case for documenting
the process of data science. With small summary tables like the one
below, a markdown table is much more readable than the plain text tibble
or data frame printed by default.

``` r

print(head(state.x77))
#>            Population Income Illiteracy Life Exp Murder HS Grad Frost   Area
#> Alabama          3615   3624        2.1    69.05   15.1    41.3    20  50708
#> Alaska            365   6315        1.5    69.31   11.3    66.7   152 566432
#> Arizona          2212   4530        1.8    70.55    7.8    58.1    15 113417
#> Arkansas         2110   3378        1.9    70.66   10.1    39.9    65  51945
#> California      21198   5114        1.1    71.71   10.3    62.6    20 156361
#> Colorado         2541   4884        0.7    72.06    6.8    63.9   166 103766
```

``` r

md_table(head(state.x77), digits = 2)
```

|            | Population | Income | Illiteracy | Life Exp | Murder | HS Grad | Frost |   Area |
|:-----------|-----------:|-------:|-----------:|---------:|-------:|--------:|------:|-------:|
| Alabama    |       3615 |   3624 |        2.1 |    69.05 |   15.1 |    41.3 |    20 |  50708 |
| Alaska     |        365 |   6315 |        1.5 |    69.31 |   11.3 |    66.7 |   152 | 566432 |
| Arizona    |       2212 |   4530 |        1.8 |    70.55 |    7.8 |    58.1 |    15 | 113417 |
| Arkansas   |       2110 |   3378 |        1.9 |    70.66 |   10.1 |    39.9 |    65 |  51945 |
| California |      21198 |   5114 |        1.1 |    71.71 |   10.3 |    62.6 |    20 | 156361 |
| Colorado   |       2541 |   4884 |        0.7 |    72.06 |    6.8 |    63.9 |   166 | 103766 |

## Inlines

You can also use `gluedown` to format R \[inline code
results\]\[inline\]. First, use R to calculate a result.

``` r

rand <- sample(state.name, 1)
# `r md_bold(rand)`
var <- sample(colnames(state.x77), 1)
# `r md_code(var)`
```

Then, you can easily print that result in the middle of regular text
with markdown formatting. In this case, our randomly selected state is…
**Vermont** and the `Frost` variable was randomly selected from the
`state.x77` dataframe. Calculating results and using those calculations
in the body of a text document increases reproducibility.

In a [meta-study of psychology
journals](https://web.archive.org/web/20220723000032/https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3174372/),
researchers found that “around 15% of the articles contained at least
one statistical conclusion that proved, upon recalculation, to be
incorrect.” These errors can be mitigated by using inline printing of
results like we did above. With the `gluedown` package, programmers can
**emphasize** those results without worry.
