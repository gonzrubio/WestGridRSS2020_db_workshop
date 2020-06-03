-- There are duplicate cities in the data
-- Use GROUP BY and HAVING in a SELECT command to look for duplicates

select city,count(city) as "Count"
from canada_city
group by city
having count(city) > 1
;
