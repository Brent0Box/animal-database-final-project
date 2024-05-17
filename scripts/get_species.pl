#!/usr/bin/perl -w

use strict;

# Prompt the user for the species
print "Enter the species to display (e.g., dog, cat, bird, fish, etc): ";
my $species = <STDIN>;
chomp($species);

# Convert input to lowercase
$species = lc($species);

# Pass the user input to the Bash script
system("./filter_by_species.sh '$species'");
