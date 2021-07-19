-- exercício 1Aa
SELECT tb_estados.nome AS estados, COUNT(tb_cidades.id) AS n_cidades
FROM tb_cidades
INNER JOIN tb_estados ON tb_cidades.estado = tb_estados.id
GROUP BY estados
ORDER BY estados;

-- exercício 1Ab
SELECT tb_estados.nome AS estados, COUNT(tb_cidades.id) AS n_cidades
FROM tb_cidades
INNER JOIN tb_estados ON tb_cidades.estado = tb_estados.id
GROUP BY estados
ORDER BY n_cidades DESC;

-- exercício 1B
SELECT nome, COUNT(nome) AS n_cidades_mesmo_nome FROM tb_cidades
GROUP BY nome
HAVING COUNT(nome) > 1;

-- exercício 1C
SELECT tb_estados.nome, tb_cidades.nome, COUNT(tb_cidades.nome) AS n_cidades_mesmo_nome FROM tb_cidades
INNER JOIN tb_estados ON tb_cidades.estado = tb_estados.id
GROUP BY tb_estados.nome, tb_cidades.nome
HAVING COUNT(tb_cidades.nome) > 1;

--DATABASE Northwind

-- exercício 2A
SELECT customers.customer_id AS cliente, COUNT(orders.order_id) AS n_pedidos
FROM customers
INNER JOIN orders ON orders.customer_id = customers.customer_id 
GROUP BY cliente
ORDER BY n_pedidos DESC
LIMIT 10;

-- exercício 2B
SELECT CONCAT(DATE_PART('month', orders.order_date), '-', DATE_PART('year', orders.order_date)) AS data_pedido, 
AVG(order_details.unit_price) AS valor_medio
FROM orders
INNER JOIN order_details ON orders.order_id = order_details.order_id 
GROUP BY data_pedido
ORDER BY COUNT(orders.order_id) DESC;
