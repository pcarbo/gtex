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

# The PCA plot will be saved to this file.
pc.plot.file <- "../output/gtexpca.png"

# SET UP ENVIRONMENT
# ------------------
# Load the ggplot2 and cowplot libraries, as well as some additional
# functions used in this analysis.
library(ggplot2)
library(cowplot)
source("../code/gtexpca.functions.R")

# LOAD & PREPARE DATA
# -------------------
gtex <- read.gtex.data(gtex.data.file)
cat(sprintf("Total number of tissue types: %d\n",nrow(gtex)))
cat(sprintf("Total number of genes: %d\n",ncol(gtex)))

# COMPUTE PRINCIPAL COMPONENTS
# ----------------------------
gtex.pca <- prcomp(gtex)

# SUMMARIZE TOP 2 PCs
# -------------------
print(summary(gtex.pca)$importance[,1:2])

# PLOT TOP 2 PCs
# --------------
# Show the projection of the tissues onto PCs 1 and 2, highlighting
# the brain tissues in magenta.
p <- plot.gtex.top2pcs(gtex,gtex.pca)
ggsave(pc.plot.file,p,height = 4,width = 4,dpi = 200)

# SESSION INFO
# ------------
# This gives information about the computing environment used to
# generate the above results, such as the version of R, and the
# versions of the R packages that were used.
print(sessionInfo())
