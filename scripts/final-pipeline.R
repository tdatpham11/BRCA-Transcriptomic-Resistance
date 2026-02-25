# Run these in your R console to create folders
dir.create("scripts")
dir.create("data")
dir.create("results")
dir.create("results/plots")
if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install(c("TCGAbiolinks", "DESeq2", "SummarizedExperiment", 
                       "EnhancedVolcano", "clusterProfiler", "org.Hs.eg.db"))
library(TCGAbiolinks)

# 1. Query the GDC for Breast Cancer (BRCA) Transcriptome Data
query_brca <- GDCquery(
    project = "TCGA-BRCA",
    data.category = "Transcriptome Profiling",
    data.type = "Gene Expression Quantification",
    workflow.type = "STAR - Counts"
)

# 2. Download the data (this takes a few minutes)
GDCdownload(query_brca)

# 3. Prepare the data into a SummarizedExperiment object
brca_data <- GDCprepare(query_brca)

# Save the raw object so you don't have to download it again
saveRDS(brca_data, file = "data/brca_raw_se.rds")
library(DESeq2)
brca_se <- readRDS("data/brca_raw_se.rds")

# Extract clinical metadata to find TNBC samples
metadata <- as.data.frame(colData(brca_se))

# Simplified: Compare Tumor vs Normal (standard 'from scratch' start)
# In a real TNBC project, you'd filter metadata for ER/PR/HER2 status here.
dds <- DESeqDataSet(brca_se, design = ~ definition) # 'definition' is Primary Tumor vs Solid Tissue Normal

# Pre-filtering: keep genes with at least 10 reads in total
keep <- rowSums(counts(dds)) >= 10
dds <- dds[keep,]

# Run DESeq2
dds <- DESeq(dds)
res <- results(dds, contrast=c("definition", "Primary Tumor", "Solid Tissue Normal"))

# Save results
write.csv(as.data.frame(res), "results/brca_dge_results.csv")
library(EnhancedVolcano)

EnhancedVolcano(res,
    lab = rownames(res),
    x = 'log2FoldChange',
    y = 'pvalue',
    title = 'Breast Cancer: Tumor vs Normal',
    pCutoff = 10e-12,
    FCcutoff = 1.5)

ggsave("results/plots/volcano_plot.png")
