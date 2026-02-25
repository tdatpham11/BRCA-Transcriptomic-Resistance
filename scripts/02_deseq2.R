library(DESeq2)
library(SummarizedExperiment)

# 1. Load the subset data we just created
data <- readRDS("data/brca_subset_se.rds")

# 2. Create DESeq2 object
# We use 'definition' to compare Primary Tumor vs Solid Tissue Normal
dds <- DESeqDataSet(data, design = ~ definition)

# 3. Filter low-count genes (keeps genes with at least 10 total reads)
keep <- rowSums(counts(dds)) >= 10
dds <- dds[keep,]

# 4. Run the Differential Expression analysis
dds <- DESeq(dds)

# 5. Get results
res <- results(dds, contrast=c("definition", "Primary Tumor", "Solid Tissue Normal"))

# 6. Save results to a CSV for your GitHub
write.csv(as.data.frame(res), "results/tables/brca_dge_results.csv")

print("DGE Analysis Complete! Results saved to results/tables/")
