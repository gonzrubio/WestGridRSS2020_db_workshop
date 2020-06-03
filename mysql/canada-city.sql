-- Create the table and drop it first if it exists
drop table if exists canada_city;
create table canada_city (
  country_code char(2),
  city_ascii varchar(100),
  city varchar(100),
  region integer,
  population integer,
  latitude decimal(9,6),
  longitude decimal(9,6)
);

-- Show table schema
-- describe canada_city;

-- Load up comma-delimited data from a data file
LOAD DATA LOCAL INFILE 'canada-city.txt' INTO TABLE canada_city
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
;

-- Sanity check
-- Show number of lines in the table
select count(*) 'Total Count' from canada_city;

-- Show 5 records in the table
select * from canada_city limit 5;
