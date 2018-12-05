# TO DO: Briefly explain here what this script does, and how to run
# it.
#
# NOTES:
#  - Rscript ...
#  - working directory.
#  - Install ggplot2.
#  - output/gtexpca.out
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
# Read the gene expression data.
gtex <- read.gtex.data(gtex.data.file)



# SESSION INFO
# ------------
sessionInfo()
