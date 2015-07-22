# popprxl

[![Build Status](https://travis-ci.org/zkamvar/popprxl.svg?branch=master)](https://travis-ci.org/zkamvar/popprxl)
[![Coverage Status](https://coveralls.io/repos/zkamvar/popprxl/badge.svg?branch=master&service=github)](https://coveralls.io/github/zkamvar/popprxl?branch=master)

On CRAN:    
[![Downloads from Rstudio mirror per month](http://cranlogs.r-pkg.org/badges/popprxl)](http://www.r-pkg.org/pkg/popprxl)
[![Downloads from Rstudio mirror](http://cranlogs.r-pkg.org/badges/grand-total/popprxl)](http://www.r-pkg.org/pkg/popprxl)
[![CRAN version](http://www.r-pkg.org/badges/version/popprxl)](http://www.r-pkg.org/pkg/popprxl)

A small package that allows import of GenAlEx data directly into poppr from excel.

Setup is simple.

From GitHub:

```r
install.packages("devtools")
install_github("zkamvar/popprxl")
```

popprxl has one function: **`read.genalexcel()`**. It can be used to read in GenAlEx data directly from excel:

```r
library("popprxl")
nancyxlsx <- system.file("files/nancycats.xlsx", package = "popprxl")
nancy     <- read.genalexcel(nancyxlsx)
info_table(nancy, type = "missing", plot = TRUE)
```
