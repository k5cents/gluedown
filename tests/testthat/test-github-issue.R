library(testthat)
library(gluedown)
library(stringr)
library(rvest)
library(knitr)
library(glue)

test_that("md_issue creates GitHub auto-link URL", {
  issue <- md_issue("k5cents/gluedown", 1)
  convert <- str_c("https://github.com/", str_replace(issue, "#", "/issues/"))
  url <- "https://github.com/k5cents/gluedown/issues/1"
  expect_equal(convert, url)
})

test_that("md_issue returns error without issue number", {
  expect_error(md_issue("k5cents/gluedown", "one"))
})

test_that("md_issue returns error without correct repo format", {
  expect_warning(md_issue("gluedown", 1))
})
