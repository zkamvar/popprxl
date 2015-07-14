.onAttach <- function(...) {
	startupmsg <- "popprxl is loaded. Use read.genalexcel() to read in your data."
	packageStartupMessage(startupmsg)
}