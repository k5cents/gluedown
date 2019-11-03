library(testthat)
library(gluedown)
library(glue)
library(rvest)

find_nodes <- function(md, node) {
  md %>%
    md_convert() %>%
    read_html() %>%
    html_nodes(node)
}

expect_empty <- function(object) {
  expect_true(length(object) == 0)
}

expect_full <- function(object) {
  expect_true(length(object) != 0)
}

test_that("md_rule creates <hr> tags (ex. 13)", {
  # https://github.github.com/gfm/#example-13
  node1 <- md_rule("*", 3) %>% find_nodes("hr")
  node2 <- md_rule("-", 3) %>% find_nodes("hr")
  node3 <- md_rule("_", 3) %>% find_nodes("hr")
  expect_false(is.na(node1))
  expect_false(is.na(node2))
  expect_false(is.na(node3))
})

test_that("md_rule doesn't allow invalid characters (ex. 14-15)", {
  # https://github.github.com/gfm/#example-14
  expect_error(md_rule("+"))
  # https://github.github.com/gfm/#example-15
  expect_error(md_rule("="))
})

test_that("md_rule doesn't too few characters (ex. 16)", {
  # https://github.github.com/gfm/#example-16
  expect_error(md_rule("-", 2))
  expect_error(md_rule("*", 2))
  expect_error(md_rule("_", 2))
})

test_that("md_rule allows more than 3 characters (ex. 20)", {
  # https://github.github.com/gfm/#example-20
  node <- md_rule("-", 37) %>% find_nodes("hr")
  expect_false(is.na(node))
})

test_that("md_rule do not need blank lines (ex. 27", {
  skip("This seems to be an error with conversion via pandoc, etc")
  # https://github.github.com/gfm/#example-27
  lines <- md_softline(
    md_bullet("foo", "-"),
    md_rule(),
    md_bullet("bar", "-")
  )
  md_convert(lines)
})

test_that("md_rule can interupt a paragraph (ex. 28", {
  # https://github.github.com/gfm/#example-28
  lines <- md_softline("Foo", md_rule("*"), "Bar")
  node <- md_convert(lines) %>% find_nodes("hr")
  expect_false(is.na(node))
})

test_that("md_rule with hyphens creates <h2> tag not <hr> (ex. 29)", {
  # https://github.github.com/gfm/#example-29
  lines <- md_softline("Foo", md_rule("-"), "Bar")
  node1 <- md_convert(lines) %>% find_nodes("hr")
  node2 <- md_convert(lines) %>% find_nodes("h2")
  expect_empty(node1)
  expect_full(node2)
})

test_that("md_rule takes precedence over list item (ex. 30)", {
  skip("This seems to be an error with conversion via pandoc, etc")
  # https://github.github.com/gfm/#example-30
  lines <- md_softline(
    md_bullet("Foo"),
    md_rule(space = TRUE),
    md_bullet("Bar")
  )
  node <- md_convert(lines)
})

test_that("md_rule can creat a <h2> withing a hypeh bullet list (ex. 31)", {
  skip("This seems to be an error with conversion via pandoc, etc")
  # https://github.github.com/gfm/#example-31
  lines <- c("Foo", md_rule(space = TRUE)) %>% md_bullet("-")
  node <- md_convert(lines) %>%
    find_nodes("li") %>%
    html_node("hr")
  expect_false(is.na(node[2]))
})

test_that("md_rule works with sep of any length", {
  md_rule(space = 0) %>% find_nodes("hr") %>% expect_full()
  md_rule(space = 1) %>% find_nodes("hr") %>% expect_full()
  md_rule(space = 10) %>% find_nodes("hr") %>% expect_full()
  md_rule(space = TRUE) %>% find_nodes("hr") %>% expect_full()
  md_rule(space = FALSE) %>% find_nodes("hr") %>% expect_full()
})
