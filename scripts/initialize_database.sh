#!/bin/bash

# Initialize Database Script

# Database filename
DB_FILE="animal_inventory.db"

# Check if database already exists
if [ -f "$DB_FILE" ]; then
	echo "Database File already exists. Skipping Initialization."
else
	# Initialize Database
	sqlite3 "$DBFILE" << EOF

	CREATE TABLE IF NOT EXISTS animals (
		id INTEGER PRIMARY KEY,
		name TEXT NOT NULL,
		species TEXT NOT NULL,
		breed TEXT,
		sex CHAR(1),
		weight FLOAT,
		age INT,
		birth DATE,
		death DATE
		);

	.print "Animal Inventory Database Initialized.\n"

EOF
fi