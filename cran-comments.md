## Test environments

* local: ubuntu 20.04.2, R 4.0.3
* [github-actions][gh_act]:
    * windows-latest
    * macOS-latest
    * ubuntu-20.04 (release)
    * ubuntu-20.04 (devel)
* r-hub: 
    * [windows-x86_64-devel][rhub_win]
    * [ubuntu-gcc-release][rhub_ubu]
    * [fedora-clang-devel][rhub_fed]
* win-builder: windows-x86_64-devel

## R CMD check results

0 errors | 0 warnings | 0 notes

## Resubmission

* Remove `LazyData` from DESCRIPTION per new CRAN rules. Package has no data.
* Used `tryCatch()` when downloading data. Can run without internet connection.

<!-- links: start -->
[gh_act]: https://github.com/kiernann/gluedown/actions
[rhub_win]: https://builder.r-hub.io/status/gluedown_1.0.4.tar.gz-d803fb486c644b2fbcb7d62ca5b1d405
[rhub_ubu]: https://builder.r-hub.io/status/gluedown_1.0.4.tar.gz-17912d7e2d5f46098b4ebf2755096ffd
[rhub_fed]: https://builder.r-hub.io/status/gluedown_1.0.4.tar.gz-0d4589b34c1648e58a641fcb1c1044e4
<!-- links: end -->
