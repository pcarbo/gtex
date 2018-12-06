# In this analysis, we compute principal components from the GTEx gene
# expression data (median TPM by tissue), and plot the top two PCs. In
# the plot, we highlight the clustering of the brain tissues.
#
# To run this code, you need to have the ggplot2 and cowplot packages
# installed.
#
# When running this code interactively in R or RStudio, you should
# make sure that your working directory is set to the same location as
# this file.
#
# The output is the PC plot saved to gtexpca.png.
#
# See also gtexpca.out in the "output" directory for results that were
# previously generated using this script.
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

# Remove whole blood data.
gtex <- gtex[-53,]

# COMPUTE PRINCIPAL COMPONENTS
# ----------------------------
gtex.pca <- prcomp(gtex)
head(gtex.pca$sdev)

# SUMMARIZE TOP 2 PCs
# -------------------
print(summary(gtex.pca)$importance[,1:2])

# PLOT TOP 2 PCs
# --------------
# Show the projection of the tissues onto PCs 1 and 2, highlighting
# the brain tissues in magenta.
pdf(NULL)
p <- plot.gtex.top2pcs(gtex,gtex.pca)
ggsave(pc.plot.file,p,height = 4,width = 4,dpi = 200)

# SESSION INFO
# ------------
# This gives information about the computing environment used to
# generate the above results, such as the version of R, and the
# versions of the R packages that were used.
print(sessionInfo())
