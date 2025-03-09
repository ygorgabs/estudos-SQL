# Banco de Dados 2 

## Comentarios em arquivos .sql

```
-- comenta uma linha
/* bloco de comentario */
```

## Comandos de Criação, Utilização e Exclusão de Banco de Dados

Para criar e usar um banco de dados:

```
CREATE DATABASE aula01 
USE aula01
```

Para excluir um banco de dados:
```
USE master
DROP DATABASE aula01 
```

**OBS:** Para excluir um banco de dados ele não pode estar em uso, por isso no exemplo usamos o `USE master`

## Criando tabelas

### Criando tabelas simples

```
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
```
**OBS:** Em casos onde usamos uma chave estrangeira na criação da tabela, será necessario criar antes todas as tabelas com chaves primarias para depois criar as com chave estrangeira para evitar erros.

### Criando tabelas com restrições 

**Exemplo 1:**

```
create table tblAnimal(
Codigo int not null primary key,
Nome varchar(40) not null,
Sexo char(1) check(upper(sexo)='m' or upper(sexo)='f')
)
```

Restrições do exemplo:
- Cláusula `NOT NULL` indica que o coluna não aceitará valores vazios
- Cláusula `CHECK` é uma restrição de validação que garante que só sejam aceitos os valores 'M' ou 'F'
   - A função `UPPER(sexo)` converte a entrada para maiúscula, garantindo que tanto 'm' quanto 'M' sejam aceitos, assim como 'f' e 'F'


**Exemplo 2:**

```
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
```

Restrições do exemplo:
- `IDENTITY` indica que essa coluna será autoincrementada automaticamente
- `DEFAULT 'f'` define que, caso o usuário não informe o sexo, o valor padrão será 'f' (feminino)
- `DEC(10,2)` define que o tipo do atributo  pode armazenar números com até 10 dígitos no total, sendo deles 2 casas decimais
- `CONSTRAINT` é usada para definir restrições (regras) em uma tabela para garantir a integridade dos dados
   - Tipos mais comuns: `PRIMARY KEY`, `UNIQUE`, `CHECK`, `DEFAULT`, `FOREIGN KEY`
   - Dá para criar CONSTRAINTS sem nome, mas não é recomendado, pois facilita manutenção e modificações futuras no banco de dados

## Índices nas tabelas

Os índices são criados para otimizar as consultas em uma tabela.

Exemplo: `create index xtblFuncionario on tblFuncionario(codfunc)`

## Alter Table

É usado para modificar uma tabela existente no banco de dados. Ele pode adicionar, modificar ou excluir colunas, restrições (CONSTRAINT), índices e muito mais.

### Alter Table para adicionar um campo

`alter table vendedor add email varchar(20)`

### Alter Table para adiciona uma constraint em campos existentes

`alter table pedido add constraint fk_pedido_cliente foreign key(codigo_cliente)`

### Alter Table para modificar o tamanho de um campo

`alter table empregados alter column primeiroNome varchar(100)`

### Alter Table para remover uma coluna da tabela

`alter table empregados DROP COLUMN sexo`

## Insert

Esta é o comando utlizado para inserir dados em uma tabela de Banco de Dados SQL. Suponha que temos a seguinte tabela:

```
create table tblCliente(
COD_CLI int primary key,
NOME_CLI varchar(50),
Data_cadastro date
)
```

### Insert Declarativo

Esta é a forma de usar o `INSERT` onde é possível escolher qual o campo vou inserir o dado.

```
insert into tblCliente(COD_CLI,NOME_CLI)
    values(1,'Ana de Souza')
```

### Insert Posicional

Esta é a forma de usar o `INSERT` onde necessário preencher os campos na ordem em que estão na tabela.

```
insert into tblCliente
values(2,'Mariana de Souza')
```

## Select 

O `SELECT`é o comando utilizado para realizar consultas em Bancos de Dados SQL. Esse comando pode ter a seguinte estrutura:

```
select lista de atributos
from tabela
where filtros
group by campo [having(filtro)]  -- professor ainda não vai falar
order by campo [asc/desc]
```

- O `SELECT` seleciona as colunas (atributos) que você quer na consulta.
- O `FROM` define de qual tabela você está retirando os dados.
- O `WHERE` é utilizado para filtrar os dados e retornar apenas as linhas que atendem a uma condição específica.
- O `GROUP BY` é utilizado para agrupar os dados por uma ou mais colunas. Ele é frequentemente usado junto com funções de agregação
- O `HAVING` é semelhante ao WHERE, mas é usado para filtrar grupos após a aplicação de GROUP BY.
- O `ORDER BY` ordena os dados por uma ou mais colunas (crescente ou decrescente).

Os campos SELECT e FROM são obrigatórios e os outros comandos são opcionais.

Exemplo de uso do select: 

```
SELECT nome, salario
FROM tblFuncionario
WHERE idade > 30
GROUP BY nome
HAVING AVG(salario) > 2000
ORDER BY salario DESC;
```

### Operadores 

Junto com a cláusula WHERE podemos usar operadores para realizar comparações de valores

| Operador   | Significado        |
|------------|--------------------|
| `=`        | Igual              |
| `!`        | Negação            |
| `>`        | Maior              |
| `<`        | Menor              |
| `<>` ou `!=` | Diferente        |
| `!>`       | Não maior          |
| `!<`       | Não menor          |

### Top

A função `TOP` no SQL é usada para limitar o número de registros retornados por uma consulta. Ela é frequentemente usada quando você quer obter apenas um número específico de linhas ou a parte superior de um conjunto de dados. Exemplo: 

`select top 3 * from tblCliente order by id DESC`

### Distinct

Mostra os valores únicos, sem repetição em uma consulta. Não é possivel ter mais de um distinct por comando SELECT. Exemplo:

`select distinct(bairro) from tblCidade`

### IN

A cláusula `IN` define uma lista de valores como condição. Exemplo: 

`select * from cidade where NomeCidade in ('bonito','dourados')`

### BETWEEN

A cláusula `BETWEEN` define uma faixa de valores como condição. Exemplo:

`select * from cidade where CodCidade between 3 and 6`

### IS NULL

A cláusula `IS NULL` identifica valores nulos atribuidos. Exemplos:

`select * from cidade where CodCidade is null`
`select * from cidade where CodCidade is not null`

### LIKE

A cláusula `LIKE` é usada para filtrar registros com base em texto, ou seja, ela permite que você faça consultas que combinem com padrões específicos nas colunas de texto.

A cláusula pode ser usada com 

| Coringa      | Descrição                                        |
|--------------|--------------------------------------------------|
| `%`          | Substitui **vários caracteres** (inclusive zero) |
| `_`          | Substitui **um único caractere**                 |
| `[a-f]`      | Qualquer caractere isolado no intervalo **a-f** |
| `[^a-f]`     | Qualquer caractere isolado **que não** esteja no intervalo **a-f** |

Exemplos:

- `select * from empregado where nomeinic like 'a%'`  Procura qualquer nome que começa com a
- `select * from empregado where nomeinic like '%ce'` Procura qualquer nome que termina com ce
- `select * from empregado where nomeinic like '[d-f]%'` Procura qualquer nome que começa no intervalo d-f
- `select * from empregado where nomeinic like '[^d-f]%'` Procura qualquer nome que não começa no intervalo d-f
- `select * from empregado where nomeinic like '[a-c , f-g]%'` Procura qualquer nome que começa nos intervalos a-c e f-g

## Update

O comando `UPDATE` no SQL é usado para modificar dados existentes em uma ou mais linhas de uma tabela. Ele permite alterar os valores de uma ou mais colunas de registros que atendem a uma condição específica.

```
UPDATE tabela
SET coluna1 = valor1, coluna2 = valor2, ...
WHERE condição;
```

- **`tabela`**: nome da tabela onde os dados serão atualizados.
- **`SET`**: define os novos valores para as colunas especificadas.
- **`coluna1 = valor1`**: define que a `coluna1` terá o valor `valor1`.
- **`WHERE`**: especifica a condição que os registros devem atender para ser atualizados. 

Exemplos de uso:

```
UPDATE tblFuncionario
SET salario = 3000
WHERE codfunc = 10;
```

```
UPDATE tblFuncionario
SET nome = 'João Silva', salario = 4000
WHERE codfunc = 10;
```

```
UPDATE tblFuncionario
SET salario = salario * 1.1
WHERE departamento = 'TI';
```

**OBS:** Cuidado ao usar o `UPDATE` sem `WHERE`, pois todos os registros da tabela serão atualizados.

## Delete

O comando `DELETE` é usado para remover dados de uma tabela. Ele exclui uma ou mais linhas da tabela com base em uma condição especificada. O comando `DELETE` não exclui a estrutura da tabela, apenas os dados nela contidos.

```
DELETE FROM tabela
WHERE condição;
```

- **`tabela`**: Nome da tabela da qual os dados serão removidos.
- **`WHERE`**: Especifica a condição para quais registros serão excluídos. 

Exemplos de uso: 

```
DELETE FROM tblFuncionario
WHERE codfunc = 10;
```

```
DELETE FROM tblFuncionario
WHERE departamento = 'Vendas';
```

```
DELETE FROM tblFuncionario;
```
**OBS:** Se você não especificar a condição `WHERE`, todos os registros da tabela serão excluídos. Cuidado ao usar o `DELETE` dessa forma, pois não há como desfazer essa ação sem um backup.

## DATEFORMAT

`SET DATEFORMAT`

Esse comando define o formato de data para a sessão atual do SQL. Isso significa que, a partir do momento em que for acionada, as datas serão interpretadas no mesmo formato.

Exemplo de como definir o formato de data dia/mês/ano: `SET DATEFORMAT dmy`

Em alguns bancos de dados, o padrão pode ser mdy (mês/dia/ano) ou ymd (ano/mês/dia), e isso pode causar confusão ao inseir ou consultar datas. Com o SET DATEFORMAT, você garante que o SQL entenda corretamente o formato das datas que você vai trabalhar.

A partir dessa configuração é possível usar comandos como INSERT usando datas no formato brasileiro sem erros. Exemplo: 

```
INSERT INTO tblCliente (COD_CLI, Data_cadastro) 
VALUES (1, '21/10/2024');

```

### CONVERT

O `CONVERT` é uma função de conversão de tipos de dados no SQL Server e pode ser usada com datas. Exemplo:

```
SELECT CONVERT(char, Data_cadastro, 103) 
FROM tblCliente;
```

- O primeiro parâmetro (char) define que a data será convertida para um tipo de texto (char).
- O segundo parâmetro (Data_cadastro) é o nome da coluna da tabela que contém a data.
- O terceiro parâmetro (103) define o estilo de conversão para o formato de data dd/mm/yyyy.

Esse comando será útil quando você precisar exibir ou consultar a data em um formato específico, como o dd/mm/yyyy, independentemente de como a data está armazenada no banco de dados.
