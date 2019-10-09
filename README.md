
<!-- README.md is generated from README.Rmd. Please edit that file -->

# gluedown

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/gluedown)](https://CRAN.R-project.org/package=gluedown)
<!-- badges: end -->

The `gluedown` package helps wrap character vectors in markdown syntax.

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("kiernann/gluedown")
```

## Example

By default, many `gluedown` functions simply create character strings
from character strings. These new vectors can then also be concatenated
and printed; this is useful in combination with the `results='asis'`
RMarkdown chunk option.

``` r
library(gluedown)
library(rvest)
states <- sample(state.name, 3)
chores <- c("Wake up", "Eat Breakfast", "Brush Teeth")
url <- "https://plaintext.us/constitution"
preamble <- html_text(html_nodes(read_html(url), "p"))[[1]]
```

``` r
md_bullet(states, cat = TRUE)
```

  - California
  - Wyoming
  - Oklahoma

<!-- end list -->

``` r
md_list(states, cat = TRUE)
```

1.  California
2.  Wyoming
3.  Oklahoma

<!-- end list -->

``` r
md_task(chores, cat = TRUE, checks = c(1, 3))
```

  - [x] Wake up
  - [ ] Eat Breakfast
  - [x] Brush Teeth

<!-- end list -->

``` r
md_quote(preamble, cat = TRUE)
```

> We the People of the United States, in Order to form a more perfect
> Union, establish Justice, insure domestic Tranquility, provide for the
> common defence, promote the general Welfare, and secure the Blessings
> of Liberty to ourselves and our Posterity, do ordain and establish
> this Constitution for the United States of America.

The functions are also semi-useful when used inline in Rmarkdown
documents. They can be used to **bold**, *italicize*, ~~strike
through~~, etc.

## To Do

  - Implement the table functionality from `knitr::kable()`
  - Improve the vectorization of `md_fence()`
