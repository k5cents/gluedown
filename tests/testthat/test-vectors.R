test_that("vector inputs return vector outputs", {
  expect_type(
    object = md_list(state.name),
    type = "character"
  )
  expect_true(
    object = length(state.name[1:5]) == 5
  )
})

test_that("vector inputs return same length outputs", {
  expect_equal(
    object = length(state.name),
    expected = length(md_list(state.name))
  )
  expect_equal(
    object = length(state.name),
    expected = length(md_bullet(state.name))
  )
  expect_equal(
    object = length(state.name),
    expected = length(md_quote(state.name))
  )
  expect_equal(
    object = length(state.name),
    expected = length(md_task(state.name))
  )
})
