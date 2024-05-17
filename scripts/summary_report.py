#!/usr/bin/python3

import sqlite3
from collections import Counter

# Database filename
DB_FILE = "../animal_inventory.db"

def generate_summary_report():
	# Connect to the database
	conn = sqlite3.connect(DB_FILE)
	cursor = conn.cursor()

	# Fetch all animals
	cursor.execute("SELECT * FROM animals")
	animals = cursor.fetchall()

	# Close the connection
	conn.close()

	# If there are no animals, print a message and return
	if not animals:
		print("No animals found in the database.")
		return

	# Count the number of animals by species
	species_counter = Counter(animal[2] for animal in animals)
	total_animals = len(animals)
	average_age = sum(float(animal[6]) for animal in animals) / total_animals
	average_weight = sum(float(animal[5]) for animal in animals) / total_animals

	# Print the summary report
	print(f"Total animals: {total_animals}")
	print(f"Average age: {average_age:.2f} years")
	print(f"Average weight: {average_weight:.2f} lbs.")
	print("Number of animals by species:")
	for species, count in species_counter.items():
		print(f"{species}: {count}")


generate_summary_report()

