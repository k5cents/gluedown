
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

## Usage

By default, many `gluedown` functions simply take a character vector and
return that same vector with each element wrapped in the corresponding
markdown syntax. With the `cat` argument, these wrapped vectors can by
easily concatenated, separated with a newline, and printed; this is
useful in combination with the `results='asis'` RMarkdown chunk option
to directly print markdown blocks.

``` r
library(gluedown)
library(dplyr)
library(rvest)
states <- sample(state.name, 3)
chores <- c("Wake up", "Eat Breakfast", "Brush Teeth")
preamble <- html_text(html_nodes(read_html("https://plaintext.us/constitution"), "p"))[[1]]
```

``` r
md_bullet(states, cat = TRUE)
```

  - Wyoming
  - Maine
  - Iowa

<!-- end list -->

``` r
md_list(states, cat = TRUE)
```

1.  Wyoming
2.  Maine
3.  Iowa

<!-- end list -->

``` r
md_task(chores, check = c(1, 3), cat = TRUE)
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

``` r
md_table(band_members)
```

| name | band    |
| :--- | :------ |
| Mick | Stones  |
| John | Beatles |
| Paul | Beatles |
