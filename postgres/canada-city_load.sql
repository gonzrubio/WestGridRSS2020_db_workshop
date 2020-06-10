-- Load the data from canada-city.txt into the table
\copy canada_city FROM './canada-city.txt' WITH (FORMAT csv);
