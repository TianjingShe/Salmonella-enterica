#!/bin/bash
# This script runs hmmscan to perform sequence alignment against a HMM database.
# Author: She Tianjing
# Date: 2025-04-09

# Define input and output files
INPUT_FILE="aa.fasta"
OUTPUT_FILE="output.txt"
TABLE_OUTPUT="output.tbl"
DOMAIN_TABLE_OUTPUT="output.dom"

# Define HMM database path
HMM_DB="vogdb/vog23_5_15.hmm"

# Define parameters
E_VALUE_THRESHOLD="0.00001"
CPU_CORES="40"

# Run hmmscan
hmmscan \
    -o "$OUTPUT_FILE" \
    --tblout "$TABLE_OUTPUT" \
    --domtblout "$DOMAIN_TABLE_OUTPUT" \
    -E "$E_VALUE_THRESHOLD" \
    --cpu "$CPU_CORES" \
    "$HMM_DB" \
    "$INPUT_FILE"

# Check if hmmscan ran successfully
if [ $? -eq 0 ]; then
    echo "hmmscan completed successfully."
    echo "Output files: $OUTPUT_FILE, $TABLE_OUTPUT, $DOMAIN_TABLE_OUTPUT"
else
    echo "An error occurred during hmmscan execution."
    exit 1
fi