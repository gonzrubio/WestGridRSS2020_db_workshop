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

-- upload comma delimited data
-- \copy canada_city FROM './sample.txt' WITH (FORMAT csv);
\copy canada_city FROM './canada-city.txt' WITH (FORMAT csv);

-- verification
select count(*) from canada_city;
