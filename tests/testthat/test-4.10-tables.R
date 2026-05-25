
test_that("md_table creates a single <table> tag (ex. 198)", {
  # https://github.github.com/gfm/#example-198
  df <- data.frame(
    foo = "baz",
    bar = "bim",
    stringsAsFactors = FALSE
  )
  node <- md_table(df) %>%
    md_convert() %>%
    read_html() %>%
    html_element("table") %>%
    html_table() %>%
    as.data.frame()
  expect_equal(node, df)
})

test_that("md_table can create a table with no body (ex. 205)", {
  # https://github.github.com/gfm/#example-205
  df <- data.frame(
    foo = logical(),
    bar = logical(),
    stringsAsFactors = FALSE
  )
  node <- md_table(df) %>%
    md_convert() %>%
    read_html() %>%
    html_element("table") %>%
    html_table() %>%
    as.data.frame()
  expect_equal(node, df)
})

test_that("md_table works without knitr", {
  local_mocked_bindings(has_knitr = function() FALSE)
  df <- data.frame(
    foo = "baz",
    bar = "bim",
    stringsAsFactors = FALSE
  )
  md <- md_table(df)
  node <- md %>%
    md_convert() %>%
    read_html() %>%
    html_element("table") %>%
    html_table() %>%
    as.data.frame()
  expect_equal(node, df)
})

test_that("md_table works without knitr and no body", {
  local_mocked_bindings(has_knitr = function() FALSE)
  df <- data.frame(
    foo = logical(),
    bar = logical(),
    stringsAsFactors = FALSE
  )
  md <- md_table(df)
  node <- md %>%
    md_convert() %>%
    read_html() %>%
    html_element("table") %>%
    html_table() %>%
    as.data.frame()
  expect_equal(node, df)
})
