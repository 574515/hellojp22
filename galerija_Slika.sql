# C:\xampp\mysql\bin\mysql -uedunova -pedunova < C:\Users\User\Projects\Edunova\hello\galerija_Slika.sql
drop database if exists galerija_Slika;
create database galerija_Slika;
use galerija_Slika;

CREATE TABLE djelo(
	sifra int NOT NULL primary key auto_increment,
    naziv varchar(50) NOT NULL,
    opis text,
    autor int NOT NULL
);

CREATE TABLE osoba(
	sifra int NOT NULL primary key auto_increment,
    ime varchar(50) NOT NULL,
    prezime varchar(50) NOT NULL,
    mjesto_Rodenja varchar(50),
	datum_Rodenja datetime	
);

CREATE TABLE autor(
	sifra int NOT NULL PRIMARY KEY auto_increment,
	osoba int	
);

CREATE TABLE kustos(
	sifra int NOT NULL PRIMARY KEY auto_increment,
	osoba int
);

alter table djelo add foreign key (autor) references osoba(sifra);
alter table autor add foreign key (osoba) references osoba(sifra);
alter table kustos add foreign key (osoba) references osoba(sifra);

insert into osoba (ime, prezime, mjesto_Rodenja, Datum_Rodenja) values
('Vincent', 'van Gogh', 'Zundert', '1853-03-30'),
('Thelma', 'Golden', 'St. Albans, Queens', '1965-09-22');

insert into autor (osoba) values (1);
insert into kustos (osoba) values (2);

# describe djelo;

insert into djelo  (naziv, opis, autor) values
('Zvjezdana noć', 'Zvjezdana noć je Van Goghovo ulje na platnu, slavno remek-djelo postimpresionizma, iz 1889. godine.', 1);

# select * from djelo;
# select * from autor;
# select * from kustos;
# select * from osoba;