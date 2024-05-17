#!/usr/bin/perl
use strict;
use warnings;

# Define database file path and output HTML file path
my $db_file = "../animal_inventory.db";
my $output_file = "../animal_inventory.html";

# Execute SQLite query to fetch all records from the animals table
my @output = `sqlite3 $db_file 'SELECT * FROM animals'`;

# Generate HTML content
my $html_content = "<html>\n<head>\n<title>Animal Inventory</title>\n</head>\n<body>\n<table border='1'>\n<tr><th>ID</th><th>Name</th><th>Species</th><th>Breed</th><th>Sex</th><th>Weight</th><th>Age</th></tr>\n";

foreach my $line (@output) {
    my @fields = split /\|/, $line;
    $html_content .= "<tr>";
    foreach my $field (@fields) {
        $html_content .= "<td>$field</td>";
    }
    $html_content .= "</tr>\n";
}

$html_content .= "</table>\n</body>\n</html>";

# Write HTML content to the output file
open(my $fh, '>', $output_file) or die "Could not open file '$output_file' $!";
print $fh $html_content;
close $fh;

print "HTML file generated successfully.\n";
