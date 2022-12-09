# zad 3 lab06
# 1.
SELECT* FROM kreatura k, ekwipunek e
WHERE k.idKreatury=e.idKreatury; 
# drugi sposob
SELECT * FROM kreatura k
INNER JOIN ekwipunek e
on k.idKreatury=e.idKreatury;
# 2.
SELECT * FROM kreatura k
INNER JOIN ekwipunek e
ON k.idKreatury=e.idKreatury
INNER JOIN zasob z
ON e.idZasobu=z.idZasobu;
# 3.
SELECT * FROM kreatura k
LEFT JOIN ekwipunek e
ON k.idKreatury=e.idKreatury WHERE e.idKreatury IS NULL; 
# drugi sposob
SELECT* FROM kreatura WHERE idKreatury NOT IN (SELECT DISTINCT idKreatury FROM ekwipunek WHERE idKreatury IS NOT NULL);
# zad 4
# 1.
SELECT * FROM kreatura;
SELECT* FROM kreatura k
NATURAL JOIN ekwipunek e
INNER JOIN zasob z 
ON e.idZasobu= z.idZasobu
WHERE YEAR(k.dataUr) BETWEEN 1670 AND 1679
AND k.rodzaj='wiking';
#2.
SELECT* FROM kreatura;
SELECT* FROM ekwipunek;
SELECT* FROM zasob;
SELECT* FROM kreatura k
INNER JOIN ekwipunek e
ON k.idKreatury=e.idKreatury
INNER JOIN zasob z
ON e.idZasobu=z.idZasobu
WHERE z.rodzaj='jedzenie'
ORDER BY(k.dataUr) DESC LIMIT 5;
# 3.
SELECT* FROM kreatura;
SELECT k.nazwa, k2.nazwa, k.idKreatury,k2.idKreatury FROM kreatura k
INNER JOIN kreatura k2
ON(k.idKreatury=k2.idKreatury+5);

