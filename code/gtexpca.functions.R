# This function reads GTEx gene expression data (median TPM by tissue)
# from a tab-delimited text file. The return value is a matrix with
# one row per tissue and column per
read.gtex.data <- function (file) {

  # Read the data from the tab-delimited text file.
  out <- read.table(file,sep = "\t",header = TRUE,skip = 2,
                    stringsAsFactors = FALSE,check.names = FALSE)
  ids <- out$gene_id
  out <- out[-(1:2)]
  out <- as.matrix(out)
  rownames(out) <- ids

  # Make the tissue names easier to read.
  tissues <- colnames(out)
  tissues <- gsub(" - "," ",tissues,fixed = TRUE,ignore.case=FALSE,perl=FALSE)
  tissues <- gsub("(","",tissues,fixed = TRUE,ignore.case = FALSE,perl = FALSE)
  tissues <- gsub(")","",tissues,fixed = TRUE,ignore.case = FALSE,perl = FALSE)
  names(out) <- tissues

  # Return an n x p matrix, where n is the number of tissues and p is
  # the number of genes.
  return(t(out))
}
