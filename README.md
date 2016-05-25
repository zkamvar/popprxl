
<!-- README.md is generated from README.Rmd. Please edit that file -->
popprxl
=======

[![Build Status](https://travis-ci.org/zkamvar/popprxl.svg?branch=master)](https://travis-ci.org/zkamvar/popprxl) [![Coverage Status](https://coveralls.io/repos/zkamvar/popprxl/badge.svg?branch=master&service=github)](https://coveralls.io/github/zkamvar/popprxl?branch=master)

On CRAN:
[![Downloads from Rstudio mirror per month](http://cranlogs.r-pkg.org/badges/popprxl)](http://www.r-pkg.org/pkg/popprxl) [![Downloads from Rstudio mirror](http://cranlogs.r-pkg.org/badges/grand-total/popprxl)](http://www.r-pkg.org/pkg/popprxl) [![CRAN version](http://www.r-pkg.org/badges/version/popprxl)](http://www.r-pkg.org/pkg/popprxl)

A small package that allows import of GenAlEx data directly into poppr from excel.

Setup is simple.

From CRAN:

``` r
install.packages("popprxl")
```

From GitHub:

``` r
install.packages("devtools")
install_github("zkamvar/popprxl")
```

popprxl has one function: **`read.genalexcel()`**. It can be used to read in GenAlEx data directly from excel:

``` r
library("popprxl")
#> Loading required package: poppr
#> Loading required package: adegenet
#> Loading required package: ade4
#> 
#>    /// adegenet 2.0.1 is loaded ////////////
#> 
#>    > overview: '?adegenet'
#>    > tutorials/doc/questions: 'adegenetWeb()' 
#>    > bug reports/feature requests: adegenetIssues()
#> This is poppr version 2.1.1. To get started, type package?poppr
#> OMP parallel support: unavailable
#> 
#> popprxl is loaded. Use read.genalexcel() to read in your data.
nancyxlsx <- system.file("files/nancycats.xlsx", package = "popprxl")
(nancy    <- read.genalexcel(nancyxlsx))
#> 
#> This is a genclone object
#> -------------------------
#> Genotype information:
#> 
#>    237 original multilocus genotypes 
#>    237 diploid individuals
#>      9 codominant loci
#> 
#> Population information:
#> 
#>      1 stratum - Pop
#>     17 populations defined - P01 P02 P03 ... P15 P16 P17
```
