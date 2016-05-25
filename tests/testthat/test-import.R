context("input tests")

nanfile <- system.file("files/nancycats.xlsx", package = "popprxl")
nanxc <- system.file("files/nancycats_extra_rows.xlsx", package = "popprxl")
geox  <- system.file("files/geo_ex.xls", package = "popprxl")
nit <- system.file("files/num_isolates_text.xlsx", package = "popprxl")
nsg <- system.file("files/num_samp_greater.xlsx", package = "popprxl")

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

test_that("Characters in 2nd column are detected", {
	expect_error(read.genalexcel(nit), "I found: 237u")
})

test_that("short data is rejected", {
	expect_error(read.genalexcel(nsg))
})
test_that("Geographic data can be imported", {
	geoxy <- read.genalexcel(geox, sheet = 1, geo = TRUE, genclone = FALSE)
	geo   <- read.genalexcel(geox, sheet = 2, genclone = FALSE)
	expect_is(geoxy, "genind")
	expect_is(geo, "genind")
	dfxy <- genind2df(geoxy)
	dfg  <- genind2df(geo)
	expect_identical(dfxy, dfg)
})