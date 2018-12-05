# TO DO: Briefly explain here what this script does, and how to run
# it.
#
# NOTES:
#  - Rscript ...
#  - working directory.
#  - Install ggplot2.
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
# TO DO: Add description here.
library(ggplot2)
source("../code/gtexpca.functions.R")

# READ DATA
# ---------
cat("Reading GTEx gene expression data.\n")
gtex <- read.gtex.data(gtex.data.file)
cat(sprintf("Number of genes: %d\n",nrow(gtex)))
cat(sprintf("Number of tissue types: %d\n",ncol(gtex)))

# COMPUTE PRINCIPAL COMPONENTS
# ----------------------------
cat("Computing PCs from the gene expression data.\n")
gtex.pca <- prcomp(gtex,retx = FALSE)
cat("Summary of the first two PCs:\n")
print(summary(gtex.pca)$importance[,1:2])

# SESSION INFO
# ------------
sessionInfo()
