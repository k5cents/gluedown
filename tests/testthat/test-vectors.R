test_that("vector inputs return vector outputs", {
  expect_type(
    object = md_list(state.name),
    type = "character"
  )
  expect_true(
    object = is.vector(md_list(state.name))
  )
})

test_that("vector inputs return same length outputs", {
  expect_equal(
    object = length(state.name),
    expected = length(md_list(state.name, cat = FALSE))
  )
  expect_equal(
    object = length(state.name),
    expected = length(md_bullet(state.name, cat = FALSE))
  )
  expect_equal(
    object = length(state.name),
    expected = length(md_quote(state.name, cat = FALSE))
  )
  expect_equal(
    object = length(state.name),
    expected = length(md_task(state.name, cat = FALSE))
  )
})
