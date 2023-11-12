
<!-- README.md is generated from README.Rmd. Please edit that file -->

# HW3

<!-- badges: start -->
<!-- badges: end -->

The goal of HW3 is to …

## Installation

You can install the development version of HW3 from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("Kumachar/BIOSTAT625HW3B")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(HW3)
usethis::use_github_actions()
#> Warning: `use_github_actions()` was deprecated in usethis 2.2.0.
#> i Please use the `check-release` argument of `use_github_action()` instead.
#> This warning is displayed once every 8 hours.
#> Call `lifecycle::last_lifecycle_warnings()` to see where this warning was
#> generated.
#> v Setting active project to 'E:/Umich/625/HW3'
#> v Creating '.github/'
#> v Adding '^\\.github$' to '.Rbuildignore'
#> v Adding '*.html' to '.github/.gitignore'
#> v Creating '.github/workflows/'
#> v Saving 'r-lib/actions/examples/check-release.yaml@v2' to '.github/workflows/R-CMD-check.yaml'
#> * Learn more at <https://github.com/r-lib/actions/blob/v2/examples/README.md>.
#> v Adding R-CMD-check badge to 'README.Rmd'
#> * Re-knit 'README.Rmd' with `devtools::build_readme()`
usethis::use_coverage()
#> v Writing 'codecov.yml'
#> v Adding '^codecov\\.yml$' to '.Rbuildignore'
#> x The 'origin' remote is configured, but we can't determine its default branch.
#>   Possible reasons:
#>   - The remote repo no longer exists, suggesting the local remote should
#>     be deleted.
#>   - We are offline or that specific Git server is down.
#>   - You don't have the necessary permission or something is wrong with
#>     your credentials.
#> v Adding Codecov test coverage badge to 'README.Rmd'
#> * Re-knit 'README.Rmd' with `devtools::build_readme()`
#> * Call `use_github_action("test-coverage")` to continuously monitor test coverage.
usethis::use_github_action("test-coverage")
#> v Saving 'r-lib/actions/examples/test-coverage.yaml@v2' to '.github/workflows/test-coverage.yaml'
#> * Learn more at <https://github.com/r-lib/actions/blob/v2/examples/README.md>.
## basic example code
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
