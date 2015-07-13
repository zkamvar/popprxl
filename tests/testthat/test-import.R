context("input tests")

nanfile <- system.file("data/nancycats.xlsx", package = "popprxl")
nanxc <- system.file("data/nancycats_extra_columns.xlsx", package = "popprxl")
data("nancycats", package = "adegenet")
locNames(nancycats) <- locNames(nancycats)
sort_alleles <- function(x) lapply(alleles(x), function(i) sort(as.numeric(i)))
test_that("Files can be imported correctly", {
	nan   <- read.genalexcel(nanfile, sheet = 1, genclone = FALSE)
	nangc <- read.genalexcel(nanfile, sheet = 1)
	expect_is(nan, "genind")
	expect_is(nangc, "genclone")
	expect_identical(sort_alleles(nancycats), sort_alleles(nan))
})

test_that("Extra rows are detected", {
	expect_warning(nanx <- read.genalexcel(nanxc, sheet = 1, genclone = FALSE), "Color Code Key:")
	expect_is(nanx, "genind")
	expect_identical(sort_alleles(nancycats), sort_alleles(nanx))
})