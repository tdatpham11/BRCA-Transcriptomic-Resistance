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
