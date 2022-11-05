# gluedown 1.0.6

# gluedown 1.0.5

* Update tests for new markdown package functionality (#29).

# gluedown 1.0.4

* Remove `LazyData` from DESCRIPTION per new CRAN rules. Package has no data.
* The vignettes are more careful when fetching resources from the internet.

# gluedown 1.0.3

* Update `md_table()` tests for rvest 1.0.0 release.
* Create `md_label()` to use with `md_reference()` (#25).
* Try using clean `...` support in `md_link()` and `md_image()` (#26).
* Use `goodpractices::gp()` to fix a few issues:
    1. Trim all lines to under 80 character width.
    2. Use `vapply()` over `sapply()` in `md_setext()`.
* The `md_link()` and `md_image()` functions have half-baked support for using
named `...` arguments instead of the traditional vector arguments. This works
well with a single link but not when trying to turn two lengthy vectors into
multiple markdown links (#26).

# gluedown 1.0.2

* Suggest `markdown` dependency and warn for `md_convert()` (#22).
* Suggest `knitr` dependency and write fallback for `md_table()` (#20).
* Enable named vector support for `md_link()` (#26).

# gluedown 1.0.1

* Remove `md_define()` to avoid pandoc issue (#16, #17).
* Remove all `stringr` functions in place of `base` alternatives (#15).
* Remove `map_md()` function.
* Remove `dplyr` suggestion dependency.
* Remove `httr` tests in `md_issue()`.
* Remove `httr` suggestion dependency.
* Improve vignettes.

# gluedown 1.0.0

* Remove `readr::read_lines()` from docs.
* Cite CommonMark author in `DESCRIPTION`.
* Remove the `%>%` utility and magrittr package.
* Remove all `/docs` and move to `gh-pages` branch.
* Re-submit to CRAN.

# gluedown 0.4.4

* Replace `emphasize_at()` with `map_md()`, which now uses 
`str_split(simplify = TRUE)` and `apply()` instead of `purrr::map_at()`.

# gluedown 0.4.3

* Add vignette walking through all the features of GFM.

# gluedown 0.4.2

* Create `md_disallow()` and add to `md_convert()` (#10).
* Create `md_text()` wrapper for `glue::as_glue()` (#10).
* Create `md_blank()` (#10).

# gluedown 0.4.1

* Cover all errors in `md_rule()` and `md_chunk()`, brings coverage to 100%.

# gluedown 0.4.0

* Add back all the tests from the GFM spec (#13).
* Create `md_autolink()` (#10).

# gluedown 0.3.3

* Add and remove tests from the GFM spec (#13).

# gluedown 0.3.2

* Use `...` in `md_hardline()`, `md_softline()`, and `md_paragraph()`.

# gluedown 0.3.1

* Rename `md-break.R` to `md-rule.R`
* Implement optional spacing in `md_rule()`
* Implement optional custom underline width in `md_setext()`.

# gluedown 0.3.0

* Create `md_paragraph()` and `md_softline()` (#10).

# gluedown 0.2.3

* Rewrite function descriptions with consistent language.

# gluedown 0.2.2

* Check if `any()` number in `md_issue()` can't be coerced to numeric.

# gluedown 0.2.1

* Return glued `md_convert()` output with `glue::as_glue()`.
* Return glued `emphasize_at()` output.
* Add description of `kable` and `markdown` wrapping in `gluedown.R`.

# gluedown 0.2.0

* Update the documentation for block container functions.
* Update the documentation for inline functions.
* Rename `md_list()` to `md_order()`.
* Create generic `md_list()` to call all list types.
* Implement `usethis::use_spell_check()`.
* Improve template GitHub issue.
* Create and delete `md_emoji()` (want the reverse, maybe).

# gluedown 0.1.4

* Split `md_chunk()` into `md_indent()` and `md_fence()`.
* Use `glue::glue_collapse()` in `md_rule()` and `md_table()`.
* Use `stringr::str_dup()` in `md_heading()`, `md_setext()`, and `md_rule()`.
* Update unit tests for the new versions of leaf block functions.
* Update the documentation for leaf block functions.

# gluedown 0.1.2

* Create `md_hardline()` (#10).

# gluedown 0.1.1

* Create `md_setext()` (#10).
* Add family documentation (#11).

# gluedown 0.1.0

* Added a `NEWS.md` file to track changes to the package.
* Use `glue::glue()` everywhere over `paste()` w/ `cat()` (#8).
* Fully test every function argument (_coverage: 97%_) (#9).
