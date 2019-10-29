# gluedown 0.1.4

* Split `md_chunk()` into `md_indent()` and `md_fence()`.
* Use `glue::glue_collapse()` in `md_rule()` and `md_table()`.
* Use `stringr::str_dup()` in `md_heading()`, `md_setext()`, and `md_rule()`.
* Update unit tests for the new versions of leaf block functions.
* Update the documentation for leaf block functions.
* _Todo: Improve the rest of the documentation_*.

# gluedown 0.1.2

* Create `md_hardline()` (#10).

# gluedown 0.1.1

* Create `md_setext()` (#10).
* Add family documentation (#11).

# gluedown 0.1.0

* Added a `NEWS.md` file to track changes to the package.
* Use `glue::glue()` everywhere over `paste()` w/ `cat()` (#8).
* Fully test every function argument (_coverage: 97%_) (#9).
