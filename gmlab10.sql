 # zti bazy lab02
 # zadanie 1. czesc 2
 SELECT imie, nazwisko, nazwa FROM pracownik, dzial
 WHERE dzial.id_dzialu=pracownik.dzial;
 # 2.
 SELECT nazwa_towaru, nazwa_kategori,
 ilosc FROM towar t INNER JOIN kategoria k
 ON (t.kategoria=k.id_kategori)
 INNER JOIN stan_magazynowy sm
 ON (t.id_towaru=sm.towar);
 # 3.
 select z.id_zamowienia from
 zamowienie z inner join 
 status_zamowienia st on 
 z.status_zamowienia = st.id_statusu_zamowienia
 where z.status_zamowienia = 6;
 # 4.
 SELECT klient.* FROM klient INNER JOIN adres_klienta
 ON (klient.id_klienta=adres_klienta.klient) 
 INNER JOIN typ_adresu
 ON (adres_klienta.typ_adresu=typ_adresu.id_typu)
 WHERE adres_klienta.miejscowosc='Olsztyn'
 AND typ_adresu.nazwa='podstawowy';
 # 5.
SELECT jm.id_jednostki, sm.jm FROM jednostka_miary jm 
left join stan_magazynowy sm on sm.jm=jm.id_jednostki
where sm.jm is not null;
# 6.
SELECT z.numer_zamowienia,t.nazwa_towaru,
pz.ilosc,pz.cena 
FROM zamowienie z INNER JOIN pozycja_zamowienia pz
ON z.id_zamowienia=pz.zamowienie 
INNER JOIN towar t ON pz.towar=t.id_towaru
WHERE year(data_zamowienia)=2018;
 # 7.
 CREATE TABLE gwiazdam.towary_full_info AS
SELECT t.nazwa_towaru,t.cena_zakupu,
k.nazwa_kategori,sm.ilosc,
jm.nazwa FROM towar t INNER JOIN kategoria k
 ON t.kategoria=k.id_kategori
INNER JOIN stan_magazynowy sm
 ON t.id_towaru=sm.towar
 INNER JOIN jednostka_miary jm
 ON jm.id_jednostki=sm.jm;
 # 8.
 SELECT pz.* FROM pozycja_zamowienia pz
 INNER JOIN zamowienie z
 ON z.id_zamowienia=pz.zamowienie
 ORDER BY z.data_zamowienia ASC LIMIT 5;
 # 9.
SELECT z.numer_zamowienia,
sz.nazwa_statusu_zamowienia 
from zamowienie z INNER JOIN status_zamowienia sz
 ON z.status_zamowienia=sz.id_statusu_zamowienia
WHERE sz.nazwa_statusu_zamowienia != "zrealizowane";
# 10.
SELECT * FROM adres_klienta
WHERE kod NOT LIKE "__-___";
# lab03
# zadanie 3.
SELECT d.nazwa, COUNT(p.id_pracownika) 
FROM dzial d INNER JOIN pracownik p
 ON d.id_dzialu=p.dzial GROUP BY d.nazwa;


