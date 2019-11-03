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
