drop database if exists vjezba_1;
create database vjezba_1;
use vjezba_1;

create table sestra(
	sifra int NOT NULL primary key auto_increment,
	jmbag char(11),
	hlace varchar(42) not null,
	vesta varchar(41),
	prviputa datetime not null,
	modelnaocala varchar(33),
	becar int
);

create table becar(
	sifra int NOT NULL primary key auto_increment,
	drugiputa datetime not null,
	carape varchar(36),
	bojaociju varchar(46),
	haljina varchar(32)
);

create table ostavljena(
	sifra int NOT NULL primary key auto_increment,
	jmbag char(11),
	bojaociju varchar(49),
	suknja varchar(31) not null,
	bojakose varchar(45) not null,
	prviputa datetime,
	carape varchar(41) not null
);

create table mladic(
	sifra int NOT NULL primary key auto_increment,
	prstena int not null,
	maraka decimal(15,9) not null,
	suknja varchar(30),
	narukvica int not null,
	ostavljena int not null
);

create table ostavljena_Sansa(
	sifra int NOT NULL primary key auto_increment,
	ostavljena int not null,
	sansa int not null
);

create table cura(
	sifra int NOT NULL primary key auto_increment,
	bojakose varchar(36),
	jmbag char(11) not null,
	prstena int not null,
	dukserica varchar(38),
	mladic int
);

create table sansa(
	sifra int NOT NULL primary key auto_increment,
	eura decimal(14,5),
	narukvica int,
	drugiputa datetime not null,
	carape varchar(41)
);

create table punac(
	sifra int NOT NULL primary key auto_increment,
	ekstroventno bool not null,
	vesta varchar(31),
	asocijalno bool not null,
	prviputa datetime,
	eura decimal(15,6) not null,
	cura int
);

alter table sestra add foreign key (becar) references becar(sifra);
alter table punac add foreign key (cura) references cura(sifra);
alter table cura add foreign key (mladic) references mladic(sifra);
alter table mladic add foreign key (ostavljena) references ostavljena(sifra);
alter table ostavljena_Sansa add foreign key (ostavljena) references ostavljena(sifra);
alter table ostavljena_Sansa add foreign key (sansa) references sansa(sifra);

# describe cura;

insert into cura (sifra, bojakose, jmbag, prstena, dukserica, mladic)
values (null, 'crna', 0154876985, 2, null, null);
insert into cura (sifra, bojakose, jmbag, prstena, dukserica, mladic)
values (null, 'plava', 4587489654, 3, 'smeđa', null);
insert into cura (sifra, bojakose, jmbag, prstena, dukserica, mladic)
values (null, 'smeđa', 7859654152, 12, null, null);

# select * from cura;
# describe ostavljena;

insert into ostavljena(sifra, suknja, bojakose, carape)
values(null, 'duga', 'smeđa', 'plave');
insert into ostavljena(sifra, suknja, bojakose, carape)
values(null, 'kratka', 'plava', 'crne');
insert into ostavljena(sifra, suknja, bojakose, carape)
values(null, 'nema', 'crna', 'smeđe');

# select * from ostavljena;
# describe mladic;

insert into mladic(sifra, prstena, maraka, suknja, narukvica, ostavljena)
values (null, 21, 213.48, null, 1, 1);
insert into mladic(sifra, prstena, maraka, suknja, narukvica, ostavljena)
values (null, 3, 5832.21, null, 2, 2);
insert into mladic(sifra, prstena, maraka, suknja, narukvica, ostavljena)
values (null, 9, 21652.37, null, 3, 3);

# select * from mladic;

# describe sansa;

insert into sansa(sifra, drugiputa)
values(null, '2020-03-18');
insert into sansa(sifra, drugiputa)
values(null, '2020-04-26');
insert into sansa(sifra, drugiputa)
values(null, '2020-05-03');

# describe ostavljena_Sansa;

insert into ostavljena_Sansa(sifra, ostavljena, sansa)
values(null, 1, 1);
insert into ostavljena_Sansa(sifra, ostavljena, sansa)
values(null, 2, 2);
insert into ostavljena_Sansa(sifra, ostavljena, sansa)
values(null, 3, 3);

# select * from ostavljena_Sansa;

select * from punac;
delete from punac where vesta != 'AB';

select suknja from mladic
where maraka != '7' and maraka != '11' and maraka != '18' and maraka != '25' and maraka != '40';

select a.vesta as sestra, b.prviputa as punac, c.jmbag as cura,
d.maraka as mladic, e.bojaociju as ostavljena
from sestra a, punac b, cura c, mladic d, ostavljena e
where d.maraka != 95 and e.bojaociju = '%be%'
order by c.jmbag DESC;

select a.bojaociju and a.suknja as ostavljena, b.sifra as ostavljena_Sansa
from ostavljena a, ostavljena_Sansa b
where b.sifra is null;







