library(gluedown)
library(testthat)

test_that("emphasize_at can target a specific word from a sentence", {
  expect_equal(
    object = emphasize_at("Live free or die", md_bold, 4),
    expected = "Live free or **die**"
  )
})

