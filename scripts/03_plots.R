library(DESeq2)
library(ggplot2)
library(pheatmap)

# 1. Load the model and results
dds <- readRDS("data/brca_dds_model.rds")
res <- read.csv("results/tables/brca_dge_results.csv", row.names = 1)

# 2. Data Transformation (Crucial for PCA/Heatmap)
vsd <- vst(dds, blind = FALSE) # Variance stabilizing transformation

# 3. PCA Plot: Global Sample Clustering
pca_data <- plotPCA(vsd, intgroup = "definition", returnData = TRUE)
percentVar <- round(100 * attr(pca_data, "percentVar"))

pca_plot <- ggplot(pca_data, aes(PC1, PC2, color = definition)) +
  geom_point(size = 3) +
  xlab(paste0("PC1: ", percentVar[1], "% variance")) +
  ylab(paste0("PC2: ", percentVar[2], "% variance")) +
  theme_minimal() +
  ggtitle("PCA: Tumor vs Normal Clustering")

ggsave("results/plots/pca_plot.png", pca_plot)

# 4. Heatmap: Top 50 Significant Genes
top_genes <- head(order(res$padj), 50)
mat <- assay(vsd)[top_genes, ]
mat <- mat - rowMeans(mat) # Center the data

png("results/plots/heatmap_top50.png", width = 800, height = 1000)
pheatmap(mat, 
         annotation_col = as.data.frame(colData(dds)[, "definition", drop=F]), 
         cluster_cols = TRUE, 
         show_colnames = FALSE,
         main = "Top 50 Differentially Expressed Genes")
dev.off()
