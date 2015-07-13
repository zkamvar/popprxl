#' Read GenAlEx formatted data from excel
#'
#' The \pkg{poppr} function \code{\link[poppr]{read.genalex}} provides a way to
#' read GenAlEx formatted data into R. The only stipulation is that the file
#' must be saved as a CSV text file beforehand. This function provides a wrapper
#' for \code{\link[poppr]{read.genalex}} and \code{\link[readxl]{read_excel}}
#' from the \pkg{readxl} package.
#'
#' @param x a path to your excel file
#' @param sheet the sheet in which your data is contained.
#' @param ... any arguments to be passed on to \code{\link[poppr]{read.genalex}}
#' @return a \code{\link[poppr]{genclone}} or \code{\link[adegenet]{genind}}
#'   object.
#' @authors Zhian N. Kamvar
#' @seealso \code{\link[poppr]{read.genalex}}
#' @examples
#'
#' @importFrom poppr read.genalex
#' @import readxl
#' @importFrom utils write.table
read.genalexcel <- function(x, sheet = 1, ...){
	infile     <- file()
	genalex_df <- readxl::read_excel(x, sheet = sheet, col_names = FALSE)
	nrows      <- nrow(genalex_df) - 3
	nsamp      <- as.numeric(genalex_df[1, 2])
	if (!identical(nrows, nsamp)){
		if (is.na(nsamp)){
			stop("Number of samples (Row 1, Column B) is not numeric.")
		} else if (nrows > nsamp){
			msg        <- "\nI found superfluous rows in data:\n"
			ndiff      <- nrows - nsamp - 1
			to_remove  <- seq(nrow(genalex_df) - ndiff, nrow(genalex_df))
			the_lines  <- apply(genalex_df[to_remove, ], 1,
													function(x) paste(x[!is.na(x)], collapse = " "))
			genalex_df <- genalex_df[-to_remove, , drop = FALSE]
			msg        <- paste(msg, paste(the_lines, collapse = "\n"), sep = "\n")
			warning(paste(msg, "These are being removed.", sep = "\n"))
		} else {
			stop("Number of samples expected greater than the number of rows.")
		}
	}
	utils::write.table(genalex_df, file = infile, sep = ",", quote = FALSE,
										 row.names = FALSE, col.names = FALSE)
	gen_object <- poppr::read.genalex(infile, sep = ",", ...)
	close(infile)
	return(gen_object)
}