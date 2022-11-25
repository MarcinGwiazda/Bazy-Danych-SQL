# Zadanie 5 lab04
# c)
SELECT* FROM statek;
SELECT* FROM postac;
DELETE FROM statek WHERE nazwa_statku='statek1';
DELETE FROM statek WHERE nazwa_statku='statek2';
SHOW CREATE TABLE statek;
ALTER TABLE marynarz DROP CONSTRAINT marynarz_ibfk_1;
# d)
DROP TABLE statek;
ALTER TABLE postac DROP CONSTRAINT postac_ibfk_1;
# e)
CREATE TABLE zwierz ( id INT AUTO_INCREMENT PRIMARY KEY, nazwa VARCHAR(40), wiek INT ); 
DROP TABLE zwierz;
SELECT* FROM zwierz;
# f)
INSERT INTO zwierz(id, nazwa,wiek) SELECT id_postaci,nazwa,wiek FROM postac WHERE rodzaj='ptak';
INSERT INTO zwierz(id, nazwa,wiek) SELECT id_postaci,nazwa,wiek FROM postac WHERE rodzaj='waz';

#Zadanie 1 lab05
#a)
SELECT* FROM kreatura;
CREATE TABLE kreatura AS SELECT* FROM wikingowie.kreatura;
#b)
SELECT* FROM zasob;
#c)
SELECT* FROM zasob WHERE rodzaj='jedzenie';
#d)
SELECT ilosc FROM zasob WHERE idZasobu IN (1,3,5);
#Zadanie 2
#a) 
SELECT* FROM kreatura WHERE waga >50;
#b)
SELECT*FROM zasob;
SELECT* FROM zasob WHERE waga BETWEEN 2 AND 5; 
#c)
SELECT*FROM kreatura;
SELECT* FROM kreatura WHERE nazwa LIKE "%or%" AND udzwig BETWEEN 30 AND 70;
#Zadanie 3
#a)
SELECT*FROM zasob;
SELECT* FROM zasob WHERE MONTH(dataPozyskania) BETWEEN 7 AND 8;

