use master
go

IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = 'Exercicio2Subquerie')
	DROP DATABASE Exercicio2Subquerie

CREATE DATABASE Exercicio2Subquerie
go
use Exercicio2Subquerie
go

/* Cria as tabelas do Banco de Dados */
Create table Bairro 
(
	CdBairro int not null,
	NmBairro varchar(20),
	CdCidade int not null,
	SgEstado char(2) not null
)

/* Cria o �ndice para a tabela */
go
Create index XBairro on Bairro (CdCidade, SgEstado)
go
Alter table Bairro
	Add constraint PKBairro primary key (CdBairro,CdCidade,SgEstado)
go
Create table Cidade 
(
	CdCidade int not null,
	NmCidade varchar(20),
	SgEstado char(2) not null
)
go
Create index XCidade on Cidade (SgEstado)
go
Alter table Cidade
	Add constraint PKCidade primary key (CdCidade,SgEstado)
go
Create table Comprador 
(
	CdComprador int not null,
	NmComprador varchar(40),
	NmEndereco  varchar(40),
	NrCPF       numeric (11),
	NmCidade    varchar(20),
	NmBairro    varchar(20),
	SgEstado    char(2),
	Telefone    varchar(20),
	Email       varchar(80)
)
go
Alter table Comprador
	Add constraint PKComprador primary key (CdComprador)
go
Create table Estado 
(
	SgEstado char(2) not null,
	NmEstado varchar(20)
)
go
Alter table Estado
	Add constraint PKEstado primary key (SgEstado)
go
Create table FaixaImovel 
(
	CdFaixa  int primary key,
	NmFaixa  varchar(30),
	VlMinimo dec(14,2),
	VlMaximo dec(14,2)
)
go
Create table Imovel 
(
	CdImovel	int primary key,
	CdVendedor  int,
	CdBairro	int,
	CdCidade	int,
	SgEstado	char(2),
	NmEndereco	varchar(40),
	NrAreaUtil	dec(10,2),
	NrAreaTotal dec(10,2),
	DsImovel	varchar(300),
	VlPreco		dec(16,2),
	NrOfertas	int,
	StVendido	char(1),
	DtLancto	date
)
go
Create index XImovel on Imovel (CdVendedor)
go
Create table Oferta 
(
	CdComprador int,
	CdImovel	int,
	VlOferta	dec(14,2),
	DtOferta	date
)
go
Create table Vendedor 
(
	CdVendedor int primary key,
	NmVendedor varchar(40),
	NmEndereco varchar(40),
	NrCPF	   numeric(11),
	NmCidade   varchar(20),
	NmBairro   varchar(20),
	SgEstado   char(2),
	Telefone   varchar(20),
	Email	   varchar(80)
)
go
Alter table Bairro
	Add constraint FKCidadeBairro Foreign key (CdCidade,SgEstado)
		references Cidade
go
Alter table Cidade
	Add constraint FKEstadoCidade Foreign key (SGEstado)
		references Estado
go
Alter table Imovel
	Add constraint FKVendedorImovel foreign key (CdVendedor)
		references Vendedor

go
Alter table Imovel
	Add constraint FKBairroImovel foreign key (CdBairro,CdCidade,SgEstado)
		references Bairro

go
Alter table Oferta
	Add constraint FKImovelOferta foreign key (CdImovel)
		references Imovel

go
Alter table Oferta
	Add constraint FKCompradorOferta foreign key (CdComprador)
		references Comprador

/*Inser��es de dados*/

Insert Estado values
	('SP', 'S�O PAULO'),
	('RJ', 'RIO DE JANEIRO')
go
Insert Cidade values
	(1,'S�O PAULO','SP'),
	(2,'SANTO ANDR�','SP'),
	(3,'CAMPINAS', 'SP'),
	(1,'RIO DE JANEIRO','RJ'),
	(2,'NITER�I','RJ')
go
Insert Bairro (CdBairro,CdCidade,SgEstado,NmBairro) values
	(1,1,'SP','JARDINS'),
	(2,1,'SP','MORUMBI'),
	(3,1,'SP','AEROPORTO'),
	(1,1,'RJ','AEROPORTO'),
	(2,1,'RJ','FLAMENGO')
go
Insert Vendedor (CdVendedor,NmVendedor,NmEndereco,Email) values
	(1,'MARIA DA SILVA','RUA DO GRITO, 45','msilva@nova.com'),
	(2,'MARCOS ANDRADE','AV. DA SAUDADE,325','mandrade@nova.com'),
	(3,'ANDR� CARDOSO','RUA DO BOSQUE, 65','andrec@teste.com'),
	(4,'PAULA MARIA','AV. TIRADENTES,615','paula@ete.com')
go
Insert Imovel (CdImovel,CdVendedor,CdBairro,CdCidade,SgEstado,NmEndereco,NrAreaUtil,NrAreaTotal,VlPreco,DtLancto) values
	(1,1,1,1,'SP','AV TIRADENTES, 200',250,400,360000.00,'05/11/2001'),
	(2,1,2,1,'SP','AV CASTELO BRANCO, 2200',150,250,198500.00,'19/01/2014'),
	(3,2,1,1,'RJ','AV BRASIL, 200 - AP 1205',250,200,218000.00,'07/10/2001'),
	(4,2,2,1,'RJ','AV CARLOS DE CAMPOS, 10',120,300,185000.00,'20/01/2010'),
	(5,3,3,1,'SP','AV CRUZEIRO DO SUL, 1220',450,600,718000.00,'10/11/2001'),
	(6,4,1,1,'RJ','AV BANCO III, 200',250,320,658000.00,'15/11/2013')
go
Insert Comprador (CdComprador,NmComprador,NmEndereco,Email)values
	(1,'TEREZA SILVA','RUA PRATES,225','tereza@mail.com'),
	(2,'PEDRO ALVES','AV RIO BRANCO, 1596','pedro@mail.com'),
	(3,'RICARDO SOUZA','AV S�O PAULO, 15','ricado@mail.com'),
	(4,'M�RCIA ANTUNES','AV AFONSO MARIANO, 766','mercia@mail.com')
go
Insert Oferta (CdComprador,CdImovel,VlOferta,DtOferta) values
	(1,1,355000.00,GETDATE()),
	(1,3,195000.00,'10/10/2013'),
	(2,2,180000.00,'10/05/2013'),
	(2,4,160000.00,'01/04/2013'),
	(3,1,355000.00,'28/09/2013'),
	(3,2,355000.00,GETDATE())


-- EX 1 

DELETE FROM Imovel
	WHERE CdImovel NOT IN
		(SELECT CdImovel FROM Imovel WHERE CdBairro IN
			(SELECT CdBairro FROM Imovel WHERE CdImovel = 2) AND CdImovel !=2)

-- EX 2

SELECT * 
	FROM Imovel WHERE VlPreco > 
		(SELECT AVG(VlPreco) from Imovel)

-- EX 3

SELECT * 
	FROM Comprador WHERE CdComprador IN
		(SELECT CdComprador FROM Oferta WHERE VlOferta > 70000)

-- EX 4

SELECT * 
	FROM Imovel WHERE CdImovel IN
		(SELECT CdImovel FROM Oferta WHERE VlOferta > 
			(SELECT AVG(VlOferta) FROM Oferta))

-- EX 5

SELECT cdimovel, nmendereco, vlpreco FROM Imovel i 
	WHERE VlPreco >
		(SELECT AVG(Vlpreco) FROM Imovel WHERE CdBairro = i.CdBairro)

-- EX 6

select *
	from Imovel i where VlPreco = 
		(select MIN(VlPreco) from Imovel where CdVendedor = i.CdVendedor)