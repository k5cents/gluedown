
test_that("md_link can create a valid <href> tag (ex. 493)", {
  # https://github.github.com/gfm/#example-493
  lines <- md_link("link", "/url", "title")
  lines %>%
    md_convert() %>%
    read_html() %>%
    html_element("a") %>%
    html_text(trim = TRUE) %>%
    expect_equal("link")
  lines %>%
    md_convert() %>%
    read_html() %>%
    html_element("a") %>%
    html_attr("href") %>%
    expect_equal("/url")
  lines %>%
    md_convert() %>%
    read_html() %>%
    html_element("a") %>%
    html_attr("title") %>%
    expect_equal("title")
})

test_that("md_link can create <href> tags with a named vector", {
  # no way to use title too
  lines <- md_link(link = "/url")
  lines %>%
    md_convert() %>%
    read_html() %>%
    html_element("a") %>%
    html_text(trim = TRUE) %>%
    expect_equal("link")
  lines %>%
    md_convert() %>%
    read_html() %>%
    html_element("a") %>%
    html_attr("href") %>%
    expect_equal("/url")
  # lines %>%
  #   md_convert() %>%
  #   read_html() %>%
  #   html_element("a") %>%
  #   html_attr("title") %>%
  #   expect_equal("title")
})

test_that("md_link can create <href> tags with a named vector", {
  lines <- md_link(link = "/url")
  lines %>%
    md_convert() %>%
    read_html() %>%
    html_element("a") %>%
    html_text(trim = TRUE) %>%
    expect_equal("link")
  lines %>%
    md_convert() %>%
    read_html() %>%
    html_element("a") %>%
    html_attr("href") %>%
    expect_equal("/url")
})

test_that("md_link can create a valid <href> without title (ex. 494)", {
  # https://github.github.com/gfm/#example-494
  lines <- md_link("link", "/url")
  lines %>%
    md_convert() %>%
    read_html() %>%
    html_element("a") %>%
    html_text(trim = TRUE) %>%
    expect_equal("link")
  lines %>%
    md_convert() %>%
    read_html() %>%
    html_element("a") %>%
    html_attr("href") %>%
    expect_equal("/url")
  lines %>%
    md_convert() %>%
    read_html() %>%
    html_element("a") %>%
    html_attr("title") %>%
    expect_missing()
})

test_that("md_link wrap=TRUE produces angle-bracket destination (spec 0.30)", {
  # CommonMark: spaces in link destinations require angle-bracket wrapping
  result <- as.character(md_link("My File", "path/to/my file.pdf", wrap = TRUE))
  expect_equal(result, "[My File](<path/to/my file.pdf>)")
  result_titled <- as.character(
    md_link("My File", "path/to/my file.pdf", title = "Doc", wrap = TRUE)
  )
  expect_equal(result_titled, "[My File](<path/to/my file.pdf> \"Doc\")")
})

test_that("md_label collapsed form produces [text][] (spec 0.31)", {
  # CommonMark 0.31: collapsed reference link [text][] form
  expect_equal(as.character(md_label("CRAN")), "[CRAN][]")
  expect_equal(
    as.character(md_label(c("foo", "bar"))),
    c("[foo][]", "[bar][]")
  )
})

test_that("md_label collapsed form resolves via md_reference (spec 0.31)", {
  # [CRAN][] + [CRAN]: url → working link
  node <- md_paragraph(
    md_label("CRAN"),
    md_reference("CRAN", "/url")
  ) %>%
    md_convert() %>%
    read_html() %>%
    html_element("a")
  html_text(node, trim = TRUE) %>% expect_equal("CRAN")
  html_attr(node, "href") %>% expect_equal("/url")
})

test_that("md_reference can create an <href> tag (ex. 535)", {
  # https://github.github.com/gfm/#example-535
  lines <- md_reference("bar" = "/url \"title\"")
  md_paragraph("[foo][bar]", lines) %>%
    md_convert() %>%
    read_html() %>%
    html_element("p") %>%
    html_element("a") %>%
    html_text(trim = TRUE) %>%
    expect_equal("foo")
  md_paragraph("[foo][bar]", lines) %>%
    md_convert() %>%
    read_html() %>%
    html_element("p") %>%
    html_element("a") %>%
    html_attr("href") %>%
    expect_equal("/url")
  md_paragraph("[foo][bar]", lines) %>%
    md_convert() %>%
    read_html() %>%
    html_element("p") %>%
    html_element("a") %>%
    html_attr("title") %>%
    expect_equal("title")
})

test_that("md_label and md_reference can create an <href> tag (ex. 535)", {
  # https://github.github.com/gfm/#example-535
  md_paragraph(
    md_label(bar = "foo"),
    md_reference(bar = "/url")
  ) %>%
    md_convert() %>%
    read_html() %>%
    html_element("p") %>%
    html_element("a") %>%
    html_text(trim = TRUE) %>%
    expect_equal("foo")
  md_paragraph(
    md_label(bar = "foo"),
    md_reference(bar = "/url")
  ) %>%
    md_convert() %>%
    read_html() %>%
    html_element("p") %>%
    html_element("a") %>%
    html_attr("href") %>%
    expect_equal("/url")
})

test_that("md_label and md_reference can create an <href> tag (ex. 535)", {
  # https://github.github.com/gfm/#example-535
  md_paragraph(
    md_label("foo", "bar"),
    md_reference("bar", "/url")
  ) %>%
    md_convert() %>%
    read_html() %>%
    html_element("p") %>%
    html_element("a") %>%
    html_text(trim = TRUE) %>%
    expect_equal("foo")
  md_paragraph(
    md_label("foo", "bar"),
    md_reference("bar", "/url")
  ) %>%
    md_convert() %>%
    read_html() %>%
    html_element("p") %>%
    html_element("a") %>%
    html_attr("href") %>%
    expect_equal("/url")
})

