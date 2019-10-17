
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

The [*Printing Markdown*
vignette](https://kiernann.com/gluedown/articles/printing-markdown.html)
explains all the `gluedown` use cases in more detail.

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("kiernann/gluedown")
```

## Usage

By default, many `gluedown` functions simply wrap in the appropriate
markdown syntax.

With the `cat` argument, wrapped vectors can be concatenated, separated
with a newline, and printed; this is useful in combination with the
`results='asis'` [R Markdown](https://github.com/rstudio/rmarkdown)
chunk option to directly print markdown text.

``` r
library(gluedown)
library(tidyverse)
library(rvest)
```

### Lists

Printing vectors as markdown lists was the initial inspiration for the
package.

``` r
inlines <- c(
  md_bold(state.name[1]),
  md_code(state.name[2]),
  md_link(state.name[3], "https://az.gov"),
  md_italic(state.name[4]),
  md_strike(state.name[5])
)

md_bullet(inlines, cat = TRUE)
```

  - **Alabama**
  - `Alaska`
  - [Arizona](https://az.gov)
  - *Arkansas*
  - ~~California~~

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
**Michigan**\!
