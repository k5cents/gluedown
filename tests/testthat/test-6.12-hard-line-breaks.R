
test_that("md_hardline creates a <br /> tag (ex. 655)", {
  # https://github.github.com/gfm/#example-655
  x <- c("foo", "baz")
  x %>%
    md_hardline() %>%
    md_convert() %>%
    read_html() %>%
    html_element("br") %>%
    expect_full()
})
