# Anotações da aula de Banco de Dados 3

## Funções agregadas

Servem para obter dados estatisticos dos registros do banco de dados.

### `AVG()` 

Retorna a media aritmética de uma coluna. Exemplo:

```sql
Select avg(salario) from cadfun
Select avg(distinc salario) from cadfun
Select avg(salario) from cadfun where dpto = 3
```

### `Count()`

Retorna um valor inteiro com a quantidade de linhas em uma coluna. Exemplo:

```sql
select from count(*) from cadfun where depto in (3,5)
select from count(filhos) from cadfun 
select from count(*) from cadfun where salario > 2000
```

Opções de COUNT:

- `COUNT(nome_da_coluna)` - Esta função conta as linhas de uma coluna, mas ignora valores nulos. Desta forma, a contagem para colunas de uma mesma tabela pode obter um resultado diferente.
- `COUNT(*)` - Esta é uma função com um parametro genérico para contas todas as linhas da tabela.
- `COUNT(DISTINCT nome_da_coluna)`- Esta função conta quantos valores não repetidos possui uma coluna.

### `Max()`

- Retorna o maior valor de uma coluna. Exemplo:

`Select max(salario) from cadfun`

### `Min()`

- Retorna o menor valor de uma coluna. Exemplo:

`Select min(salario) from cadfun`

### `Sum()`

- Retorna a soma dos valores de uma coluna. Exemplo:

```sql
Select sum(filhos) from cadfun
Select sum(salario) from cadfun
Select sum(salario) from cadfun where depto in (3,5)
```
## Agrupamento de Resultados

O comando `Group By` permite que a apresentação dos dados retornados da consulta seja agrupada de acordo com uma determinada condição. O `Group By` só funciona usando as funções agregadas.

Exemplo 1

```sql
Select depto, count (*) as quantidadade from cadfun
    group by depto

Select depto, sum (salario) as 'Salario Total' from cadfun
    group by depto
```

Exemplo 2

```sql
Select codMusica, count(*) from musicaAutor group by codMusica having codMusica < 15
Select codMusica, count(*) from musicaAutor where codMusica < 15 group by codMusica
```

## Subquerie

Primeira definição: Permitem que seja feita uma pesquisa nos dados de uma tabela com base na existencia ou não nos dados de outra tabela.

Outra definção: Subquery é um recurso dentro do SQL que nos permite criar queries mais otimizadas, reaproveitando o resultado de uma query dentro de outra.

As subqueries podem ser usadas em 3 situações:

- Dentro da cláusula WHERE, como um filtro
- Dentro da cláusula SELECT, como uma nova coluna
- Dentro da clásula FROM, como uma nova coluna

Regras das subqueries:

- Toda subquerie deve ser escrita entre parênteses.
- Só poderá retornar uma coluna.

**OBS:** Uuma subquery é executada de dentro para fora. Primeiro são executadas as queries mais internas para deipois executas as outras. Assim, não existe uma dependência da query interna com a externa.

### Subqueries com IN/NOT IN

```sql
Select * from CARGO
    where COD_CARGO in
        (Select COD_CARGO from FUNCIONARIO)

Select * from CARGO
    where COD_CARGO in
        (Select COD_CARGO from FUNCIONARIO
            where COD_FUNC in 
                (Select COD_FUNC from DEPENDENTE)) 

Select * from CARGO where COD_CARGO
    not in (Select COD_CARGO from FUNCIONARIO)
```

```sql
Select * from FUNCIONARIO
    where SAL_FUNC = 
        (Select max(SAL_FUNC) from FUNCIONARIO)

Select * from FUNCIONARIO where SAL_FUNC = 
    (Select min(SAL_FUNC) from FUNCIONARIO where COD_FUNC in
        (Select COD_FUNC from DEPENDENTE)) 

Select *, 
    (Select count(*) from DEPENDENTE
        where COD_FUNC = FUNCIONARIO.COD_FUNC) as
            QTDE_DEP from FUNCIONARIO

Select *, 
    (Select count(*) from FUNCIONARIO
        where COD_CARGO = CARGO.COD_CARGO)
            as QTD_FUNC from CARGO      
```

**OBS:** Quebrar linha quando utilizar uma subquerie facilita a leitura e identificação de erros mais facilidade.

### Update e Delete com subquerie

```sql
Update FUNCIONARIO
    set SAL_FUNC = SAL_FUNC * 1.1
        where COD_FUNC not in 
            (Select COD_FUNC from DEPENDENTE)

Delete from FUNCIONARIO
     where COD_FUNC not in 
        (Select COD_FUNC from DEPENDENTE)
```

## Funções de Data

- **Getdate()**: Retorna a data atual do sistema
- **Day()**: retorna o dia de uma data fornecida
- **Month()**: retorna o mês de uma data fornecida
- **Year()**: retorna o ano de uma data fornecida
- **DateAdd()**: Adiciona um número a uma parte da data(dia, ano, mes trimestre, hora, etc)
- **DateDiff()**: Apresenta a diferença de dias , meses ou anos entre duas datas
- **DateName()**: Apresenta o nome da parte da data (mês ou dia da semana)

## JOIN

É uma operação de algebra relacional(teoria dos conjuntos) em relaciona as colunas de uma ou mais tabelas. O Join combina as colunas utilizando valores em comum entre elas. Existem cinco tipos de Join.

### Inner Join

Por meio dessa cláusula os registros(comuns) de duas tabelas são utilizados para que sejam gerados os dados relacionados de ambas.

```sql
SELECT a.nome, b.nome 
FROM TabelaA AS A
INNER JOIN TabelaB AS B
ON a.nome = b.nome
```

### Left Join

Retorna todos os registros que estão na tabela A (mesmo que não estejam na tabela B) e os registros da tabela B que são comuns na tabela B.

```sql
SELECT a.nome, b.nome 
FROM TabelaA AS A
LEFT JOIN TabelaB AS B
ON a.nome = b.nome
```

### Right Join

Retorna todos os registros que estão na tabela B (mesmo que não estejam na tabela A) e os registros da Tabela A que são comuns na Tabela B.

```sql
SELECT a.nome, b.nome
FROM TabelaA AS A
RIGHT JOIN TabelaB AS B
ON a.nome = b.nome
```

### Full Join

Retorna todos os registros quando houver uma correspondência na tabela esquerda ou direita. Ou seja, todos os registros que estão na Tabela A e na Tabela B.

```sql
SELECT a.nome, b.nome
FROM TabelaA
FULL OUTER JOIN TabelaB
ON a.nome = b.nome
```