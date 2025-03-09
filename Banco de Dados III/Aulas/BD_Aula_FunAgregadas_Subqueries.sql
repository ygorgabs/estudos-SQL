create database Aula01

go

use Aula01

go

create table CARGO(
    COD_CARGO int primary key identity,
    NOME_CARGO varchar(50)
)

create table FUNCIONARIO(
    COD_FUNC int primary key identity,
    COD_CARGO int foreign key references CARGO(COD_CARGO),
    NOME_FUNC varchar(50)
)

create table DEPENDENTE(
	COD_DEP int primary key identity,
	COD_FUNC int foreign key references FUNCIONARIO(COD_FUNC),
	NOME_DEP varchar(50)
)

insert into CARGO
	values
	('Diretor Presidente'),
	('Diretor Administrativo'),
	('Supervisor'),
	('Auxiliar de Sistemas'),
	('Analista Comercial');


