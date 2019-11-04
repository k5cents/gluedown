library(testthat)
library(gluedown)
library(rvest)
library(glue)

test_that("md_disallow removes certain tags (ex. 653)", {
  # https://github.github.com/gfm/#example-653
  a <- "<strong> <title> <style> <em> <blockquote> <xmp> is disallowed. <XMP> is also disallowed. </blockquote>"
  b <- "<strong> &lt;title> &lt;style> <em> <blockquote> &lt;xmp> is disallowed. &lt;XMP> is also disallowed. </blockquote>"
  md_disallow(a) %>% expect_equal(b)
})
