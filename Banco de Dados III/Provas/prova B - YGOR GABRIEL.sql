use master
go

IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = 'Prova')
	DROP DATABASE Prova

CREATE DATABASE Prova
go

use Prova
go


CREATE TABLE Ramo_Atividade (
cd_ramo int PRIMARY KEY,
ds_ramo char(50)
);

CREATE TABLE Tipo_Assinante (
cd_tipo int PRIMARY KEY,
ds_tipo char(50)
);

CREATE TABLE Assinante (
cd_assinante int PRIMARY KEY,
nm_assinante char(50),
cd_ramo int,
cd_tipo int,
FOREIGN KEY(cd_ramo) REFERENCES Ramo_Atividade (cd_ramo),
FOREIGN KEY(cd_tipo) REFERENCES Tipo_Assinante (cd_tipo)
);

CREATE TABLE Endereco (
cd_endereco int PRIMARY KEY,
ds_endereco char(50),
complemento char(20),
bairro char(20),
CEP char(10),
cd_assinante int,
cd_municipio int,
FOREIGN KEY(cd_assinante) REFERENCES Assinante (cd_assinante)
);

CREATE TABLE Telefone (
cd_fone int PRIMARY KEY,
ddd char(10),
n_fone char(10),
cd_endereco int,
FOREIGN KEY(cd_endereco) REFERENCES Endereco (cd_endereco)
);

CREATE TABLE Municipio (
cd_municipio int PRIMARY KEY,
ds_municipio char(50)
);

ALTER TABLE Endereco ADD FOREIGN KEY(cd_municipio) REFERENCES Municipio (cd_municipio);


--- INSERTS

insert into Ramo_Atividade (cd_ramo, ds_ramo)
values (01, 'Com�rcio'),
(02, 'Ferragem'),
(03, 'Clinica M�dica'),
(04, 'Supermercado');


insert into Tipo_Assinante (cd_tipo, ds_tipo)
values (01, 'Residencial'),
(02, 'Comercial');


insert into Assinante (cd_assinante, nm_assinante, cd_ramo, cd_tipo)
values (01, 'Maria da Silveira', null, 01),
(02, 'Atacado O Globo', 01, 02),
(03, 'Roberto Pereira', null, 01),
(04, 'Hercilio Cal�ados', 01, 02),
(05, 'Gabriel Juliane', null, 01),
(06, 'Supermercado Nacional', 04, 02),
(07, 'Luciano Madruga', null, 01),
(08, 'Marta Gol�alves', null, 01),
(09, 'Ferragem Ponche Verde', 02, 02),
(10, 'Marilia Santos', null, 01),
(11, 'Pedro Rosa', null, 01),
(12, 'Ferragem Azul', 02, 02),
(13, 'Andressa Vasconcellos', null, 01),
(14, 'Fabio Duarte', null, 01),
(15, 'Andr�ia Carvalho', null, 01),
(16, 'Clinica Dr.Sergio Caldeira', 03, 02),
(17, 'Norma Lessa', null, 01),
(18, 'Selma Rodrigues', null, 01),
(19, 'Tais Cardoso', null, 01),
(20, 'Supermecado Big', 04, 02);

insert into Municipio (cd_municipio, ds_municipio)
values (01, 'Pelotas'),
(02, 'Bag�'),
(03, 'Cangu�u'),
(04, 'Cap�o do le�o'),
(05, 'S�o Louren�o do sul'),
(06, 'Rio Grande'),
(07, 'Piratini'),  
(08, 'Jaguar�o'),
(09, 'Camaqu�'),
(10, 'Dom Pedrito');


insert into Endereco (cd_endereco, ds_endereco, bairro, CEP, cd_assinante, cd_municipio)
values (01, 'Tiradentes 1056', 'Centro', 95602722, 03, 01),
(02, 'Sete de Setembro 556', 'Centro', 99239765, 14, 01),
(03, 'Galv�o Paiva 485', 'Floresta', 96854556, 19, 02),
(04, 'Jo�o Manoel 569', 'S�o Jos�', 99685534, 01, 02),
(05, 'Fernando Os�rio 65', 'Centro', 96584569, 16, 03),
(06, 'Dom Otaviano 598', 'Centro', 98457256, 11, 03),
(07, 'Castro Alves 335', 'Centro', 98754642, 20, 04),
(08, 'Republica de Piratini 48', 'Centro', 97564855, 13, 04),
(09, 'Anchieta 245', 'Balne�rio', 98756569, 04, 05),
(10, 'Riachuelo 566', 'Balne�rio', 98745869, 02, 05),
(11, 'Francisco Pastore 554', 'Cidade Nova', 98542559, 06, 06),
(12, 'Alberto Torres 89', 'S�o Miguel', 9745658, 10, 06),
(13, 'Gomes Jardim 65', 'Centro', 98745987, 15, 07),
(14, 'Gen. Canabarro 59', 'Centro', 98745754, 17, 07),
(15, 'Julio de Castilhos 887', 'Centro', 97458558, 09, 08),
(16, 'Carlos Alberto Ribas 45', 'Centro', 98745235, 18, 08),
(17, 'Jos� de Souza Castro 458', 'Carvalho Bastos', 98745-256, 12, 09),
(18, 'Tr�s de Outubro 487', 'Olaria', 98746235, 05, 09),
(19, 'Rui barbosa 547', 'S�o Gregorio', 98745563, 07, 10),
(20, 'Conde de Porto Alegre 56', 'S�o Gregorio', 98743256, 08, 10),
(21, 'General Teles 65', 'Centro', '96010540', 04, 03),
(22, 'General Bacelar 24', 'Centro', '9654871', 04, 06),
(23, 'Barbosa Neto 59', 'Centro', '8569354', 06, 08),
(24, 'Alvares Cabral 489', 'Centro', 8564789, 20, 05),
(25, 'Silveira Martins 556', 'Centro', 9624538, 05, 03);



insert into Telefone (cd_fone, ddd, n_fone, cd_endereco)
values (01, 53, 32256984, 12),
(02, 53, 32569785, 02),
(03, 53, 32569812, 11),
(04, 53, 32145698, 16),
(05, 53, 35698459, 19),
(06, 53, 32565698, 20),
(07, 53, 32569874, 08),
(08, 53, 32569742, 14),
(09, 51, 32269871, 18), 
(10, 53, 32569412, 04),
(11, 53, 32569842, 15),
(12, 53, 32146984, 03),
(13, 53, 32658941, 06),
(14, 53, 32569874, 13),
(15, 51, 32269841, 17),
(16, 53, 32569845, 07),
(17, 53, 32569874, 09),
(18, 53, 32486935, 01), 
(19, 53, 32569845, 05),
(20, 53, 32569871, 10),
(21, 53, 32458697, 21),
(22, 53, 32145697, 22),
(23, 53, 32569784, 23),
(24, 53, 32689457, 24),
(25, 53, 32458945, 25);





--1) Exiba todos os endereços em que o assinante seja do tipo comercial.

--2) Liste o nome de todos os assinantes que moram no munic�pio de Pelotas

--3) Liste a quantidade de endereços do município de código 01




-- RESPOSTA 1

SELECT * 
	FROM Endereco WHERE cd_assinante IN 
		(SELECT cd_assinante FROM Assinante WHERE cd_tipo = 
			(SELECT cd_tipo FROM Tipo_Assinante WHERE ds_tipo LIKE '%Comercial%'))

-- RESPOSTA 2 

SELECT nm_assinante 
	FROM Assinante WHERE cd_assinante IN 
		(SELECT cd_assinante FROM Endereco WHERE cd_municipio =
			(SELECT cd_municipio FROM Municipio WHERE ds_municipio LIKE '%Pelotas%'))




