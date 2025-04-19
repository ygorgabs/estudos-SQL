USE Empresa

-- ex 1

SELECT Nome, day(DataNasc) AS 'diaNasc', month(DataNasc) AS 'mesNasc', year(DataNasc) AS 'anoNasc' FROM Funcionarios

-- ex 2

SELECT DateName(mm, DataNasc) FROM Funcionarios ORDER BY Nome

-- ex 3

SELECT CodFun, Nome FROM Funcionarios WHERE YEAR(DataNasc) = 1987

-- ex 4

SELECT Nome, DAY(DataNasc) AS 'Dia Nascimento' FROM Funcionarios WHERE MONTH(DataNasc) = '04' AND YEAR(DataNasc) = '1987'

-- ex 5

SELECT Nome, DATEADD(mm,2,DataNasc) AS 'Nasc Aumentado'FROM Funcionarios 

-- ex 6

SELECT Nome, DATEDIFF(yy, DataNasc, GETDATE()) AS 'Idade Funcionario' FROM Funcionarios

-- ex 7

SELECT codFun, Nome,YEAR(DataNasc) AS 'Ano Nascimento'FROM Funcionarios WHERE DataNasc BETWEEN '1990-03-01' AND '1990-05-31'

-- ex 8

SELECT Nome, YEAR(DataNasc) FROM Funcionarios WHERE Cidade LIKE 'SP'

