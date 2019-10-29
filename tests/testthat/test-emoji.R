library(gluedown)
library(testthat)

test_that("md_emoji replaces :code: with emoji", {
  emoji <- md_emoji(":grinning:")
  expect_equal(emoji, intToUtf8(0x1f600))
})
