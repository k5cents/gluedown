
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
x <- sample(state.name, 3)
md_bullet(x, cat = TRUE)
```

  - Missouri
  - Louisiana
  - Oregon

<!-- end list -->

``` r
md_list(x, cat = TRUE)
```

1.  Missouri
2.  Louisiana
3.  Oregon

<!-- end list -->

``` r
md_task(x, cat = TRUE, checks = 1:2)
```

  - [x] Missouri
  - [x] Louisiana
  - [ ] Oregon

The functions are also semi-useful when used inline in Rmarkdown
documents. They can be used to **bold**, *italicize*, ~~strike
through~~, etc.

## To Do

  - Implement the table functionality from `knitr::kable()`
  - Improve the vectorization of `md_fence()`
