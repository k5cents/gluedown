library(testthat)
library(gluedown)
library(stringr)
library(rvest)
library(knitr)
library(httr)
library(glue)

test_that("md_issue creates GitHub auto-link URL", {
  issue <- md_issue("kiernann/gluedown", 1)
  convert <- str_c("https://github.com/", str_replace(issue, "#", "/issues/"))
  url <- "https://github.com/kiernann/gluedown/issues/1"
  expect_equal(convert, url)
})

test_that("md_issue creates a URL that exists", {
  issue <- md_issue("kiernann/gluedown", 1)
  convert <- str_c("https://github.com/", str_replace(issue, "#", "/issues/"))
  status <- status_code(GET(convert))
  expect_equal(status, 200)
})

test_that("md_issue returns error without issue number", {
  expect_error(md_issue("kiernann/gluedown", "one"))
})

test_that("md_issue returns error without correct repo format", {
  expect_warning(md_issue("gluedown", 1))
})
