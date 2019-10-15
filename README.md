
<!-- README.md is generated from README.Rmd. Please edit that file -->

# gluedown <img src="man/figures/logo.png" align="right" width="120" />

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/gluedown)](https://CRAN.R-project.org/package=gluedown)
<!-- badges: end -->

The `gluedown` package uses
[`glue()`](https://github.com/tidyverse/glue) to wrap character vectors
in markdown syntax. Markdown is a lightweight, plain-text markup
language prevalent in the R community.

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

The package used [GitHub Flavored
Markdown](https://github.github.com/gfm/) (GFM), which is a
site-specific version of the [CommonMark
specification](https://spec.commonmark.org/), an unambiguous
implimentation of the John Gruber’s [original Markdown
syntax](https://daringfireball.net/projects/markdown/).

[GitHub task
lists](https://help.github.com/en/articles/about-task-lists) are
supported, with the ability to adjust checks.

``` r
chores <- c("Wake up", "Eat breakfast", "Brush teeth")
md_task(chores, check = c(1, 3), cat = TRUE)
```

  - [x] Wake up
  - [ ] Eat breakfast
  - [x] Brush teeth

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

The `md_table()` wraps around the fantastic
[`knitr::kable()`](https://github.com/yihui/knitr/blob/master/R/table.R)
function to create simple markdown tables.

``` r
md_table(band_members)
```

| name | band    |
| :--- | :------ |
| Mick | Stones  |
| John | Beatles |
| Paul | Beatles |

Creating numbered and bullet lists from vectors was the initial
inspiration for the package. Here, we also see how *inline* functions
(e.g., `md_bold`) can be used within *block* functions (e.g.,
`md_bullet()`).

``` r
md_list(state.name[1:3], cat = TRUE)
```

1.  Alabama
2.  Alaska
3.  Arizona

<!-- end list -->

``` r
inline <- c(
  md_bold(state.name[4]),
  md_code(state.name[5]),
  md_link(state.name[6], "https://colorado.gov"),
  md_italic(state.name[7]),
  md_strike(state.name[8])
)

md_bullet(inline, cat = TRUE)
```

  - **Arkansas**
  - `California`
  - [Colorado](https://colorado.gov)
  - *Connecticut*
  - ~~Delaware~~

<!-- end list -->

``` r
deparse(md_bold) %>% md_fence(cat = TRUE)
function (x) 
{
    glue::glue("**{x}**")
}
```
