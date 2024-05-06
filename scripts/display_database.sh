#!/bin/bash

# Database filename
DB_FILE="../animal_inventory.db"

echo "ID | name | species | breed | sex | weight | age "
# Display full database
sqlite3 "$DB_FILE" <<EOF
SELECT * FROM animals;
EOF

