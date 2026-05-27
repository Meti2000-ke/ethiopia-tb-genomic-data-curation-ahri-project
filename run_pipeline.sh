#!/bin/bash
exec > >(tee -i reports/pipeline.log)
exec 2>&1
set -e

echo "🚀 Starting TB Data Curation Pipeline..."

# Create folders (in case they don't exist)
mkdir -p qc_raw qc_trimmed trimmed_data reports

# Step 1: Quality Control (Raw Data)
echo "🔍 Running FastQC on raw data..."
fastqc raw_data/*.fastq -o qc_raw

echo "📊 Running MultiQC on raw data..."
multiqc qc_raw -o qc_raw

# Step 2: Trimming
echo "✂️ Running Trimmomatic..."

for sample in raw_data/*_1.fastq
do
    base=$(basename ${sample} _1.fastq)

    java -jar /usr/share/java/trimmomatic-0.39.jar PE \
    raw_data/${base}_1.fastq raw_data/${base}_2.fastq \
    trimmed_data/${base}_1_paired.fastq trimmed_data/${base}_1_unpaired.fastq \
    trimmed_data/${base}_2_paired.fastq trimmed_data/${base}_2_unpaired.fastq \
    SLIDINGWINDOW:4:20 MINLEN:50
done

# Step 3: QC after trimming
echo "🔍 Running FastQC on trimmed data..."
fastqc trimmed_data/*_paired.fastq -o qc_trimmed

echo "📊 Running MultiQC on trimmed data..."
multiqc qc_trimmed -o qc_trimmed

# Step 4: Generate stats
echo "📈 Generating sequence statistics..."
seqkit stats raw_data/*.fastq > reports/raw_stats.txt
seqkit stats trimmed_data/*_paired.fastq > reports/trimmed_stats.txt

echo "✅ Pipeline completed successfully!"
