/* aula 07.10.2024 */

-- comenta uma linha
/* bloco de comentario */

-- cria o banco de dados
create database aula01 

--abrir o BD
use aula01

/*
apagar o BD
use master
drop database aula01
*/

-- criando tabelas 

create table tblTipo(
Codigo int not null primary key,
Nome varchar(30) not null
)

create table tblTotalFaturado(
Mes int not null,
Ano integer,
Valor decimal (12,2),
primary key(Mes,Ano)
)

create table tblSecao(
Codigo int not null primary key,
Descricao varchar(20) not null,
CodDepto int foreign key references tblDepartamento (Codigo)
)

/*

neste caso em que usamos uma chave estrangeira é necessario criar antes todas
as tabelas com chaves primarias para depois criar as com chave estrangeira para não dar erro

*/

create table tblAnimal(
Codigo int not null primary key,
Nome varchar(40) not null,
Sexo char(1) check(upper(sexo)='m' or upper(sexo)='f')
)

create table tblFuncionario(
codfunc int identity,
nomefunc varchar(50),
rgfunc char(15),
sexofunc char default 'f',
salfunc dec(10,2) default 240.00,
constraint pk_func primary key(codfunc),
constraint uq_funq unique(rgfunc),
constraint ck_func1 check(sexofunc in ('f','m')),
constraint ck_func2 check(salfunc > 0)
)

create index xtblFuncionario on tblFuncionario(codfunc)
-- criando um indice para otimizar as consultas em uma tabela

create table tblCliente(
COD_CLI int primary key,
NOME_CLI varchar(50),
Data_cadastro date
)

-- Insert declarativo, onde posso escolher qual o campo vou inserir o dado
insert into tblCliente(COD_CLI,NOME_CLI)
values(1,'Ana de Souza')

-- Insert posicional, onde tneho que preencher os campos na ordem que estão na tabela
insert into tblCliente
values(2,'Mariana de Souza')

/* aula 21.10.24 */

-- para as tabelas aceitarem a data no formato brasileiro
set dateformat dmy 

-- comando para inserir as datas no formato brasileiro

insert tblCliente (COD_CLI, Data_cadastro) values (1,'21/10/2024')

-- depois que o valor é inserido na tabela ele fica no padrão americano, para resgatar o valor no padrão brasileiro tem que usar o seguinte comando:

select convert (char, Data_cadastro, 103) from tblCliente

-- Estrutura do comando select

select lista de atributos
from tabela
where filtros
group by campo [having(filtro)]  -- professor ainda não vai falar
order by campo [asc/desc]

/*

OPERADORES

IGUAL =
NEGAÇAO !
MAIOR >
MENOR <
DIFERENTE <> OU !=
NÃO MAIOR !>
NÃO MENOR !<

*/

-- ORDENAÇÃO  exemplo

SELECT	nome, endereco FROM tblAlunos ORDER BY

SELECT idCliente, Nome, Fone FROM tblCliente
WHERE idCliente >= 5 order by idCliente DESC

Top -- retorna o numero de linhas determinado pelo usuário

select top 3 * from tblCliente order by id DESC

Distinc -- mostra os valores únicos, sem repetição. Não é possivel ter mais de um distinct por comando select
select distinct(bairro) from tblCidade

/* Aula 18.11.24 */

-- Alter table

alter table vendedor add email varchar(20) -- alterando para adicionar um campo

alter table pedido add constraint fk_pedido_cliente foreign key(codigo_cliente) references cliente (codigo_cliente) -- adiciona uma constraint (só funciona com campos existentes)

alter table empregados alter column primeiroNome varchar(100) -- alterando o tamanho de um campo

alter table empregados DROP COLUMN sexo -- remove uma coluna da tabela

-- Operadores IN, BETWEEN e IS NULL

IN -- define uma lista de valores como condição

select * from cidade where NomeCidade in ('bonito','dourados')

BETWEEN -- define uma faixa de valores como condição

select * from cidade where CodCidade between 3 and 6

IS NULL -- identificam valores nulos atribuidos

select * from cidade where CodCidade is null

select * from cidade where CodCidade is not null

-- operador LIKE 

% -- substitui varios caracteres
_ -- (underline) substitui um unico caractere
[a-f] -- qualquer caractere isolado no intervalo a-f
[^a-f] -- qualquer caractere isolado que nao esteja no intervalo a-f

select * from empregado where nomeinic like 'a%' -- qualquer nome que começa com a
select * from empregado where nomeinic like '%ce' -- qualquer nome que termina com ce
select * from empregado where nomeinic like '[d-f]%' -- qualquer nome que começa no intervalo d-f
select * from empregado where nomeinic like '[^d-f]%'-- qualquer nome que nao começa no intervalo d-f
select * from empregado where nomeinic like '[a-c , f-g]%' -- qualquer nome que começa nos intervalos a-c e f-g

-- UPDATE

-- atualiza valores dos campos

update tblCurso set nome_curso = '3º info A' where cod_curso = 3

update tblFuncionario set salario = salario*11 where cod_depto between 3 and 5

-- cuidado ao fazer update sem where


