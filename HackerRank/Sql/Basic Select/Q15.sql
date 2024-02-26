SELECT DISTINCT city FROM station
    WHERE NOT regexp_like(city, '[AEIOU]$');