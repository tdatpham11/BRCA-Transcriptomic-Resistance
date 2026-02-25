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
