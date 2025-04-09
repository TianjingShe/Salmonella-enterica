#!/bin/bash
# This script runs Prodigal to predict genes from a FASTA file.
# Author: She Tianjing
# Date: 2025-04-09

# Define input and output files
INPUT_FILE="gene.fasta"
OUTPUT_FILE="aa.fasta"

# Run Prodigal in metagenomic mode
prodigal -a "$OUTPUT_FILE" -i "$INPUT_FILE" -p meta

# Check if Prodigal ran successfully
if [ $? -eq 0 ]; then
    echo "Gene prediction completed successfully. Results saved to $OUTPUT_FILE"
else
    echo "An error occurred during gene prediction."
    exit 1
fi