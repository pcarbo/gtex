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
  tissues <- gsub(" - "," ",tissues,fixed = TRUE,perl = FALSE)
  tissues <- gsub("(","",tissues,fixed = TRUE,perl = FALSE)
  tissues <- gsub(")","",tissues,fixed = TRUE,perl = FALSE)
  colnames(out) <- tolower(tissues)

  # Return an n x p matrix, where n is the number of tissues and p is
  # the number of genes.
  return(t(out))
}

# This function creates a plot (a ggplot object) showing the
# projection of the tissues onto PCs 1 and 2. Brain tissues are
# highlighted in magenta.
plot.gtex.top2pcs <- function (gtex, gtex.pca) {

  # For plotting, create a new data frame with four columns: (1)
  # tissue, (2) whether or not the tissue is a brain tissue; (3) the
  # first PC, and (4) the second PC.
  tissues <- rownames(gtex)
  pdat <- data.frame(tissue = paste(" ",tissues),
                     brain  = grepl("brain",tissues,ignore.case = TRUE),
                     PC1    = gtex.pca$x[,"PC1"],
                     PC2    = gtex.pca$x[,"PC2"])

  # Create the scatterplot, with each point labeled by the tissue
  # name.
  return(ggplot(pdat,aes(x = PC1,y = PC2,label = tissue,color = brain)) +
         geom_text(color = "dodgerblue",size = 3,hjust = 0) +
         geom_point(shape = 20,size = 2,show.legend = FALSE) +
         scale_color_manual(values = c("darkblue","darkorange")) +
         theme_cowplot(font_size = 12))
}
