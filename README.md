
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
language prevalent in the R community. This package helps transition
from raw R vectors and formatted markdown text.

The package used [GitHub Flavored
Markdown](https://github.github.com/gfm/) (GFM), which is a
site-specific version of the [CommonMark
specification](https://spec.commonmark.org/), an unambiguous
implimentation of the John Gruber’s [original Markdown
syntax](https://daringfireball.net/projects/markdown/).

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

With the `cat` argument, these wrapped vectors can by easily
concatenated, separated with a newline, and printed; this is useful in
combination with the `results='asis'` [R
Markdown](https://github.com/rstudio/rmarkdown) chunk option to directly
print markdown blocks. This output can also be used inline.

``` r
library(gluedown)
library(dplyr)
library(rvest)
states <- sample(state.name, 3)
chores <- c("Wake up", "Eat breakfast", "Brush teeth")
preamble <- html_text(html_node(read_html("https://w.wiki/A58"), "blockquote"))
```

``` r
md_list(states, cat = TRUE)
```

1.  Tennessee
2.  West Virginia
3.  New Mexico

<!-- end list -->

``` r
md_task(chores, check = c(1, 3), cat = TRUE)
```

  - [x] Wake up
  - [ ] Eat breakfast
  - [x] Brush teeth

<!-- end list -->

``` r
md_quote(preamble, cat = TRUE)
```

> We the People of the United States, in Order to form a more perfect
> Union, establish Justice, insure domestic Tranquility, provide for the
> common defence,\[note 1\] promote the general Welfare, and secure the
> Blessings of Liberty to ourselves and our Posterity, do ordain and
> establish this Constitution for the United States of America.

``` r
md_table(band_members)
```

| name | band    |
| :--- | :------ |
| Mick | Stones  |
| John | Beatles |
| Paul | Beatles |
