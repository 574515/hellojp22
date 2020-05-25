drop database if exists galerija_Exclusive;
create database galerija_Exclusive;
use galerija_Exclusive;

create table osoba(
	ime varchar(50) not null,
	prezime varchar(50) not null,
	rodjendan datetime,
	oib char(11),
	mjesto_Rodjenja varchar(50),
	IBAN varchar(50),
	kontakt varchar(100),
	sifra int not null primary key auto_increment 
);

create table korisnik(
	osoba int not null,
	kup_Djelo int,
	prod_Djelo int,
	transakcija int,
	sifra int not null primary key auto_increment
);

create table autor(
	osoba int not null,
	sifra int not null primary key auto_increment
);

create table kustos(
	osoba int not null,
	sifra int not null primary key auto_increment
);

create table djelo(
	naziv varchar(100) not null,
	autor int not null,
	datum datetime,
	opis text,
	sifra int not null primary key auto_increment
);

create table transakcija(
	djelo int not null,
	status varchar(50) not null,
	cijena float,
	sifra int not null primary key auto_increment
);

create table izlozba(
	dat_Pocetka datetime not null,
	dat_Zavrsetka datetime not null,
	tema varchar(100),
	kustos int not null,
	sifra int not null primary key auto_increment
);

alter table korisnik add foreign key (osoba) references osoba(sifra);
alter table autor add foreign key (osoba) references osoba(sifra);
alter table kustos add foreign key (osoba) references osoba(sifra);

alter table djelo add foreign key (autor) references autor(sifra);
alter table transakcija add foreign key (djelo) references djelo(sifra);
alter table izlozba add foreign key (kustos) references kustos(sifra);

alter table korisnik add foreign key (kup_djelo) references djelo(sifra);
alter table korisnik add foreign key (prod_djelo) references djelo(sifra);
alter table korisnik add foreign key (transakcija) references transakcija(sifra);






