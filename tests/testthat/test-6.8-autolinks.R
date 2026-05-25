
test_that("md_autolink creates a <a> tag (ex. 602)", {
  # https://github.github.com/gfm/#example-602
  url <- "http://foo.bar.baz"
  md_autolink(url) %>%
    md_convert() %>%
    read_html() %>%
    html_element("a") %>%
    html_attr("href") %>%
    expect_equal(url)
})
