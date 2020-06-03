-- Load up comma-delimited data from a data file
LOAD DATA LOCAL INFILE 'canada-city.txt' INTO TABLE canada_city
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
;

