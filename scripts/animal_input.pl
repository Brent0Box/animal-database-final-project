#!usr/bin/perl -w

use strict;

# Prompt user for animal information
print "Enter the information for the new animal:\n";
print "Name: ";
my $name = <>;
chomp($name);

print "Species: ";
my $species = <>;
chomp($species);

print "Breed: ";
my $breed = <>;
chomp($breed);

print "Sex (M/F): ";
my $sex = <>;
chomp($sex);

print "Weight (lbs): ";
my $weight = <>;
chomp($weight);

print "Age (years): ";
my $age = <>;
chomp($age);

print "Birth Date (YYYY-MM-DD): ";
my $birth_date = <>;
chomp($birth_date);

print "Death Date (YYYY-MM-DD): ";
my $death_date = <>;
chomp($death_date);

# Print the animal info

print "Name: $name\n";
print "Species: $species\n";
print "Breed: $breed\n";
print "Sex: $sex\n";
print "Weight: $weight\n";
print "Age: $age\n";
print "Birth Date: $birth_date\n";
print "Death Date: $death_date\n";
