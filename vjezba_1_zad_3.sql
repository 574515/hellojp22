drop database if exists vjezba_3;
create database vjezba_3;
use vjezba_3;

#sifra int NOT NULL primary key auto_increment,

create table cura(
	sifra int NOT NULL primary key auto_increment,
	suknja varchar(35),
	gustoca decimal(16, 8),
	ogrlica int NOT NULL,
	narukvica int,
	hlace varchar(40),
	decko int
);

create table decko(
	sifra int NOT NULL primary key auto_increment,
	suknja varchar(45) not null,
	carape varchar(30) not null,
	dukserica varchar(32) not null
);

alter table cura add foreign key (decko) references decko(sifra);

create table prijatelj(
	sifra int NOT NULL primary key auto_increment,
	kuna decimal(17, 5),
	asocijalno bool,
	bojaociju varchar(43) not null,
	prviputa datetime not null,
	hlace varchar(45),
	modelnaocala varchar(37) not null,
	brat int
);

create table brat(
	sifra int NOT NULL primary key auto_increment,
	narukvica int,
	introvertno bool,
	ekstroventno bool not null,
	vesta varchar(50) not null,
	nausnica int not null,
	neprijatelj int
);

create table neprijatelj(
	sifra int NOT NULL primary key auto_increment,
	prstena int,
	carape varchar(36),
	nausnica int,
	prviputa datetime,
	stilfrizura varchar(39),
	becar int not null
);

create table becar(
	sifra int NOT NULL primary key auto_increment,
	vesta varchar(42) not null,
	novcica decimal(14, 9),
	esktroventno bool,
	modelnaocala varchar(35) not null,
	bojaociju varchar(44),
	maraka decimal(16, 8)
);

create table becar_Djevojka(
	sifra int NOT NULL primary key auto_increment,
	becar int not null,
	djevojka int not null
);

create table djevojka(
	sifra int NOT NULL primary key auto_increment,
	introvertno bool not null,
	maraka decimal(18, 9),
	haljina varchar(47),
	hlace varchar(33) not null,
	prviputa datetime
);

alter table prijatelj add foreign key (brat) references brat(sifra);
alter table brat add foreign key (neprijatelj) references neprijatelj(sifra);
alter table neprijatelj add foreign key (becar) references becar(sifra);
alter table becar_djevojka add foreign key (becar) references becar(sifra);
alter table becar_djevojka add foreign key (djevojka) references djevojka(sifra);


# describe brat;
insert into brat (ekstroventno, vesta, nausnica)
values (1, 'plava', 213);
insert into brat (ekstroventno, vesta, nausnica)
values (0, 'žuta', 74);
insert into brat (ekstroventno, vesta, nausnica)
values (0, 'zelena', 2);
# select * from brat;

# describe becar;
insert into becar (vesta, modelnaocala)
values ('plava', 'Ray-Ban');
insert into becar (vesta, modelnaocala)
values ('žuta', 'Gucci');
insert into becar (vesta, modelnaocala)
values ('crvena', 'Prada');
# select * from becar;

# describe neprijatelj;
insert into neprijatelj (becar)
values (1);
insert into neprijatelj (becar)
values (2);
insert into neprijatelj (becar)
values (3);
# select * from neprijatelj;

# describe djevojka;
insert into djevojka (introvertno, hlace)
values(1, 'smeđe');
insert into djevojka (introvertno, hlace)
values(0, 'plave');
insert into djevojka (introvertno, hlace)
values(1, 'crne');
# select * from djevojka;

# describe becar_Djevojka;
insert into becar_Djevojka (becar, djevojka)
values(1, 2);
insert into becar_Djevojka (becar, djevojka)
values(3, 1);
insert into becar_Djevojka (becar, djevojka)
values(2, 3);
# select * from becar_Djevojka;

# select * from cura;
update cura set gustoca = 14.76;

# select * from prijatelj;
delete from prijatelj where asocijalno = 0;

select nausnica from neprijatelj where carape like '%ana%';

select a.ogrlica, b.prviputa, c.introvertno
from cura as a, prijatelj as b, brat as c, neprijatelj as d, becar as e
where d.carape like 'a%' and e.novcica != 28
order by c.introvertno asc;

select a.novcica, a.esktroventno 
from becar as a, becar_djevojka as b
where a.sifra not in (b.becar);