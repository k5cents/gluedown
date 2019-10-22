library(gluedown)
library(stringr)

test_that("sequential lists are possible", {
  md_list(state.name, seq = TRUE) %>%
    str_extract("^.+?(?=\\.)") %>%
    as.numeric() -> x
  expect_true(all(diff(x) == 1))
})
