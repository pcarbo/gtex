# TO DO: Explain here briefly what this function does.
read.gtex.data <- function (file) {
  out <- read.table(file,sep = "\t",header = TRUE,skip = 2,
                    stringsAsFactors = FALSE,check.names = FALSE)
  ids <- out$gene_id
  out <- out[-(1:2)]
  rownames(out) <- ids

  # Make the tissue names easier to read.
  tissues <- names(out)
  tissues <- gsub(" - "," ",tissues,fixed = TRUE,ignore.case=FALSE,perl=FALSE)
  tissues <- gsub("(","",tissues,fixed = TRUE,ignore.case = FALSE,perl = FALSE)
  tissues <- gsub(")","",tissues,fixed = TRUE,ignore.case = FALSE,perl = FALSE)
  names(out) <- tissues
  
  return(out)
}
