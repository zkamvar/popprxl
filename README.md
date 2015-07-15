# popprxl

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
