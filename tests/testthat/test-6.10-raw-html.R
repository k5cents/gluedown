
test_that("md_convert can optionally disallow certain HTML", {
  "foo" %>%
    md_bold() %>%
    md_convert(disallow = FALSE) %>%
    read_html() %>%
    html_element("strong") %>%
    html_text() %>%
    expect_equal("foo")
})
