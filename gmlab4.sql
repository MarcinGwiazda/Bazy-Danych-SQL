#lab4 Zadanie 3
# a)
Select* from postac;
UPDATE postac SET nazwa_statku='statek1' WHERE nazwa LIKE "%a%";
# b)
Select* from statek;
Update statek SET max_ladownosc=10000*0.7 WHERE nazwa_statku='statek1';
Update statek SET max_ladownosc=2000 WHERE nazwa_statku='statek2' ; 
Update statek SET max_ladownosc=2000*0.7 WHERE nazwa_statku='statek2';
#c)
Select*from postac;
Select*from postac WHERE wiek<=1000;
ALTER TABLE postac ADD CHECK(wiek<=1000);
#Zadanie 4 
# a)
Select*from postac;
Alter Table postac MODIFY COLUMN rodzaj enum('wiking','ptak','kobieta','syrena','waz') 	DEFAULT NULL AFTER nazwa;
Show create table postac;
INSERT INTO postac(id_postaci,nazwa,rodzaj,data_ur, wiek, pesel) VALUES(10,'Loko', 'waz', '1850-11-30', 170, 21212121212);
# b)
CREATE TABLE marynarz(id_postaci INT NOT NULL, nazwa VARCHAR(40) NOT NULL, rodzaj ENUM('wiking','ptak','kobieta','syrena','waz') DEFAULT NULL, data_ur DATE DEFAULT NULL, wiek int unsigned DEFAULT NULL, funkcja VARCHAR(50) DEFAULT NULL, nazwa_statku VARCHAR(50) NOT NULL, pesel INT(11) NOT NULL);
select* from marynarz;
drop table marynarz;
CREATE TABLE marynarz AS SELECT* FROM postac;
DELETE FROM marynarz WHERE  id_postaci=10;
# c)
show create table marynarz;
ALTER TABLE marynarz ADD PRIMARY KEY (pesel);
ALTER TABLE marynarz ADD FOREIGN KEY (nazwa_statku) REFERENCES statek(nazwa_statku);
#Zadanie 5
# a)
UPDATE postac SET nazwa_statku=DEFAULT WHERE nazwa_statku='statek1';
select* from postac;
# b)
DELETE FROM marynarz WHERE nazwa='Wiking3';
DELETE FROM postac WHERE nazwa='Wiking3';