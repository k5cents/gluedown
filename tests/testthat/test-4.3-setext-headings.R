library(testthat)
library(gluedown)
library(glue)
library(rvest)

test_that("md_setext errors at levels greater than 2", {
  expect_error(md_setext("Foo", 3))
})

test_that("md_setext creates <h1> and <h2> tags (ex. 50)", {
  # https://github.github.com/gfm/#example-50
  lines <- md_setext("Foo _bar_", 1:2)
  for (i in seq_along(lines)) {
    node <- md_convert(lines) %>%
      find_nodes(paste0("h", i)) %>%
      html_text(trim = TRUE)
    expect_equal(node, "Foo bar")
  }
})

test_that("md_setext can create <h1> with newlines (ex. 51)", {
  # https://github.github.com/gfm/#example-51
  lines <- md_setext(paste("Foo", md_italic("bar\nbaz")))
  node <- md_convert(lines) %>% find_nodes("h1")
  expect_full(node)
})

test_that("md_setext underline can be any length (ex. 52)", {
  # https://github.github.com/gfm/#example-53
  lines <- md_setext("Foo", level = 2:1, width = c(25, 1))
  for (i in rev(seq_along(lines))) {
    node <- md_convert(lines) %>%
      find_nodes(paste0("h", i)) %>%
      html_text(trim = TRUE)
    expect_equal(node, "Foo")
  }
})

test_that("md_setext can be indented and not line up (ex. 54)", {
  # https://github.github.com/gfm/#example-54
  line <- md_setext("   Foo", level = 2, width = 3)
  node <- md_convert(line) %>%
    find_nodes("h2") %>%
    html_text(trim = TRUE)
  expect_equal(node, "Foo")
  line <- md_setext("  Foo", level = 2, width = 5)
  node <- md_convert(line) %>%
    find_nodes("h2") %>%
    html_text(trim = TRUE)
  expect_equal(node, "Foo")
})

test_that("md_setext errors if an empty heading is used (ex. 67)", {
  # https://github.github.com/gfm/#example-67
  expect_error(md_setext(""))
})
