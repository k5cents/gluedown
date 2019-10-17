
<!-- README.md is generated from README.Rmd. Please edit that file -->

# gluedown <img src="man/figures/logo.png" align="right" width="120" />

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/gluedown)](https://CRAN.R-project.org/package=gluedown)
[![Travis build
status](https://travis-ci.org/kiernann/gluedown.svg?branch=master)](https://travis-ci.org/kiernann/gluedown)
<!-- badges: end -->

The `gluedown` helps transition from R vectors to markdown text. The
functions use [`glue()`](https://github.com/tidyverse/glue) to wrap
character vectors in markdown syntax. This allows users to directly
print R vectors as markdown text for improved clarity and readability.
Markdown is a lightweight, plain-text markup language prevalent in the R
community.

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("kiernann/gluedown")
```

## Usage

By default, many `gluedown` functions simply take a character vector and
return that same vector with each element wrapped in the appropriate
markdown syntax.

With the `cat` argument, these wrapped vectors can be easily
concatenated, separated with a newline, and printed; this is useful in
combination with the `results='asis'` [R
Markdown](https://github.com/rstudio/rmarkdown) chunk option to directly
print markdown blocks.

``` r
library(gluedown)
library(tidyverse)
library(rvest)
```

### Lists

Printing vectors as markdown lists was the initial inspiration for the
package. Here, we also see how *inline* functions can be used within
*block* functions.

``` r
md_list(state.name[1:3], cat = TRUE)
```

1.  Alabama
2.  Alaska
3.  Arizona

<!-- end list -->

``` r
inlines <- c(
  md_bold(state.name[4]),
  md_code(state.name[5]),
  md_link(state.name[6], "https://Colorado.gov"),
  md_italic(state.name[7]),
  md_strike(state.name[8])
)

md_bullet(inlines, cat = TRUE)
```

  - **Arkansas**
  - `California`
  - [Colorado](https://Colorado.gov)
  - *Connecticut*
  - ~~Delaware~~

### Pipes

All functions are designed to fit within the tidyverse ecosystem by
working with
[pipes](https://magrittr.tidyverse.org/reference/pipe.html).

``` r
read_html("https://w.wiki/A58") %>% 
  html_node("blockquote") %>% 
  html_text(trim = TRUE) %>% 
  str_remove("\\[(.*)\\]") %>% 
  md_quote(cat = TRUE)
```

> We the People of the United States, in Order to form a more perfect
> Union, establish Justice, insure domestic Tranquility, provide for the
> common defence, promote the general Welfare, and secure the Blessings
> of Liberty to ourselves and our Posterity, do ordain and establish
> this Constitution for the United States of America.

### Extensions

The package primarily uses [GitHub Flavored
Markdown](https://github.github.com/gfm/) (GFM), a site-specific version
of the [CommonMark specification](https://spec.commonmark.org/), an
unambiguous improvement on John Gruber’s [original
Markdown](https://daringfireball.net/projects/markdown/). With this
flavor, some useful extensions like [task
lists](https://help.github.com/en/articles/about-task-lists) are
supported on GitHub. Elsewhere, there may not work as well (or at all).

``` r
legislation <- c("Houses passes", "Senate concurs", "President signs")
md_task(legislation, check = 1:2, cat = TRUE)
```

  - \[x\] Houses passes
  - \[x\] Senate concurs
  - \[ \] President signs

Some features aren’t technically supported by GFM, but can be [forced by
pandoc](https://pandoc.org/MANUAL.html#definition-lists). With
`md_define()`, definition lists are simply rendered as funky bullet
lists on GitHub.

``` r
md_define("Democracy", def = "Government by the people", cat = TRUE)
```

  - Democracy  
    Government by the people

## Inline

You can also use `gluedown` to format R [inline code
results](https://rmarkdown.rstudio.com/lesson-4.html). First, use R to
calculate a result.

``` r
rand <- sample(state.name, 1)
# `r md_bold(rand)`
```

Then, you can easily print that result in the middle of regular text
with markdown formatting. In this case, our randomly selected state is…
**Wyoming**\!
