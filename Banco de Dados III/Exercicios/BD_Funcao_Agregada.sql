create database Agregada
go
use agregada
go
create table Alunos(
Matricula int not null primary key identity(1,1),
Nome varchar(50),
Sexo char(1) check(upper(sexo)='m' or upper(sexo)='f'),
Idade int
)
go
insert into Alunos
values
	('Marcelo Medeiros', 'm', 35),
	('Ana Paula Berlim', 'f',25),
	('Lucas Silva', 'm', 7),
	('Caroline Silva', 'f', 19),
	('Djalma Medeiros','m',65),
	('Artur Paes','m',5),
	('Eduarda Duda','f', 8);

--ex 3
select * from Alunos where Sexo like 'm'

--ex 4
select * from Alunos where Nome like '% Medeiros' order by Idade 

--ex 5
select avg(Idade) as media from Alunos

--ex 6
select max(Idade) as idade_maxima from Alunos

--ex 7
select count(*) as conta_idades from Alunos where Idade <=20

--ex 8
select Matricula, Idade from Alunos where Nome like 'Lucas Silva'

--ex 9
select count(*) as Qtd_Alunos from Alunos where Idade between 10 and 20 and Sexo like 'm'

--ex 10
select count(*) as Mulheres from Alunos where Sexo like 'f'

--ex 11 
select sexo, count(*) as quantidade from Alunos group by sexo

--ex 12
select count(*) as Alunos_Separados from Alunos group by Sexo 

--ex 13
select * from Alunos where Nome like '___u%'