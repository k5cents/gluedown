library(testthat)
library(gluedown)
library(rvest)

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

test_that("md_link creates a string convertable to HTML text", {
  text <- "link"
  node <- md_link(text, "https://github.com/kiernann/gluedown") %>%
    md_convert() %>%
    read_html() %>%
    html_node("a") %>%
    html_text()
  expect_equal(text, node)
})

test_that("", {
  url <- "https://github.com/kiernann/gluedown"
  text <- "link[link]"
  ref <- md_reference("link", url)
  link <- str_c(text, ref, sep = "\n")
  node <- link %>%
    md_convert() %>%
    read_html() %>%
    html_node("a") %>%
    html_attr("href")
  expect_equal(url, node)
})
