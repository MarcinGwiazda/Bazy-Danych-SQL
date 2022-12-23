#zadanie 3 lab 07
#1.
SELECT ifnull(count(ew.sektor),0)
 AS ilosc_odwiedzin, s.nazwa FROM sektor s
 LEFT JOIN etapy_wyprawy ew
 ON (ew.sektor=s.id_sektora)
 GROUP BY s.id_sektora;
 #2.
 SELECT k.nazwa, 
IF(COUNT(u.id_wyprawy)>0,"brał udział w wyprawie",
"nie brał udziału w wyprawie") AS czyBralUdzial
FROM kreatura k
LEFT JOIN uczestnicy u
ON k.idKreatury = u.id_uczestnika
GROUP BY k.nazwa;
 # zadanie 4
 # 1.
 SELECT sum(length(dziennik)),w.nazwa 
 FROM wyprawa w INNER JOIN etapy_wyprawy ew
 ON w.id_wyprawy=ew.idWyprawy 
 GROUP BY w.id_wyprawy having sum(length(dziennik)) < 400;
 # 2.
 SELECT w.nazwa, 
 SUM(z.waga*e.ilosc)/COUNT(distinct(u.id_uczestnika))
 FROM uczestnicy u INNER JOIN wyprawa w
 ON (u.id_wyprawy=w.id_wyprawy)
 INNER JOIN kreatura k
 ON (k.idKreatury=u.id_uczestnika) 
 INNER JOIN ekwipunek e
 ON (e.idKreatury=k.idKreatury)
 INNER JOIN zasob z ON (e.idZasobu=z.idZasobu) 
 GROUP BY u.id_wyprawy ORDER BY w.id_wyprawy;
 #zad 5
 # 1.
SELECT k.nazwa,
w.nazwa,
DATEDIFF(w.data_rozpoczecia, k.dataUr) as 'Wiek w dniach'
FROM kreatura k,
etapy_wyprawy ew,
wyprawa w,
sektor s,
uczestnicy u
WHERE ew.sektor = s.id_sektora
and k.idKreatury=u.id_uczestnika
and u.id_wyprawy=w.id_wyprawy
AND ew.idWyprawy = w.id_wyprawy
AND s.nazwa = "Chatka dziadka";
