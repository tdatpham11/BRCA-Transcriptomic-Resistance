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
