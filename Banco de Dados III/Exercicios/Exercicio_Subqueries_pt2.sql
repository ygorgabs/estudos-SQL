use BD_CDS
-- ex 1

SELECT nome_cli 
	FROM cliente WHERE cod_cli NOT IN 
		(SELECT cod_cli FROM conjuge)

-- ex 2

SELECT nome_cli 
	FROM cliente WHERE cod_cli IN
		(SELECT cod_cli FROM conjuge)

-- ex 3

SELECT nome_cat
	FROM categoria WHERE cod_cat NOT IN 
		(SELECT cod_cat FROM titulo)

-- ex 4

SELECT nome_grav 
	FROM gravadora WHERE cod_grav NOT IN
		(SELECT cod_gravadora FROM titulo)

-- ex 5

SELECT cod_func, nome_func
	FROM funcionario WHERE cod_func IN
		(SELECT cod_func FROM dependente) AND cod_func NOT IN
		(SELECT cod_func FROM pedido)

-- ex 6

SELECT cod_func, nome_func
	FROM funcionario WHERE cod_func IN
		(SELECT cod_func from pedido WHERE cod_cli IN 
			(SELECT cod_cli from conjuge))

-- ex 7

SELECT nome_cli 
	FROM cliente WHERE cod_cli IN
		(SELECT TOP 3 cod_cli FROM cliente ORDER BY renda_cli DESC)

-- ex 8

SELECT * 
	FROM titulo WHERE valor_cd = 
		(SELECT MAX(valor_cd) FROM titulo)

-- ex 9

UPDATE funcionario
	SET salario_func = salario_func * 1.2 WHERE cod_func NOT IN
		(SELECT cod_func FROM dependente)

-- ex 10

UPDATE funcionario
	SET salario_func = salario_func * 1.1 WHERE cod_func IN
		(SELECT cod_func FROM dependente)

-- ex 11

UPDATE cliente
	SET renda_cli = renda_cli + 100 WHERE cod_cli NOT IN
		(SELECT cod_cli from conjuge)

-- ex 12

UPDATE cliente
	SET renda_cli = renda_cli + 100 WHERE cod_cli NOT IN
		(SELECT cod_cli FROM conjuge)
	AND sexo_cli LIKE 'F'

-- ex 13

UPDATE cliente
	SET renda_cli = renda_cli + 200 WHERE cod_cli IN
		(SELECT cod_cid FROM pedido)

-- ex 14

UPDATE cliente
	SET renda_cli = renda_cli + 500 WHERE cod_cid IN
		(SELECT cod_cli FROM pedido WHERE cod_cli NOT IN
			(SELECT cod_cli FROM conjuge))

-- ex 15

UPDATE pedido
	SET valor_ped = valor_ped - (valor_ped * 0.1) WHERE num_ped IN
		(SELECT num_ped FROM titulo_pedido WHERE cod_tit = 1)

-- ex 16

UPDATE funcionario
	SET salario_func = salario_func + 500 WHERE cod_func IN
		(SELECT cod_func FROM pedido WHERE cod_cli = 1)

-- ex 17
UPDATE titulo
	SET valor_cd = valor_cd - (valor_cd * 0.1) WHERE cod_tit NOT IN
		(SELECT cod_tit FROM titulo_pedido)

-- ex 18

UPDATE funcionario
	SET salario_func = salario_func * 1.2 WHERE cod_func NOT IN
		(SELECT cod_func FROM dependente)
