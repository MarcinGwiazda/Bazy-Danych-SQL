# zad 5 lab06
# 1.
SELECT* FROM kreatura;
SELECT* FROM ekwipunek;
SELECT*FROM zasob;
SELECT k.rodzaj, sum(e.ilosc*z.waga)/count(distinct e.idKreatury)
FROM kreatura k
INNER JOIN ekwipunek e 
ON k.idKreatury = e.idKreatury
INNER JOIN zasob z 
ON z.idZasobu = e.idZasobu
WHERE (k.rodzaj != 'waz' OR k.rodzaj != 'malpa')
GROUP BY k.rodzaj
having sum(e.ilosc)<30;
# 2.
select'najmlodsza', a.maxData, b.nazwa, a.rodzaj from (select max(dataUr) maxData, rodzaj
from kreatura group by rodzaj) a, (select nazwa, dataUr from kreatura) b where a.maxData=b.dataUr 
union
select'najstarsza', a.minData, b.nazwa, a.rodzaj
from(select min(dataUr) minData, rodzaj from kreatura group by rodzaj) a,
 (select nazwa, dataUr from kreatura) b where a.minData=b.dataUr;
 # druga wersja
 select a.nazwa, a.rodzaj, a.dataUr from kreatura a,
 (select min(dataUr) min, max(dataUr) max
 from kreatura group by rodzaj) b
 where b.min=a.dataUr OR b.max=a.dataUr;
 #Zadanie 1 lab07
 #2.
 select idKreatury from kreatura;
 select distinct id_uczestnika from uczestnicy;
 select kreatura.nazwa from kreatura 
 left join uczestnicy on (kreatura.idKreatury=uczestnicy.id_uczestnika) 
 where uczestnicy.id_uczestnika is null;
 #Zadanie 2 
 # 1.
 select w.nazwa,
 count(u.id_uczestnika),group_concat(k.nazwa)
 from wyprawa w
 join uczestnicy u on w.id_wyprawy=u.id_wyprawy
 join kreatura k on k.idKreatury=u.id_uczestnika
 group by w.id_wyprawy;
 # 2.
 select w.nazwa, s.nazwa, ew.kolejnosc, k.nazwa as kierownik from wyprawa w
 join kreatura k on w.kierownik=k.idKreatury
 join etapy_wyprawy ew on ew.idWyprawy=w.id_wyprawy
 join sektor s on s.id_sektora=ew.sektor
 order by w.data_rozpoczecia asc, ew.kolejnosc desc;
 
 
 
 
 
 
 
