#Zad 1 lab 07
# 3.
SELECT w.nazwa, SUM(e.ilosc) FROM wyprawa w
INNER JOIN uczestnicy u ON w.id_wyprawy = u.id_wyprawy
INNER JOIN ekwipunek e ON e.idKreatury = u.id_uczestnika
GROUP BY w.nazwa;