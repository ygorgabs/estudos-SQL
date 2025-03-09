create database Projeto

use Projeto

create table tblEmpregado(
CodEmpregado int primary key,
NomeInic varchar(20),
NomeInt char(1),
NomeFin varchar(20),
DataNasc datetime,
Endereco varchar(60),
Sexo char(1) check(upper(Sexo) = 'm' or upper(Sexo) = 'f'),
Salario dec(15,2)
)

create table tblDependente(
CodDependente int primary key,
NomeDependente varchar(60),
SexoDep char(1) check(upper(SexoDep) = 'm' or upper(SexoDep) = 'f'),
DataNascDep date,
TipoDep char(1),
CodEmpregado int
)

create table tblDepartamento(
CodDepartamento int primary key,
NomeDepartamento varchar(60),
DataInicGer date,
CodCidade int
)

create table tblCidade(
CodCidade int primary key,
NomeCidade varchar(60)
)

create table tblEmpregadoProjeto(
CodEmpregado int,
CodProjeto int,
Horas int)

create table tblProjeto(
CodProjeto int primary key,
NomeProjeto varchar(60),
CodDepartamento int
)

alter table tblDependente 
add constraint fk_CodEmpregado foreign key (CodEmpregado) references tblEmpregado (CodEmpregado)

alter table tblDepartamento
add constraint fk_CodCidade foreign key (CodCidade) references tblCidade (CodCidade)

alter table tblProjeto
add constraint fk_CodDepartamento foreign key(CodDepartamento) references tblDepartamento (CodDepartamento)

alter table tblEmpregadoProjeto
add constraint fk_CodEmpregado_Proj foreign key (CodEmpregado) references tblEmpregado (CodEmpregado)

alter table tblEmpregadoProjeto
add constraint fk_CodProjeto foreign key (CodProjeto) references tblProjeto (CodProjeto)

-- Atividade 1
insert into tblCidade
values 
	(1,'Campo Grande'),
	(2,'Dourados'),
	(3,'Corumbá'),
	(4,'Três Lagos'),
	(5,'Ponta Porã'),
	(6,'Rio Verde'),
	(7,'Porto Murtinho'),
	(8,'Bonito'),
	(9,'Paranaíba');

-- Atividade 2
update tblCidade set NomeCidade = 'Cassilândia' where CodCidade = 9

-- Atividade 3
INSERT INTO tblDepartamento (CodDepartamento, NomeDepartamento, DataInicGer, CodCidade)
VALUES (1, 'Recursos Humanos', '2023-01-01', 1),
       (2, 'Desenvolvimento', '2023-01-01', 2),
       (3, 'Marketing', '2023-01-01', 3),
       (4, 'Vendas', '2023-01-01', 4);

INSERT INTO tblProjeto (CodProjeto, NomeProjeto, CodDepartamento)
VALUES (1, 'Projeto Alpha', 1),
       (2, 'Projeto Beta', 2),
       (3, 'Projeto Gamma', 3),
       (4, 'Projeto Delta', 4);

INSERT INTO tblEmpregado (CodEmpregado, NomeInic, NomeInt, NomeFin, DataNasc, Endereco, Sexo, Salario)
VALUES (1, 'João', 'J', 'Silva', '1990-01-01', 'Rua A, 123', 'M', 5000.00),
       (2, 'Maria', 'M', 'Oliveira', '1985-02-02', 'Rua B, 456', 'F', 6000.00),
       (3, 'Carlos', 'C', 'Santos', '1980-03-03', 'Rua C, 789', 'M', 7000.00),
       (4, 'Ana', 'A', 'Lima', '1995-04-04', 'Rua D, 101', 'F', 5500.00);

INSERT INTO tblDependente (CodDependente, NomeDependente, SexoDep, DataNascDep, TipoDep, CodEmpregado)
VALUES (1, 'Pedro', 'M', '2010-05-05', 'F', 1),
       (2, 'Luiza', 'F', '2012-06-06', 'F', 2),
       (3, 'Paulo', 'M', '2014-07-07', 'F', 3),
       (4, 'Carla', 'F', '2016-08-08', 'F', 4);

-- Atividade 4
select * from tblEmpregado

-- Atividade 5
select CodEmpregado, NomeInic, NomeFin from tblEmpregado

-- Atividade 6
select NomeInic, NomeFin from tblEmpregado order by NomeFin asc

-- Atividade 7
select DataNasc from tblEmpregado where NomeInic = 'João' and NomeFin = 'Silva'

-- Atividade 9
select * from tblEmpregado where Salario between 3000 and 6000

-- Atividade 10
select * from tblEmpregado where NomeFin like 's%'

-- Atividade 11
select NomeInic, DataNasc from tblEmpregado order by DataNasc desc  

-- Atividade 12
select NomeInic, Salario, (Salario * 0.9) as Salario_Reduzido from tblEmpregado