drop database if exists galerija_Slika;
create database galerija_Slika;
use galerija_Slika;

CREATE TABLE djelo(
	sifra int NOT NULL primary key auto_increment,
    naziv varchar(50) NOT NULL,
    opis text,
    autor int NOT null,
    muzej int not NULL
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
	osoba int not NULL
);

CREATE TABLE kustos(
	sifra int NOT NULL PRIMARY KEY auto_increment,
	osoba int not NULL
);

CREATE TABLE direktor(
	sifra int NOT NULL PRIMARY KEY auto_increment,
	osoba int not NULL
);

create table muzej(
	sifra int NOT NULL PRIMARY KEY auto_increment,
	naziv varchar(50) not null,
	lokacija varchar(150) not null,
	osnovan datetime,
	tip varchar(50),
	direktor int not NULL
);

alter table djelo add foreign key (autor) references osoba(sifra);
alter table autor add foreign key (osoba) references osoba(sifra);
alter table kustos add foreign key (osoba) references osoba(sifra);
alter table direktor add foreign key (osoba) references osoba(sifra);
alter table muzej add foreign key (direktor)  references direktor(sifra);

insert into osoba (ime, prezime, mjesto_Rodenja, Datum_Rodenja) values
('Glenn David', 'Lowry', 'New York City, New York', '1954-09-28'),
('Vincent', 'van Gogh', 'Zundert', '1853-03-30'),
('Ann', 'Temkin', 'Torrington, Connecticut', '1959-12-26'),
('Thaddeus John', 'Szarkowski', 'Ashland, Wisconsin', '1925-12-18');


insert into direktor (osoba) values (1);
insert into autor (osoba) values (2);
insert into kustos (osoba) values (3), (4);

# describe muzej;

insert into muzej (naziv, lokacija, osnovan, tip, direktor) values
('Museum of Modern Art', '11 West 53rd Street, Manhattan, New York City', '1929-11-07', 'Muzej umjetnosti', 1);

# describe djelo;

insert into djelo  (naziv, opis, autor, muzej) values
('Zvjezdana noć', 'Zvjezdana noć je Van Goghovo ulje na platnu, slavno remek-djelo postimpresionizma, iz 1889. godine.', 2, 1);

# select * from djelo;
# select * from autor;
# select * from kustos;
# select * from osoba;