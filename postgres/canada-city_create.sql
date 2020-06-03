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
