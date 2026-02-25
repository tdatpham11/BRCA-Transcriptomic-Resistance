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

## 🧪 Biological Insights & Results

The differential expression analysis (DGE) identified a distinct transcriptomic signature in tumor samples compared to solid tissue normal samples. Below are the key biological takeaways from the identified hub genes:

### 1. Upregulation of Proliferation Drivers (Oncogenic Activity)
High-significance genes found in the top-right quadrant of the Volcano Plot include:
* **Cell Cycle Master Regulators**: Genes such as **CCNB1** (Cyclin B1), **TOP2A**, and **BUB1** are significantly upregulated. These act as mitosis accelerators, indicating rapid, uncontrolled cell division in the TNBC subset.
* **Proliferation Markers**: Elevated expression of **CCNA2** and **CENPF** was observed, which are hallmark indicators of aggressive breast cancer subtypes and poor prognostic outcomes.
* **DNA Replication Hubs**: **EXO1** and **FEN1** were highly expressed, reflecting the tumor's increased requirement for DNA synthesis and repair to sustain growth.

### 2. Downregulation of Tumor Suppressors
Significant genes in the top-left quadrant represent lost protective mechanisms:
* **Metastatic Suppression**: The loss of **ARHGEF6** expression is a critical finding, as its downregulation is linked to increased cellular migration and invasive potential in TCGA-BRCA cohorts.
* **Signaling & Adhesion**: Dysregulation was observed in the **Rap1** and **PPAR** signaling pathways, suggesting a breakdown in normal cell-to-cell communication and metabolic control.
* **Metabolic Rewiring**: Downregulation of **LPL** and **SFRP2** indicates a metabolic shift typically seen in breast cancer cells to favor energy production over lipid homeostasis.

---

## 🏥 Clinical Impact
The identified hub genes (notably **BUB1** and **TOP2A**) serve as robust prognostic biomarkers for assessing tumor aggressiveness. The shift from tumor-suppressive signaling to high-velocity mitotic activity validates the expected transcriptomic landscape of breast cancer and highlights potential therapeutic targets for overcoming chemotherapy resistance in Triple-Negative cohorts.
