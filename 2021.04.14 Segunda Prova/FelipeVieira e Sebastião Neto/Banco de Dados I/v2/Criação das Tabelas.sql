create table bairro(
cdbairro integer not null,
nmbairro varchar(20) null,
cdcidade integer not null,
sgestado char(2) not null,
primary key(cdbairro, cdcidade,sgestado)
);

create table cidade(
cdcidade integer not null,
nmcidade varchar(20) null,
sgestado char(2) not null,
primary key (cdcidade, sgestado)
);

create table comprador(
cdcomprador integer not null,
nmcomprador varchar(40) null,
nmendereco varchar(40) null,
nrcpf integer null,
nmcidade varchar(20) null,
nmbairro varchar(20) null,
sgestado char(2) null,
telefone varchar(20) null,
email varchar(80) null,
primary key(cdcomprador)
);

create table estado(
sgestado char(2) not null,
nmestado varchar(20) null,
primary key (sgestado)
);

create table faixa_imovel(
cdfaixa integer not null,
nmfaixa varchar(30) null,
vlminimo real null,
vlmaximo real null,
primary key(cdfaixa)
);


create table imovel(
cdimovel integer not null,
cdvendedor integer null,
cdbairro integer null,
cdcidade integer null,
cdfaixa integer null,
sgestado char(2) null,
nmendereco varchar(40) null,
nrareautil real null,
nrareatotal real null,
dsimovel varchar(300) null,
vlpreco real null,
nrofertas integer null,
stvendido char(1) null,
dtlancto date null,
imovel_indicado integer null,
primary key (cdimovel)
);


create table oferta(
cdcomprador integer not null,
cdimovel integer  null,
vloferta real null,
dtoferta date null,
primary key (cdcomprador,cdimovel)
);


create table vendedor(
cdvendedor integer not null,
nmvendedor varchar(40) null,
nmendereco varchar(40) null,
nrcpf integer null,
nmcidade varchar(20) null,
nmbairro varchar(20) null,
sgestado char(2) null,
telefone varchar(20) null,
email varchar(80) null,
primary key(cdvendedor)
);

alter table bairro
add foreign key(cdcidade, sgestado) references cidade (cdcidade, sgestado);

alter table cidade
add foreign key(sgestado) references estado (sgestado);

alter table imovel
add foreign key(cdvendedor) references vendedor (cdvendedor);

alter table imovel
add foreign key(cdbairro,cdcidade,sgestado) references bairro (cdbairro,cdcidade,sgestado);

alter table oferta
add foreign key(cdimovel) references imovel (cdimovel);

alter table oferta
add foreign key(cdcomprador) references comprador (cdcomprador);

alter table imovel
add foreign key(cdfaixa) references faixa_imovel (cdfaixa);

