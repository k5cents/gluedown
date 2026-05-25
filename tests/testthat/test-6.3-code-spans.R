
test_that("md_code creates a <code> tag (ex. 338)", {
  # https://github.github.com/gfm/#example-338
  md_code("foo") %>%
    md_convert() %>%
    read_html() %>%
    html_element("code") %>%
    html_text() %>%
    expect_equal("foo")
})

test_that("md_code double backticks if code contains backtick (ex. 339)", {
  # https://github.github.com/gfm/#example-339
  md_code("foo ` bar") %>%
    md_convert() %>%
    read_html() %>%
    html_element("code") %>%
    html_text() %>%
    expect_equal("foo ` bar")
})

test_that("md_code normalizes newlines to spaces (spec 0.29)", {
  # CommonMark: line endings in code spans are converted to spaces
  expect_equal(as.character(md_code("foo\nbar")), "`foo bar`")
  expect_equal(as.character(md_code("foo\nbar\nbaz")), "`foo bar baz`")
})
