create database Prova

use Prova

create table Produto(
Cod_Prod int primary key,
Nome_Prod varchar(20),
Qtde_Prod int,
Val_Prod dec(15,2))

create table Item(
Num_Ped int primary key,
Cod_Prod int,
Qtd_Prod int,
Val_Prod dec(15,2))

create index idx_prod on Produto(Cod_Prod)

insert into Produto
values
	(1,'Caneta',50,2.00),
	(2,'Caderno',75,15.5);

insert into Item
values
	(1,1,5,2.0),
	(2,2,15,15.5);

select * from Produto order by Val_Prod desc

select * from Produto where Cod_Prod = 10 or Cod_Prod = 11 or Cod_Prod = 15 or Cod_Prod = 100

