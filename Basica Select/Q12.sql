SELECT DISTINCT city FROM station
    WHERE UPPER(SUBSTR(CITY, -1)) IN ('A', 'E', 'I', 'O', 'U')