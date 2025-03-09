create database Escola

use Escola

-- criando as tabelas

create table tblAlocacao (
cod_turma int not null primary key,
nome_sala char(10),
dia date,
inicio time,
fim time)

create table tblAluno (
cod_aluno int not null primary key,
nome_aluno char(30),
endereco char(50),
bairro char(20),
cidade char(20),
cep int,
telefone char(20),
email char(50)
)

create table tblContrato (
cod_contrato int not null primary key,
nome_firma char(50),
contato char(50),
telefone_firma char(20),
fax_firma char(20)
)

create table tblCurso (
cod_curso int not null primary key,
nome_curso char(50),
carga_hotario int,
max_alunos int,
min_alunos int,
preco_turma dec(17,2),
preco_aluno dec (17,2),
equip_necessario char(80)
)

create table tblLaboratorio(
nome_sala char(10) not null primary key,
capacidade int,
equip_disponivel char(80)
)

create table tblProfessor(
cod_professor int not null primary key,
nome_professor char(30),
area char(4),
ramal int,
e_mail_professor char(50)
)

create table tblTurma(
cod_turma int not null primary key,
termino_incricoes date,
inicio_aulas date,
fim_aulas date,
incritos int,
tipo_turma char,
valor_faturado dec(17,2),
valor_turma_fechada dec(17,2),
carga_horaria_ministrada int,
cod_curso int foreign key references tblCurso(cod_curso),
cod_professor int foreign key references tblProfessor(cod_professor)
)

create table tblIncricao(
cod_turma int foreign key references tblTurma(cod_turma),
cod_aluno int foreign key references tblAluno(cod_aluno),
valor_cobrado dec(17,2),
cod_contrato int foreign key references tblContrato(cod_contrato),
conceito char(4)
)

create table tblMinistra (
cod_professor int foreign key references tblProfessor(cod_professor),
cod_curso int foreign key references tblCurso(cod_curso)
)

-- inserindo as informações nas tabelas

insert into tblAlocacao
values
	(1, 'sala 1', '2024-11-10', '13:00:00', '18:00:00'),
	(2, 'sala 2', '2024-11-09', '08:00:00', '11:30:00'),
	(3, 'sala 1', '2024-11-10', '08:00:00', '11:30:00'),
	(4, 'sala 3', '2024-11-09', '13:00:00', '16:30:00'),
	(5, 'sala 1', '2024-11-09', '12:30:00', '16:30:00');

insert into tblAluno
values
	(1, 'Ygor Silva', 'Rua 1', 'Jd Macieira','São Paulo', 01001000, '11922222222', 'ygor@ygor.com'),
	(2, 'Lucas Bento', 'Rua 2', 'Jd Macieira', 'São Paulo', 01002000, '11933333333', 'lucas@lucas.com'),
	(3, 'Luana Silva', 'Rua 3', 'Jd Amora', 'São Paulo', 01003000, '11944444444', 'luana@luana.com'),
	(4, 'Paloma Almeida', 'Rua 1', 'Jd Macieira','São Paulo', 01001000, '11955555555','paloma@paloma.com'),
	(5, 'Bruno Felipe', 'Rua 2', 'Jd Macieira', 'São Paulo', 01002000, '11966666666','bruno@bruno.com');

insert into tblContrato
values
	(1, 'Empresa 1', 'Pedro Henrique', '1155885588', '1155885588'),
	(2, 'Empresa 2', 'Rosangela Cristina', '1158115811', '1158115811'),
	(3, 'Empresa 2', 'Juliano Rosa', '1155665566', '1155665566'),
	(4, 'Empresa 3', 'Magno Silva', '1120402040', '1120402040'),
	(5, 'Empresa 4', 'Luan Almeida', '1125402540', '1125402540');

insert into tblCurso
values
	(1, 'Android', 60, 40, 20, 2000.00, 100.00, 'Computador, livro'),
	(2, 'Web 1', 60, 40, 20, 2000.00, 100.00, 'Computador, livro'),
	(3, 'Web 2', 100, 40, 20, 4000.00, 200.00, 'Computador, livro'),
	(4, 'Banco de dados',100, 40, 20, 2000.00, 100.00, 'Computador, livro'),
	(5, 'Sistemas Embarcados', 60, 40, 20, 2000.00, 100.00, 'Computador, livro');

insert into tblLaboratorio
values
	('sala 1', 50, 'Computador, livros'),
	('sala 2', 40, 'Computador, livros'),
	('sala 3', 50, 'Computador, livros'),
	('sala 4', 20, 'livros'),
	('sala 5', 30, 'livros');

insert into tblProfessor
values
	(1, 'Alcimar', 'AND', 1111, 'alcimar@alicmar.com'),
	(2,'Julius', 'WEB', 2222, 'julius@julius.com'),
	(3, 'Luis', 'BD', 3333, 'luis@luis.com'),
	(4, 'Pinehiro', 'SE', 4444, 'pinheiro@pinheiro.com'),
	(5, 'Rubens', 'DS', 5555, 'rubens@rubens.com');

insert into tblTurma
values
	(1, '2024-06-30', '2024-08-01', '2024-12-01', 40, 'A', 2000.00, 2000.00, 60, 1,1),
	(2, '2024-06-30', '2024-08-01', '2024-12-01', 40, 'B', 4000.00, 4000.00, 100, 3, 2),
	(3, '2024-06-30', '2024-08-01', '2024-12-01', 40, 'A', 2000.00, 2000.00, 60, 1,1),
	(4, '2024-06-30', '2024-08-01', '2024-12-01', 40, 'B', 2000.00, 2000.00, 60, 4, 3),
	(5, '2024-06-30', '2024-08-01', '2024-12-01', 40, 'A', 2000.00, 2000.00, 60, 5, 4);

insert into tblIncricao
values
	(1, 2, 200.00, 2, 'MB'),
	(2, 4, 100.00, 1, 'MB'),
	(3, 5, 100.00, 5, 'MB'),
	(4, 2, 200.00, 2, 'MB'),
	(5, 4, 100.00, 5, 'MB');

insert into tblMinistra
values 
	(1,1),
	(2,2),
	(2,3),
	(3,4),
	(4,5);

-- criando querys

select * from tblAluno

select nome_curso, preco_aluno from tblCurso

select nome_curso, (preco_turma/min_alunos) as preco_por_aluno from tblCurso

select valor_cobrado from tblIncricao

select nome_aluno, bairro, cidade from tblAluno order by bairro

select nome_aluno, bairro, cidade from tblAluno order by cidade, bairro

select distinct(bairro) from tblAluno

select nome_aluno from tblAluno where bairro = 'Tijuca' order by nome_aluno asc

select nome_curso, preco_turma from tblCurso order by preco_turma desc

select * from tblIncricao where conceito >= 7 and conceito <= 10

insert into tblProfessor (cod_professor, nome_professor, area, ramal)
values (6, 'Antonio', 'EXTN', 0000);