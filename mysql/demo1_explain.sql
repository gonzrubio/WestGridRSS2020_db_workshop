-- Select cities with population greater than 100000
-- ordered by descending population
select city,population from canada_city where population > 100000
order by population desc
;

-- explain [command]\G
-- Use \G instead of ; in MySQL to show "explain" output
-- in a more readable fashion
explain
select city,population from canada_city where population > 100000
order by population desc
\G
