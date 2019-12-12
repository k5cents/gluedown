## Test environments

* local: linux-gnu-3.6.1
* travis: 3.3, oldrel, release, devel
* r-hub: windows-x86_64-devel, ubuntu-gcc-release, fedora-clang-devel
* win-builder: windows-x86_64-devel

## R CMD check results

0 errors | 0 warnings | 0 notes

## Resubmission

Solves CRAN check issues when installing `knitr` (pandoc) and `stringi`.

* Depends on R >= 3.3
* No longer imports:
  * `stringr`
  * `knitr`
* Now suggests:
  * `httr`
* No longer suggests:
  * `dplyr`
  * `httr`
* Removes functions:
  * `md_define()`
  * `map_md()`
