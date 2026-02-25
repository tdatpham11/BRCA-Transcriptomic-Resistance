library(DESeq2)
# Load your prepared data
data <- readRDS("data/brca_raw_se.rds")

# Create the DESeq object
# 'definition' compares 'Primary Tumor' vs 'Solid Tissue Normal'
dds <- DESeqDataSet(data, design = ~ definition)

# Run the analysis
dds <- DESeq(dds)
res <- results(dds)
