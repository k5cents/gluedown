
test_that("md_softline creates a single <p> tag (ex. 669)", {
  # https://github.github.com/gfm/#example-669
  x <- c("foo", "baz")
  y <- str_c(x, collapse = "\n")
  md_softline(x) %>%
    md_convert() %>%
    read_html() %>%
    html_element("p") %>%
    html_text() %>%
    expect_equal(y)
})
