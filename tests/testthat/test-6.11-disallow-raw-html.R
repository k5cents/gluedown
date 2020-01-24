library(testthat)
library(gluedown)
library(rvest)
library(glue)

test_that("md_disallow removes certain tags (ex. 653)", {
  # https://github.github.com/gfm/#example-653
  a <- glue::glue_collapse(
    sep = " ",
    x = c(
      "<strong>",
      "<title>",
      "<style>",
      "<em>",
      "<blockquote>",
      "<xmp>",
      "is disallowed." ,
      "<XMP>",
      "is also disallowed.",
      "</blockquote>"
    )
  )
  b <- glue::glue_collapse(
    sep = " ",
    x = c(
      "<strong>",
      "&lt;title>",
      "&lt;style>",
      "<em>",
      "<blockquote>",
      "&lt;xmp> is disallowed.",
      "&lt;XMP> is also disallowed.",
      "</blockquote>"
    )
  )
  md_disallow(a) %>% expect_equal(b)
})
