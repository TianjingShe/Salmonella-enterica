#!/bin/bash
# This script processes files to extract specific sequences based on UViG information.
# Author: She Tianjing
# Date: 2025-04-09

# Define file paths
UVIG_FILE="UViG.txt"
IMGDB_INFO="IMGDB/IMGVR_all_Sequence_information.tsv"
IMGDB_FASTA="IMGVR_all_nucleotides.fna"
OUTPUT_INFO="information.txt"
OUTPUT_UVIG="full_UViG.txt"
OUTPUT_FASTA="phage.fasta"

# Step 1: Extract information using grep
grep -f "$UVIG_FILE" "$IMGDB_INFO" -w > "$OUTPUT_INFO"

# Check if grep completed successfully
if [ $? -ne 0 ]; then
    echo "Error occurred during grep execution."
    exit 1
fi

# Step 2: Edit information.txt to create full_UViG.txt
# Assuming that this step involves some form of processing. Replace with actual commands.
# For example, using awk to process the file:
awk '{print $1}' "$OUTPUT_INFO" > "$OUTPUT_UVIG"

# Check if processing completed successfully
if [ $? -ne 0 ]; then
    echo "Error occurred during processing of information.txt."
    exit 1
fi

# Step 3: Extract sequences using seqkit
seqkit grep -f "$OUTPUT_UVIG" "$IMGDB_FASTA" > "$OUTPUT_FASTA"

# Check if seqkit completed successfully
if [ $? -ne 0 ]; then
    echo "Error occurred during seqkit execution."
    exit 1
fi

echo "Process completed successfully. Output files: $OUTPUT_INFO, $OUTPUT_UVIG, $OUTPUT_FASTA"