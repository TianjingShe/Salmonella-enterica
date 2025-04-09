#!/bin/bash
# This script creates a BLAST database and performs a tblastn search.
# Author: She Tianjing
# Date: 2025-04-09

# Define input and output files
INPUT_FASTA="bacseqs.fasta"
QUERY_FASTA="aa.fasta"
DB_NAME="Salmonella"
OUTPUT_FILE="output.txt"

# Step 1: Create BLAST database
makeblastdb \
    -in "$INPUT_FASTA" \
    -dbtype nucl \
    -out "$DB_NAME" \
    -parse_seqids

# Check if makeblastdb completed successfully
if [ $? -ne 0 ]; then
    echo "Error occurred during makeblastdb execution."
    exit 1
fi

# Step 2: Perform tblastn search
tblastn \
    -query "$QUERY_FASTA" \
    -db "$DB_NAME" \
    -evalue 1e-6 \
    -outfmt 6 \
    -num_threads 50 \
    -out "$OUTPUT_FILE"

# Check if tblastn completed successfully
if [ $? -ne 0 ]; then
    echo "Error occurred during tblastn execution."
    exit 1
fi

echo "BLAST database created and search completed successfully. Results saved to $OUTPUT_FILE"