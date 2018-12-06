# TO DO: Briefly explain here what this script does, and how to run
# it.
#
# NOTES:
#  - Rscript ...
#  - working directory.
#  - Install ggplot2 & cowplot.
#  - see expected results here: output/gtexpca.out
#

# ANALYSIS SETTINGS
# -----------------
# The file containing the gene expression data (median TPM by tissue).
gtex.data.file <-
  file.path("..","data",
            "GTEx_Analysis_2016-01-15_v7_RNASeQCv1.1.8_gene_median_tpm.gct.gz")

# SET UP ENVIRONMENT
# ------------------
# Load the ggplot2 and cowplot libraries, as well as some additional
# functions used in this analysis.
library(ggplot2)
library(cowplot)
source("../code/gtexpca.functions.R")

# LOAD & PREPARE DATA
# -------------------
cat("Reading GTEx gene expression data.\n")
gtex <- read.gtex.data(gtex.data.file)
cat(sprintf("Total number of tissue types: %d\n",nrow(gtex)))
cat(sprintf("Total number of genes: %d\n",ncol(gtex)))

# COMPUTE PRINCIPAL COMPONENTS
# ----------------------------
cat("Computing PCs from the gene expression data.\n")
gtex.pca <- prcomp(gtex)

# SUMMARIZE THE TOP 2 PCs
# -----------------------
cat("Summary of the first two PCs:\n")
print(summary(gtex.pca)$importance[,1:2])

stop()

# PLOT TOP 2 PCs
# --------------
pdat <- data.frame(tissue = colnames(gtex),
                   PC1 = gtex.pca$x[,1],
                   PC2 = gtex.pca$x[,2])
p <- ggplot(pdat,aes(x = PC1,y = PC2,label = tissue)) +
       geom_text(color = "gray") +
       geom_point(shape = 20)

# SESSION INFO
# ------------
# This gives information about the computing environment used to
# generate the above results, such as the version of R, and the
# versions of the R packages that were used.
print(sessionInfo())
