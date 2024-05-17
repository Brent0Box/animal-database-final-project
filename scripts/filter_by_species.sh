#!/bin/bash

# Store database as output text to be processed by awk
./display_database.sh >> output.txt

# Retrieve species input from get_species.pl
species="$1"

# Construct awk command based on species input
awk -F '|' -v species="$species" 'tolower($3) == species { print }' output.txt

rm output.txt
