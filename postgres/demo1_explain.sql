-- Select cities with population greater than 100000
-- ordered by descending population
-- select city,population from canada_city where population > 100000
select city,population from canada_city where population > 1000
order by population desc
;

-- explain [command];
explain
select city,population from canada_city where population > 100000
order by population desc
;
