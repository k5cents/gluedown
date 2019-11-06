library(testthat)
library(gluedown)
library(stringr)

test_that("map_md can target individual words of a sentence", {
  x <- "The birch canoe slid on the smooth planks."
  y <- "The **birch** canoe slid on the smooth planks."
  expect_equal(map_md(x, md_bold, 2), y)
})

test_that("map_md returns an error if no function is provided", {
  expect_error(map_md("Live free or die", f = state.abb, n = 2))
})
