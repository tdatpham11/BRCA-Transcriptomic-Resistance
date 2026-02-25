# BRCA-Transcriptomic-Resistance
Differential gene expression analysis (DGE) of TNBC patients using TCGA-BRCA to identify biomarkers of chemotherapy resistance.
# TNBC-ResistOmics: Transcriptomic Profiling of Chemotherapy Resistance

[![R-Project](https://img.shields.io/badge/Language-R%20%3E%3D%204.2-blue.svg)](https://www.r-project.org/)
[![Bioconductor](https://img.shields.io/badge/Platform-Bioconductor-green.svg)](https://bioconductor.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## 🧬 Project Significance
Triple-Negative Breast Cancer (TNBC) accounts for ~15-20% of breast cancer cases but remains the most lethal subtype due to high metastatic potential and a lack of targeted receptors (ER, PR, and HER2). 

While **Neoadjuvant Chemotherapy (NACT)** is the standard of care, only **30-40%** of patients achieve a Pathologic Complete Response (pCR). Patients with residual disease post-treatment face significantly higher risks of recurrence. This project leverages **TCGA-BRCA** transcriptomic data to identify the gene expression signatures that drive this resistance, offering potential biomarkers for precision oncology.

---

## 🛠️ Analysis Pipeline
This repository contains a modular R-based pipeline for end-to-end transcriptomic analysis:

1.  **Data Acquisition:** Programmatic download of TCGA-BRCA Harmonized RNA-Seq data using `TCGAbiolinks`.
2.  **Preprocessing:** Filtering, normalization, and outlier detection.
3.  **Differential Expression (DGE):** Identifying significantly up/down-regulated genes using `DESeq2`.
4.  **Functional Enrichment:** Pathway analysis via Gene Ontology (GO) and KEGG using `clusterProfiler`.
5.  **Visualization:** Interactive volcano plots, heatmaps, and Kaplan-Meier survival curves.

---

## 📁 Repository Structure
```text
TNBC-ResistOmics/
├── data/               # Metadata and RDS objects (local only)
├── scripts/            
│   ├── 01_download.R   # GDC Data acquisition
│   ├── 02_deseq2.R     # Differential expression logic
│   └── 03_plots.R      # Visualization scripts
├── results/            
│   ├── plots/          # Volcano plots, heatmaps
│   └── tables/         # CSV files of DEGs
├── envs/               # environment.yml for conda setup
├── README.md           # Project documentation
└── .gitignore          # Prevents large data uploads
# 1. Top Upregulated Genes (Oncogenic Drivers)
These genes are typically "pushed" to the top right of your Volcano Plot ($log_2 \text{Fold Change} > 0$ and high significance).
Cell Cycle Hub Genes: You likely see genes like CCNB1 (Cyclin B1), TOP2A, and BUB1. These are master regulators of mitosis; their high expression in tumor samples indicates rapid, uncontrolled cell division.
Proliferation Markers: CCNA2 (Cyclin A2) and CENPF are frequently upregulated in aggressive subtypes like TNBC and are associated with poor disease-free survival.DNA Repair & Replication: Genes like EXO1 and FEN1 are often overexpressed as cancer cells ramp up DNA synthesis to support faster growth.
2. Top Downregulated Genes (Tumor Suppressors)These are found on the top left of your plot ($log_2 \text{Fold Change} < 0$).
Cell Adhesion & Signaling: Genes involved in the Rap1 and PPAR signaling pathways are frequently downregulated in breast tumors.
Suppression of Metastasis: ARHGEF6 is often recognized as a key suppressor gene; its downregulation in TCGA-BRCA cohorts is linked to increased tumor cell migration and invasion.Metabolic Rewiring: You may find genes like LPL and SFRP2 downregulated, indicating a shift in how the tumor cell processes lipids and signals to its environment.
The identification of upregulated mitotic regulators (e.g., BUB1, TOP2A) alongside the loss of tumor suppressors (e.g., ARHGEF6) in this subset validates the expected transcriptomic landscape of breast cancer. These hub genes represent potential prognostic biomarkers for assessing tumor aggressiveness and chemotherapy response in Triple-Negative cohorts.

