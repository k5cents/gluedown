library(testthat)
library(gluedown)
library(stringr)
library(rvest)
library(httr)

test_that("md_image make an string convertable to an HTML <img> tag", {
  node <- "man/figures/logo.png" %>%
    md_image(alt = "logo") %>%
    md_convert() %>%
    read_html() %>%
    html_node("img")
  expect_false(object = is.na(node))
})

test_that("md_link creates a string convertable to HTML href url", {
  url <- "https://github.com/kiernann/gluedown"
  node <- md_link("link", url) %>%
    md_convert() %>%
    read_html() %>%
    html_node("a") %>%
    html_attr("href")
  expect_equal(url, node)
})

test_that("md_link creates a string with valid title", {
  url <- "https://github.com/kiernann/gluedown"
  node <- md_link("link", url, "gluedown") %>%
    md_convert() %>%
    read_html() %>%
    html_node("a") %>%
    html_attr("href")
  expect_equal(url, node)
})

test_that("md_link creates a string convertable to HTML text", {
  text <- "link"
  node <- md_link(text, "https://github.com/kiernann/gluedown") %>%
    md_convert() %>%
    read_html() %>%
    html_node("a") %>%
    html_text()
  expect_equal(text, node)
})

test_that("md_reference creates a string convertable to HTML href url", {
  url <- "https://github.com/kiernann/gluedown"
  text <- "link[1]"
  ref <- md_reference("1", url)
  link <- str_c(text, ref, sep = "\n")
  node <- link %>%
    md_convert() %>%
    read_html() %>%
    html_node("a") %>%
    html_attr("href")
  expect_equal(url, node)
})

test_that("md_reference creates a string with valid title", {
  url <- "https://github.com/kiernann/gluedown"
  text <- "link[1]"
  ref <- md_reference("1", url, "one")
  link <- str_c(text, ref, sep = "\n")
  node <- link %>%
    md_convert() %>%
    read_html() %>%
    html_node("a") %>%
    html_attr("href")
  expect_equal(url, node)
})

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
