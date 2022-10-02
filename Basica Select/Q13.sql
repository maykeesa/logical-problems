SELECT DISTINCT city FROM station
    WHERE regexp_like(city, '^[AEIOU].*[aeiou]$');