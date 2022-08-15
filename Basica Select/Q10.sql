SELECT city, length(city) FROM station ORDER BY length(city) asc, city asc LIMIT 1;
SELECT city, length(city) FROM station ORDER BY length(city) desc, city asc LIMIT 1;