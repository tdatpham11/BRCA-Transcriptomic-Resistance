library(EnhancedVolcano)

# Load the results you just generated
res <- read.csv("results/tables/brca_dge_results.csv", row.names = 1)

# Generate and save the plot
plot <- EnhancedVolcano(res,
    lab = rownames(res),
    x = 'log2FoldChange',
    y = 'padj',
    title = 'BRCA: Tumor vs Normal (Subset)',
    pCutoff = 0.05,
    FCcutoff = 1.0)

ggsave("results/plots/volcano_plot.png", plot, width = 7, height = 7)
print("Volcano Plot generated in results/plots/")
library(DESeq2)
library(ggplot2)

# 1. Transform data for visualization
# Note: Use blind = FALSE so the transformation isn't biased by your groups
vsd <- vst(dds, blind = FALSE)

# 2. Generate PCA Plot
pca_data <- plotPCA(vsd, intgroup = "definition", returnData = TRUE)
percentVar <- round(100 * attr(pca_data, "percentVar"))

ggplot(pca_data, aes(PC1, PC2, color = definition)) +
  geom_point(size = 3) +
  xlab(paste0("PC1: ", percentVar[1], "% variance")) +
  ylab(paste0("PC2: ", percentVar[2], "% variance")) +
  coord_fixed() +
  theme_minimal() +
  ggtitle("PCA: Tumor vs Normal Samples")

ggsave("results/plots/pca_plot.png")
library(pheatmap)

# 1. Get the top 50 significant genes by adjusted p-value
top_genes <- head(order(res$padj), 50)
mat <- assay(vsd)[top_genes, ]

# 2. Subtract the row mean for better visualization (Z-score like)
mat <- mat - rowMeans(mat)

# 3. Create Annotation for columns (Tumor vs Normal)
df <- as.data.frame(colData(dds)[, c("definition")])
rownames(df) <- colnames(dds)
colnames(df) <- "Type"

# 4. Draw the Heatmap
pheatmap(mat, 
         annotation_col = df, 
         show_colnames = FALSE, 
         cluster_cols = TRUE, 
         main = "Top 50 Differentially Expressed Genes",
         color = colorRampPalette(c("navy", "white", "firebrick3"))(50))

# Note: pheatmap doesn't use ggsave. Use this instead:
dev.copy(png, "results/plots/heatmap_top50.png")
dev.off()
