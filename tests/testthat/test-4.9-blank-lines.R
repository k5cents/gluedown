
test_that("md_blank creates lines that are ignored (ex. 197)", {
  # https://github.github.com/gfm/#example-197
  lines <- md_softline(
    "  ",
    md_blank(),
    "aaa",
    "  ",
    md_blank(),
    md_heading("aaa"),
    md_blank(),
    "  "
  )
  md_convert(lines) %>%
    read_html() %>%
    html_element("p") %>%
    html_text() %>%
    expect_equal("aaa")
  md_convert(lines) %>%
    read_html() %>%
    html_element("h1") %>%
    html_text() %>%
    expect_equal("aaa")
})
