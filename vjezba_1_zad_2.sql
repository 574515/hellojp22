drop database if exists vjezba_2;
create database vjezba_2;
use vjezba_2;
#sifra int NOT NULL primary key auto_increment,
create table punac(
	sifra int NOT NULL primary key auto_increment,
	suknja varchar(40),
	vesta varchar(49) not null,
	prviputa datetime,
	brat int
);

create table brat(
	sifra int NOT NULL primary key auto_increment,
	gustoca decimal(13, 7),
	bojaciju varchar(47),
	modelnaocala varchar(47) not null,
	suknja varchar (44),
	maraka decimal(12, 10) not null,
	hlace varchar(48) not null
);

create table prijateljica(
	sifra int NOT NULL primary key auto_increment,
	dukserica varchar(39),
	eura decimal(14, 7),
	treciputa datetime,
	hlace varchar(44),
	zarucnik int
);

create table neprijateljica(
	sifra int NOT NULL primary key auto_increment,
	introvertno bool,
	vesta varchar(50) not null,
	gustoca decimal(16, 8),
	carape varchar(38) not null,
	lipa decimal(18, 5) not null,
	prijateljica int not null
);

create table svekar(
	sifra int NOT NULL primary key auto_increment,
	prstena int not null,
	jmbag char(11),
	lipa decimal(17, 7) not null,
	eura decimal(17, 9) not null,
	neprijateljica int not null
);

create table zarucnik(
	sifra int NOT NULL primary key auto_increment,
	indiferentno bool,
	carape varchar(38),
	kratkamajica varchar(39),
	ekstroventno bool not null,
	narukvica int,
	kuna decimal(14, 8)
);

create table zarucnik_Punica(
	sifra int NOT NULL primary key auto_increment,
	zarucnik int not null,
	punica int not null
);

create table punica(
	sifra int NOT NULL primary key auto_increment,
	bojaociju varchar(36),
	bojakose varchar(42) not null,
	majica varchar(30),
	prviputa datetime,
	hlace varchar(31),
	asocijalno bool not null
);

alter table punac add foreign key (brat) references brat(sifra);
alter table prijateljica add foreign key (zarucnik) references zarucnik(sifra);
alter table neprijateljica add foreign key (prijateljica) references prijateljica(sifra);
alter table svekar add foreign key (neprijateljica) references neprijateljica(sifra);
alter table zarucnik_Punica add foreign key (zarucnik) references zarucnik(sifra);
alter table zarucnik_Punica add foreign key (punica) references punica(sifra);

# describe prijateljica;
# select * from prijateljica;

insert into prijateljica (sifra, dukserica, eura, treciputa, hlace, zarucnik)
values (null, null, null, null, null, null);
insert into prijateljica (sifra, dukserica, eura, treciputa, hlace, zarucnik)
values (null, null, null, null, null, null);
insert into prijateljica (sifra, dukserica, eura, treciputa, hlace, zarucnik)
values (null, null, null, null, null, null);

# describe neprijateljica;

insert into neprijateljica (sifra, introvertno, vesta, gustoca, carape, lipa, prijateljica)
values (null, 1, 'plava', 23.5, 'zelene', 213.42, 1);
insert into neprijateljica (sifra, introvertno, vesta, gustoca, carape, lipa, prijateljica)
values (null, 0, 'smeđa', 1.27, 'žute', 0.02, 2);
insert into neprijateljica (sifra, introvertno, vesta, gustoca, carape, lipa, prijateljica)
values (null, 1, 'ljubičasta', 0.5, 'crne', 3.21, 3);

# select * from neprijateljica;
# describe zarucnik;

insert into zarucnik (sifra, ekstroventno)
values (null, 1);
insert into zarucnik (sifra, ekstroventno)
values (null, 0);
insert into zarucnik (sifra, ekstroventno)
values (null, 1);

# describe punica;

insert into punica (sifra, bojakose, asocijalno)
values (null, 'smeđa', 0);
insert into punica (sifra, bojakose, asocijalno)
values (null, 'plava', 1);
insert into punica (sifra, bojakose, asocijalno)
values (null, 'crna', 0);

# describe zarucnik_Punica;

insert into zarucnik_Punica (sifra, zarucnik, punica)
values (null, 1, 1);
insert into zarucnik_Punica (sifra, zarucnik, punica)
values (null, 2, 2);
insert into zarucnik_Punica (sifra, zarucnik, punica)
values (null, 3, 3);

# select * from zarucnik_Punica;








