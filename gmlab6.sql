# Zadanie 3 lab05
# 2.
SELECT* FROM zasob;
SELECT* FROM zasob WHERE rodzaj IS NOT NULL ORDER BY waga ASC;
# 3.
SELECT* FROM kreatura;
SELECT* FROM kreatura ORDER BY dataUr limit 5;
# Zadanie 4
# 1.
SELECT DISTINCT rodzaj FROM zasob;
# 2.
SELECT concat(nazwa,"-",rodzaj) from kreatura WHERE rodzaj LIKE "wi%";
# 3.
SELECT* ,ilosc*waga AS waga_calkowita FROM zasob WHERE YEAR(dataPozyskania) BETWEEN 2000 AND 2007;
#Zadanie 5
# 1.
SELECT* FROM zasob;
SELECT* , waga*ilosc*0.7 as wagaNetto, waga*ilosc*0.3 as odpadki FROM zasob;
# 2.
SELECT* FROM zasob WHERE rodzaj IS NULL;
# 3.
SELECT DISTINCT(rodzaj) FROM zasob WHERE nazwa LIKE 'Ba%' or  nazwa LIKE '%os';

# Zadanie 1 lab06
# 1.
SELECT* FROM kreatura;
SELECT AVG(waga) AS sredniaWagaWikingow FROM kreatura WHERE rodzaj ='wiking';
# 2.
SELECT COUNT(nazwa) FROM kreatura;
SELECT rodzaj, avg(waga) , count(nazwa) FROM kreatura GROUP BY rodzaj;
# 3.
SELECT rodzaj, AVG(year(curdate())-year(dataUr)) AS wiek FROM kreatura GROUP BY rodzaj;
show create table kreatura;
# Zadanie 2
# 1.
SELECT rodzaj, sum(waga) FROM zasob GROUP BY rodzaj; 
# 2.
SELECT* FROM zasob;
SELECT nazwa, avg(waga) FROM zasob WHERE ilosc>=4 GROUP BY nazwa having avg(waga)>10;
# 3.
SELECT rodzaj, count(*) as iloscRekordow FROM zasob GROUP BY rodzaj having iloscRekordow>1;

