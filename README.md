# 🧬 Ethiopia TB Genomic Data Curation Pipeline (AHRI Project)

This project presents a reproducible bioinformatics workflow for the curation and preprocessing of *Mycobacterium tuberculosis* sequencing data associated with the Armauer Hansen Research Institute (AHRI) project in Ethiopia.

## 📌 Project Overview

The goal of this project is to transform raw sequencing data (FASTQ files) into a clean, structured, and analysis-ready dataset through:

- Quality control (QC)
- Read trimming and filtering
- Metadata organization
- Data validation
- Summary reporting

This pipeline ensures reproducibility and provides a strong foundation for downstream genomic analysis such as alignment, variant calling, and lineage identification.

## 🧪 Data Source

- Sequencing data obtained from publicly available studies (SRA)
- Samples correspond to *Mycobacterium tuberculosis* isolates from Ethiopia
- Curated in the context of an AHRI-related research project
- Sample identifiers (SRR IDs) are listed in the metadata file

## ⚙️ Pipeline Steps

### 1. Quality Control (Raw Data)
- Tool: **FastQC**
- Output: `qc_raw/`

### 2. Quality Summary
- Tool: **MultiQC**
- Aggregates QC reports

### 3. Read Trimming
- Tool: **Trimmomatic**
- Removes low-quality bases and short reads

### 4. Post-trimming QC
- Tool: **FastQC + MultiQC**
- Ensures data quality improvement

### 5. Metadata Curation
- Structured sample information stored in `metadata.csv`

### 6. Data Validation
- Python script verifies:
  - Missing values
  - File consistency
  - Sample integrity

### 7. Summary Statistics
- Tool: **SeqKit**
- Reports sequence-level statistics

## 🚀 How to Run the Pipeline

### 1. Clone the repository

git clone https://github.com/Meti2000-ke/ethiopia-tb-genomic-data-curation-ahri-project.git

cd ethiopia-tb-genomic-data-curation-ahri-project
