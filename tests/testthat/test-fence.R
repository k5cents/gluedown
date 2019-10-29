library(testthat)
library(gluedown)
library(stringr)
library(rvest)

test_that("md_chunk produces non-styled valid HTML fence blocks", {
  lines <- c("library(dplyr)", "starwars %>%", "filter(species == 'Droid')")
  read <- lines %>%
    md_chunk() %>%
    md_convert() %>%
    read_html() %>%
    html_node("code") %>%
    html_text(trim = TRUE)

  raw <- paste(lines, collapse = "\n")
  expect_equal(read, raw)
})

test_that("md_chunk produces non-styled valid HTML ident blocks", {
  lines <- c("library(dplyr)", "starwars %>%", "filter(species == 'Droid')")
  read <- lines %>%
    md_chunk(type = "indent") %>%
    md_convert() %>%
    read_html() %>%
    html_node("code") %>%
    html_text(trim = TRUE)

  raw <- paste(lines, collapse = "\n")
  expect_equal(read, raw)
})

test_that("md_chunk produces non-styled valid HTML tilde blocks", {
  lines <- c("library(dplyr)", "starwars %>%", "filter(species == 'Droid')")
  read <- lines %>%
    md_chunk(type = "tilde") %>%
    md_convert() %>%
    read_html() %>%
    html_node("code") %>%
    html_text(trim = TRUE)

  raw <- paste(lines, collapse = "\n")
  expect_equal(read, raw)
})
