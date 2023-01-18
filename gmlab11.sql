# zti bazy lab03
# zad 1.
SELECT dzial.nazwa,max(pracownik.pensja),min(pracownik.pensja),
avg(pracownik.pensja) FROM dzial INNER JOIN pracownik
ON dzial.id_dzialu = pracownik.dzial GROUP by dzial.nazwa;

# zad 2
SELECT klient.pelna_nazwa,sum(ilosc*cena) AS wartosc
 FROM klient INNER JOIN zamowienie
 ON klient.id_klienta=zamowienie.klient
INNER JOIN pozycja_zamowienia 
ON zamowienie.id_zamowienia=pozycja_zamowienia.zamowienie
 GROUP BY klient.id_klienta ORDER BY wartosc DESC limit 10;
 
#zad 3
SELECT year(data_zamowienia),
sum(pozycja_zamowienia.cena*pozycja_zamowienia.ilosc)
as suma FROM pozycja_zamowienia 
INNER JOIN zamowienie 
ON pozycja_zamowienia.zamowienie=zamowienie.id_zamowienia
INNER JOIN  status_zamowienia 
ON status_zamowienia.id_statusu_zamowienia=zamowienie.status_zamowienia 
WHERE status_zamowienia.nazwa_statusu_zamowienia="zrealizowane" 
GROUP BY year(data_zamowienia) ORDER BY suma DESC;

# zad 4.
SELECT sum(pozycja_zamowienia.cena*pozycja_zamowienia.ilosc) 
as suma FROM pozycja_zamowienia INNER JOIN zamowienie
ON pozycja_zamowienia.zamowienie=zamowienie.id_zamowienia
INNER JOIN status_zamowienia 
ON status_zamowienia.id_statusu_zamowienia=zamowienie.status_zamowienia
 WHERE status_zamowienia.nazwa_statusu_zamowienia="anulowane";

# zad 5.

SELECT adres_klienta.miejscowosc,count(*),
SUM(pozycja_zamowienia.ilosc*pozycja_zamowienia.cena)
FROM zamowienie 
INNER JOIN pozycja_zamowienia 
ON pozycja_zamowienia.zamowienie=zamowienie.id_zamowienia
INNER JOIN klient 
ON zamowienie.klient=klient.id_klienta
INNER JOIN adres_klienta
 ON klient.id_klienta=adres_klienta.klient 
INNER JOIN typ_adresu
 ON adres_klienta.typ_adresu=typ_adresu.id_typu
WHERE typ_adresu.nazwa="podstawowy"
GROUP BY adres_klienta.miejscowosc;

# zad.6
SELECT sum((pozycja_zamowienia.cena-towar.cena_zakupu)*pozycja_zamowienia.ilosc)
as suma FROM pozycja_zamowienia 
INNER JOIN zamowienie ON pozycja_zamowienia.zamowienie=zamowienie.id_zamowienia
INNER JOIN towar ON pozycja_zamowienia.towar=towar.id_towaru
INNER JOIN  status_zamowienia 
ON status_zamowienia.id_statusu_zamowienia=zamowienie.status_zamowienia
 WHERE status_zamowienia.nazwa_statusu_zamowienia="zrealizowane";

#zad.7
SELECT year(zamowienie.data_zamowienia),
sum((pozycja_zamowienia.cena-towar.cena_zakupu)*pozycja_zamowienia.ilosc)
 as suma FROM pozycja_zamowienia 
INNER JOIN zamowienie 
ON pozycja_zamowienia.zamowienie=zamowienie.id_zamowienia
INNER JOIN towar ON pozycja_zamowienia.towar=towar.id_towaru
INNER JOIN  status_zamowienia 
ON status_zamowienia.id_statusu_zamowienia=zamowienie.status_zamowienia
 WHERE status_zamowienia.nazwa_statusu_zamowienia="zrealizowane" 
 GROUP BY year(zamowienie.data_zamowienia);
 
# zad.8
SELECT kategoria,
SUM(towar.cena_zakupu*stan_magazynowy.ilosc) FROM towar 
INNER JOIN stan_magazynowy
 ON towar.id_towaru=stan_magazynowy.towar
 GROUP BY towar.kategoria;

#zad 9
SELECT monthname(data_urodzenia),count(id_pracownika)
 from pracownik GROUP BY month(data_urodzenia)
 ORDER BY month(data_urodzenia);
 
# zad 10.
SELECT pracownik.imie,pracownik.nazwisko,
 TIMESTAMPDIFF(MONTH,data_zatrudnienia,CURDATE()) * pracownik.pensja
 AS koszt FROM pracownik AS pracownik;