# Changelog

## gluedown 1.1.0

- Fix
  [`md_code()`](https://k5cents.github.io/gluedown/reference/md_code.md)
  vectorization bug: double-backtick escaping was applied to all
  elements whenever *any* element contained a backtick. Now each element
  is escaped independently
  ([\#38](https://github.com/k5cents/gluedown/issues/38)).
- Fix
  [`md_setext()`](https://k5cents.github.io/gluedown/reference/md_setext.md)
  when `width = FALSE`: previously behaved identically to `width = TRUE`
  due to `min(FALSE) < 1` evaluating to `TRUE`
  ([\#37](https://github.com/k5cents/gluedown/issues/37)).
- Fix
  [`md_issue()`](https://k5cents.github.io/gluedown/reference/md_issue.md)
  emitting one warning per element instead of once when elements are
  missing the `"user/repo"` format
  ([\#36](https://github.com/k5cents/gluedown/issues/36)).
- Remove `mockr` from suggested dependencies; mocking now uses
  [`testthat::local_mocked_bindings()`](https://testthat.r-lib.org/reference/local_mocked_bindings.html)
  ([\#34](https://github.com/k5cents/gluedown/issues/34)).
- Fix
  [`md_code()`](https://k5cents.github.io/gluedown/reference/md_code.md)
  to normalize newlines to spaces within code spans, per the CommonMark
  spec.
- Fix
  [`md_fence()`](https://k5cents.github.io/gluedown/reference/md_fence.md)
  to trim leading/trailing whitespace from the info string, per the
  CommonMark 0.29 spec. Tilde fences now also error when the info string
  contains a tilde character (backtick fences already enforced this).
- Fix
  [`md_setext()`](https://k5cents.github.io/gluedown/reference/md_setext.md)
  auto-width to measure trimmed content, so leading/trailing whitespace
  in heading text does not inflate the underline length.
- Add `method` argument to
  [`md_hardline()`](https://k5cents.github.io/gluedown/reference/md_hardline.md):
  `"backslash"` produces a backslash hard line break (`foo\`) as an
  alternative to the default two-trailing-spaces form.
- Add collapsed reference link support to
  [`md_label()`](https://k5cents.github.io/gluedown/reference/md_label.md):
  omitting `label` now produces `[text][]`, which resolves against a
  matching
  [`md_reference()`](https://k5cents.github.io/gluedown/reference/md_reference.md).
- Add `wrap` argument to
  [`md_link()`](https://k5cents.github.io/gluedown/reference/md_link.md)
  and
  [`md_image()`](https://k5cents.github.io/gluedown/reference/md_image.md):
  `wrap = TRUE` wraps the destination in angle brackets (`<url>`),
  required when the URL contains spaces.

## gluedown 1.0.9

CRAN release: 2024-03-11

- Update maintainer email, website URL, and GitHub URL.

## gluedown 1.0.8

CRAN release: 2023-12-21

- Merge pull request
  [\#31](https://github.com/k5cents/gluedown/issues/31) from
  yihui/patch-1
  - Updated
    [`md_convert()`](https://k5cents.github.io/gluedown/reference/md_convert.md)
    for changes in the markdown package.

## gluedown 1.0.5

CRAN release: 2022-11-05

- Update tests for new markdown package functionality
  ([\#29](https://github.com/k5cents/gluedown/issues/29)).

## gluedown 1.0.4

CRAN release: 2021-05-10

- Remove `LazyData` from DESCRIPTION per new CRAN rules. Package has no
  data.
- The vignettes are more careful when fetching resources from the
  internet.

## gluedown 1.0.3

CRAN release: 2021-02-06

- Update
  [`md_table()`](https://k5cents.github.io/gluedown/reference/md_table.md)
  tests for rvest 1.0.0 release.
- Create
  [`md_label()`](https://k5cents.github.io/gluedown/reference/md_label.md)
  to use with
  [`md_reference()`](https://k5cents.github.io/gluedown/reference/md_reference.md)
  ([\#25](https://github.com/k5cents/gluedown/issues/25)).
- Try using clean `...` support in
  [`md_link()`](https://k5cents.github.io/gluedown/reference/md_link.md)
  and
  [`md_image()`](https://k5cents.github.io/gluedown/reference/md_image.md)
  ([\#26](https://github.com/k5cents/gluedown/issues/26)).
- Use `goodpractices::gp()` to fix a few issues:
  1.  Trim all lines to under 80 character width.
  2.  Use [`vapply()`](https://rdrr.io/r/base/lapply.html) over
      [`sapply()`](https://rdrr.io/r/base/lapply.html) in
      [`md_setext()`](https://k5cents.github.io/gluedown/reference/md_setext.md).
- The
  [`md_link()`](https://k5cents.github.io/gluedown/reference/md_link.md)
  and
  [`md_image()`](https://k5cents.github.io/gluedown/reference/md_image.md)
  functions have half-baked support for using named `...` arguments
  instead of the traditional vector arguments. This works well with a
  single link but not when trying to turn two lengthy vectors into
  multiple markdown links
  ([\#26](https://github.com/k5cents/gluedown/issues/26)).

## gluedown 1.0.2

CRAN release: 2020-01-14

- Suggest `markdown` dependency and warn for
  [`md_convert()`](https://k5cents.github.io/gluedown/reference/md_convert.md)
  ([\#22](https://github.com/k5cents/gluedown/issues/22)).
- Suggest `knitr` dependency and write fallback for
  [`md_table()`](https://k5cents.github.io/gluedown/reference/md_table.md)
  ([\#20](https://github.com/k5cents/gluedown/issues/20)).
- Enable named vector support for
  [`md_link()`](https://k5cents.github.io/gluedown/reference/md_link.md)
  ([\#26](https://github.com/k5cents/gluedown/issues/26)).

## gluedown 1.0.1

CRAN release: 2019-12-09

- Remove `md_define()` to avoid pandoc issue
  ([\#16](https://github.com/k5cents/gluedown/issues/16),
  [\#17](https://github.com/k5cents/gluedown/issues/17)).
- Remove all `stringr` functions in place of `base` alternatives
  ([\#15](https://github.com/k5cents/gluedown/issues/15)).
- Remove `map_md()` function.
- Remove `dplyr` suggestion dependency.
- Remove `httr` tests in
  [`md_issue()`](https://k5cents.github.io/gluedown/reference/md_issue.md).
- Remove `httr` suggestion dependency.
- Improve vignettes.

## gluedown 1.0.0

CRAN release: 2019-11-28

- Remove `readr::read_lines()` from docs.
- Cite CommonMark author in `DESCRIPTION`.
- Remove the `%>%` utility and magrittr package.
- Remove all `/docs` and move to `gh-pages` branch.
- Re-submit to CRAN.

## gluedown 0.4.4

- Replace `emphasize_at()` with `map_md()`, which now uses
  `str_split(simplify = TRUE)` and
  [`apply()`](https://rdrr.io/r/base/apply.html) instead of
  [`purrr::map_at()`](https://purrr.tidyverse.org/reference/map_if.html).

## gluedown 0.4.3

- Add vignette walking through all the features of GFM.

## gluedown 0.4.2

- Create
  [`md_disallow()`](https://k5cents.github.io/gluedown/reference/md_disallow.md)
  and add to
  [`md_convert()`](https://k5cents.github.io/gluedown/reference/md_convert.md)
  ([\#10](https://github.com/k5cents/gluedown/issues/10)).
- Create
  [`md_text()`](https://k5cents.github.io/gluedown/reference/md_text.md)
  wrapper for
  [`glue::as_glue()`](https://glue.tidyverse.org/reference/as_glue.html)
  ([\#10](https://github.com/k5cents/gluedown/issues/10)).
- Create
  [`md_blank()`](https://k5cents.github.io/gluedown/reference/md_blank.md)
  ([\#10](https://github.com/k5cents/gluedown/issues/10)).

## gluedown 0.4.1

- Cover all errors in
  [`md_rule()`](https://k5cents.github.io/gluedown/reference/md_rule.md)
  and
  [`md_chunk()`](https://k5cents.github.io/gluedown/reference/md_chunk.md),
  brings coverage to 100%.

## gluedown 0.4.0

- Add back all the tests from the GFM spec
  ([\#13](https://github.com/k5cents/gluedown/issues/13)).
- Create
  [`md_autolink()`](https://k5cents.github.io/gluedown/reference/md_autolink.md)
  ([\#10](https://github.com/k5cents/gluedown/issues/10)).

## gluedown 0.3.3

- Add and remove tests from the GFM spec
  ([\#13](https://github.com/k5cents/gluedown/issues/13)).

## gluedown 0.3.2

- Use `...` in
  [`md_hardline()`](https://k5cents.github.io/gluedown/reference/md_hardline.md),
  [`md_softline()`](https://k5cents.github.io/gluedown/reference/md_softline.md),
  and
  [`md_paragraph()`](https://k5cents.github.io/gluedown/reference/md_paragraph.md).

## gluedown 0.3.1

- Rename `md-break.R` to `md-rule.R`
- Implement optional spacing in
  [`md_rule()`](https://k5cents.github.io/gluedown/reference/md_rule.md)
- Implement optional custom underline width in
  [`md_setext()`](https://k5cents.github.io/gluedown/reference/md_setext.md).

## gluedown 0.3.0

- Create
  [`md_paragraph()`](https://k5cents.github.io/gluedown/reference/md_paragraph.md)
  and
  [`md_softline()`](https://k5cents.github.io/gluedown/reference/md_softline.md)
  ([\#10](https://github.com/k5cents/gluedown/issues/10)).

## gluedown 0.2.3

- Rewrite function descriptions with consistent language.

## gluedown 0.2.2

- Check if [`any()`](https://rdrr.io/r/base/any.html) number in
  [`md_issue()`](https://k5cents.github.io/gluedown/reference/md_issue.md)
  can’t be coerced to numeric.

## gluedown 0.2.1

- Return glued
  [`md_convert()`](https://k5cents.github.io/gluedown/reference/md_convert.md)
  output with
  [`glue::as_glue()`](https://glue.tidyverse.org/reference/as_glue.html).
- Return glued `emphasize_at()` output.
- Add description of `kable` and `markdown` wrapping in `gluedown.R`.

## gluedown 0.2.0

- Update the documentation for block container functions.
- Update the documentation for inline functions.
- Rename
  [`md_list()`](https://k5cents.github.io/gluedown/reference/md_list.md)
  to
  [`md_order()`](https://k5cents.github.io/gluedown/reference/md_order.md).
- Create generic
  [`md_list()`](https://k5cents.github.io/gluedown/reference/md_list.md)
  to call all list types.
- Implement `usethis::use_spell_check()`.
- Improve template GitHub issue.
- Create and delete `md_emoji()` (want the reverse, maybe).

## gluedown 0.1.4

- Split
  [`md_chunk()`](https://k5cents.github.io/gluedown/reference/md_chunk.md)
  into
  [`md_indent()`](https://k5cents.github.io/gluedown/reference/md_indent.md)
  and
  [`md_fence()`](https://k5cents.github.io/gluedown/reference/md_fence.md).
- Use
  [`glue::glue_collapse()`](https://glue.tidyverse.org/reference/glue_collapse.html)
  in
  [`md_rule()`](https://k5cents.github.io/gluedown/reference/md_rule.md)
  and
  [`md_table()`](https://k5cents.github.io/gluedown/reference/md_table.md).
- Use
  [`stringr::str_dup()`](https://stringr.tidyverse.org/reference/str_dup.html)
  in
  [`md_heading()`](https://k5cents.github.io/gluedown/reference/md_heading.md),
  [`md_setext()`](https://k5cents.github.io/gluedown/reference/md_setext.md),
  and
  [`md_rule()`](https://k5cents.github.io/gluedown/reference/md_rule.md).
- Update unit tests for the new versions of leaf block functions.
- Update the documentation for leaf block functions.

## gluedown 0.1.2

- Create
  [`md_hardline()`](https://k5cents.github.io/gluedown/reference/md_hardline.md)
  ([\#10](https://github.com/k5cents/gluedown/issues/10)).

## gluedown 0.1.1

- Create
  [`md_setext()`](https://k5cents.github.io/gluedown/reference/md_setext.md)
  ([\#10](https://github.com/k5cents/gluedown/issues/10)).
- Add family documentation
  ([\#11](https://github.com/k5cents/gluedown/issues/11)).

## gluedown 0.1.0

- Added a `NEWS.md` file to track changes to the package.
- Use [`glue::glue()`](https://glue.tidyverse.org/reference/glue.html)
  everywhere over [`paste()`](https://rdrr.io/r/base/paste.html) w/
  [`cat()`](https://rdrr.io/r/base/cat.html)
  ([\#8](https://github.com/k5cents/gluedown/issues/8)).
- Fully test every function argument (*coverage: 97%*)
  ([\#9](https://github.com/k5cents/gluedown/issues/9)).
