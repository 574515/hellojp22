drop database if exists vjezba_4;
create database vjezba_4;
use vjezba_4;

CREATE TABLE svekrva(
	sifra int NOT NULL primary key auto_increment,
	hlace varchar(44) NOT NULL,
	stilfrizura varchar(33) NOT NULL,
	treciputa datetime,
	carape varchar(39),
	gustoca decimal(16, 10) not null
);

create table prijateljica(
	sifra int NOT NULL primary key auto_increment,
	suknja varchar(46),
	ogrlica int not null,
	eura decimal(12, 7) not null,
	introvertno bool not null,
	svekrva int not null
);

alter table prijateljica add foreign key (svekrva) references svekrva(sifra);

create table prijatelj(
	sifra int NOT NULL primary key auto_increment,
	indiferentno bool,
	haljina varchar(40),
	ekstroventno bool,
	lipa decimal(18, 5),
	ogrlica int not null,
	neprijatelj int
);

create table neprijatelj(
	sifra int NOT NULL primary key auto_increment,
	prviputa datetime not null,
	indiferentno bool not null,
	introvertno bool not null,
	nausnica int,
	vesta varchar(35),
	novcica decimal(17, 9),
	sestra int not null
);

create table sestra(
	sifra int NOT NULL primary key auto_increment,
	indiferentno bool not null,
	prviputa datetime not null,
	suknja varchar(38),
	haljina varchar(31) not null,
	majica varchar(41) not null,
	zarucnica int
);

create table zarucnica(
	sifra int NOT NULL primary key auto_increment,
	ekstroventno bool,
	jmbag char(11),
	novcica decimal (18, 6) not null,
	treciputa datetime not null
);

create table zarucnica_Mladic(
	sifra int NOT NULL primary key auto_increment,
	zarucnica int not null,
	mladic int not null
);

create table mladic(
	sifra int NOT NULL primary key auto_increment,
	majica varchar(42) not null,
	eura decimal(16, 9) not null,
	hlace varchar(45) not null,
	nausnica int,
	bojaociju varchar(35) not null
);

alter table neprijatelj add foreign key (sestra) references sestra(sifra);
alter table zarucnica_Mladic add foreign key (zarucnica) references zarucnica(sifra);
alter table zarucnica_Mladic add foreign key (mladic) references mladic(sifra);

# describe sestra;
insert into sestra (indiferentno, prviputa, haljina, majica)
values (0, '2009-03-01', 'plava', 'ljubčasta');
insert into sestra (indiferentno, prviputa, haljina, majica)
values (1, '2011-10-09', 'crvena', 'žuta');
insert into sestra (indiferentno, prviputa, haljina, majica)
values (0, '2019-12-03', 'zelena', 'crna');
# select * from sestra;

# describe neprijatelj;
insert into neprijatelj (prviputa, indiferentno, introvertno, sestra)
values ('2001-03-02', 1, 1, 3);
insert into neprijatelj (prviputa, indiferentno, introvertno, sestra)
values ('2011-04-20', 0, 0, 1);
insert into neprijatelj (prviputa, indiferentno, introvertno, sestra)
values ('2001-12-23', 1, 0, 2);
# select * from neprijatelj;

# describe zarucnica;
insert into zarucnica (novcica, treciputa)
values (12.4, '2011-03-02');
insert into zarucnica (novcica, treciputa)
values (5123.23, '2020-04-20');
insert into zarucnica (novcica, treciputa)
values (213.49, '2010-12-23');
# select * from zarucnica;

# describe mladic;
insert into mladic (majica, eura, hlace, bojaociju)
values ('plava', 23.41, 'crne', 'smeđe');
insert into mladic (majica, eura, hlace, bojaociju)
values ('žuta', 1.93, 'zelen', 'sive');
insert into mladic (majica, eura, hlace, bojaociju)
values ('crna', 2183.21, 'plave', 'plave');
# select * from mladic;

# describe zarucnica_Mladic;
insert into zarucnica_Mladic (zarucnica, mladic)
values (3, 2);
insert into zarucnica_Mladic (zarucnica, mladic)
values (1, 1);
insert into zarucnica_Mladic (zarucnica, mladic)
values (2, 3);
# select * from zarucnica_Mladic;

update prijateljica set ogrlica = 17;
# select * from prijateljica;

delete from prijatelj where haljina > 'AB';

select suknja from sestra where prviputa = null;

select a.eura, b.lipa, c.indiferentno
from prijateljica a, prijatelj b, neprijatelj c, sestra d, zarucnica e
where d.prviputa is not null and e.jmbag is not null
order by c.indiferentno desc;

select a.jmbag, a.novcica
from zarucnica as a, zarucnica_mladic as b
where a.sifra not in (b.zarucnica);