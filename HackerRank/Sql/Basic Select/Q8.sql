-- Duas opções de resolução

SELECT DISTINCT city FROM station WHERE id % 2 = 0

SELECT DISTINCT city FROM station WHERE MOD(ID, 2) = 0