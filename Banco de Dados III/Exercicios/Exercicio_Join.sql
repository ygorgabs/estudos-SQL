USE Empresa

-- Ex 1

SELECT C.*, P.DataPed
FROM Clientes AS C
INNER JOIN Pedidos AS P
ON C.CodCli = P.CodCli
WHERE YEAR(P.DataPed) = 1996

-- Ex 2

SELECT DISTINCT F.Nome
FROM Funcionarios AS F
JOIN Pedidos AS P
ON F.CodFun = P.CodFun
JOIN Clientes AS C
ON P.CodCli = C.CodCli
WHERE C.Nome LIKE '%Around the horn%'

-- Ex 3

SELECT P.*, C.Nome
FROM Pedidos AS P
JOIN Clientes AS C
ON P.CodCli = C.CodCli
WHERE C.Nome LIKE '%Mineiro%' -- coloquei assim pois palavras com acento estao com erro no banco

-- Ex 4

SELECT F.*
FROM Funcionarios AS F
JOIN Pedidos AS P
ON F.CodFun = P.CodFun
WHERE MONTH(P.DataPed) = 09 AND YEAR (P.DataPed) = 1996

-- Ex 5

SELECT P.*, C.Descr
FROM Produtos AS P
JOIN Categorias AS C
ON P.CodCategoria = C.CodCategoria
WHERE C.Descr LIKE '%latic?nios%' -- coloquei assim pois palavras com acento estao com erro no banco

-- Ex 6

SELECT P2.*, P1.NumPed
FROM Pedidos AS P1
JOIN DetalhesPed as D
ON P1.NumPed = D.NumPed
JOIN Produtos AS P2
ON D.CodProd = P2.CodProd
WHERE P1.DataPed = '1996-07-08'

-- EX 7

SELECT F.Nome, P.NumPed
FROM Funcionarios AS F
JOIN Pedidos AS P
ON F.CodFun = P.CodFun
WHERE P.DataPed = '1997-05-01'

-- EX 8

SELECT F.Nome, P.*
FROM Funcionarios AS F
JOIN Pedidos AS P
ON F.CodFun = P.CodFun
WHERE F.Salario > 10000 ORDER BY F.Nome

-- EX 9

SELECT P.NumPed, C.Nome
FROM Pedidos AS P
JOIN Clientes AS C
ON P.CodCli = C.CodCli
WHERE MONTH(P.DataPed) = 5 AND YEAR(P.DataPed) = 1997 ORDER BY P.NumPed

-- EX 10

SELECT DISTINCT P1.Descr, C.Descr
FROM Produtos AS P1
JOIN Categorias as C
ON P1.CodCategoria = C.CodCategoria
JOIN DetalhesPed AS D
ON P1.CodProd = D.CodProd
JOIN Pedidos AS P2
ON P2.NumPed = D.NumPed
WHERE D.Qtde <= 10 AND YEAR(P2.DataPed) = 1998 ORDER BY C.Descr DESC, P1.Descr DESC

-- EX 11

SELECT D.*
FROM Pedidos AS P
JOIN DetalhesPed AS D
ON P.NumPed = D.NumPed
WHERE YEAR(P.DataEntrega) = 1997