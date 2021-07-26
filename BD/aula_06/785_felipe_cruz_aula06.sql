--Exercício 1A
SELECT COUNT(*) AS N_CLIENTES FROM (
	SELECT cs.customer_id, COUNT(orders.order_id) FROM customers cs INNER JOIN
	orders ON cs.customer_id = orders.customer_id
	GROUP BY cs.customer_id
	HAVING COUNT(orders.order_id) > 10
) tb;

--Exercício 1B
WITH tb AS (
	SELECT cs.customer_id, COUNT(orders.order_id) FROM customers cs INNER JOIN
	orders ON cs.customer_id = orders.customer_id
	GROUP BY cs.customer_id
	HAVING COUNT(orders.order_id) > 10
)
SELECT COUNT(*) AS N_CLIENTES FROM tb;

--Exercício 1C
CREATE OR REPLACE VIEW tb AS (
	SELECT cs.customer_id, COUNT(orders.order_id) FROM customers cs INNER JOIN
	orders ON cs.customer_id = orders.customer_id
	GROUP BY cs.customer_id
	HAVING COUNT(orders.order_id) > 10
);

SELECT COUNT(*) AS N_CLIENTES FROM tb;

--Exercício 2A
SELECT COUNT(*) AS N_vendedores FROM (
	SELECT emp.employee_id, COUNT(orders.order_id) FROM orders LEFT JOIN
	employees emp ON emp.employee_id = orders.employee_id
	GROUP BY emp.employee_id
	HAVING COUNT(orders.order_id) < 70
) tb;

--Exercício 2B
WITH tb AS (
	SELECT emp.employee_id, COUNT(orders.order_id) FROM orders LEFT JOIN
	employees emp ON emp.employee_id = orders.employee_id
	GROUP BY emp.employee_id
	HAVING COUNT(orders.order_id) < 70
)
SELECT COUNT(*) AS N_vendedores FROM tb;

--Exercício 2C
CREATE OR REPLACE VIEW tb2 AS (
	SELECT emp.employee_id, COUNT(orders.order_id) FROM orders LEFT JOIN
	employees emp ON emp.employee_id = orders.employee_id
	GROUP BY emp.employee_id
	HAVING COUNT(orders.order_id) < 70
);
SELECT COUNT(*) AS N_vendedores FROM tb2;

--Exercício 3A
SELECT tb3.employee_id, AVG(tb3.valor)  FROM(
	SELECT (od.unit_price * od.quantity - od.discount) AS valor, ors.employee_id
	FROM order_details od LEFT JOIN orders ors ON ors.order_id = od.order_id
	GROUP BY ors.employee_id, od.unit_price, od.quantity, od.discount
) tb3
GROUP BY tb3.employee_id
ORDER BY tb3.employee_id;

--Exercício 3B
WITH tb3 AS (
	SELECT (od.unit_price * od.quantity - od.discount) AS valor, ors.employee_id
	FROM order_details od LEFT JOIN orders ors ON ors.order_id = od.order_id
	GROUP BY ors.employee_id, od.unit_price, od.quantity, od.discount
)
SELECT employee_id , avg(valor) FROM tb3
GROUP BY tb3.employee_id
ORDER BY tb3.employee_id;

--Exercício 3C
CREATE OR REPLACE VIEW tb3 AS (
	SELECT (od.unit_price * od.quantity - od.discount) AS valor, ors.employee_id
	FROM order_details od LEFT JOIN orders ors ON ors.order_id = od.order_id
	GROUP BY ors.employee_id, od.unit_price, od.quantity, od.discount
);
SELECT employee_id , avg(valor) FROM tb3
GROUP BY tb3.employee_id
ORDER BY tb3.employee_id;

--Exercício 4A
SELECT tb4.employee_id, AVG(tb4.valor), COUNT(tb4.order_id)  FROM(
	SELECT (od.unit_price * od.quantity - od.discount) AS valor, ors.employee_id, ors.order_id
	FROM order_details od LEFT JOIN orders ors ON ors.order_id = od.order_id
	GROUP BY ors.employee_id, od.unit_price, od.quantity, od.discount, ors.order_id
	HAVING COUNT(ors.order_id) < 300 and AVG(od.unit_price * od.quantity - od.discount) > 700
) tb4
GROUP BY tb4.employee_id
ORDER BY tb4.employee_id;

--Exercício 4B
WITH tb4 AS
(
	SELECT (od.unit_price * od.quantity - od.discount) AS valor, ors.employee_id, ors.order_id
	FROM order_details od LEFT JOIN orders ors ON ors.order_id = od.order_id
	GROUP BY ors.employee_id, od.unit_price, od.quantity, od.discount, ors.order_id
	HAVING COUNT(ors.order_id) < 300 and AVG(od.unit_price * od.quantity - od.discount) > 700
)
SELECT tb4.employee_id, AVG(tb4.valor), COUNT(tb4.order_id) FROM tb4
GROUP BY tb4.employee_id
ORDER BY tb4.employee_id;

--Exercício 4C
CREATE OR REPLACE VIEW tb4 AS
(
	SELECT (od.unit_price * od.quantity - od.discount) AS valor, ors.employee_id, ors.order_id
	FROM order_details od LEFT JOIN orders ors ON ors.order_id = od.order_id
	GROUP BY ors.employee_id, od.unit_price, od.quantity, od.discount, ors.order_id
	HAVING COUNT(ors.order_id) < 300 and AVG(od.unit_price * od.quantity - od.discount) > 700
);
SELECT tb4.employee_id, AVG(tb4.valor), COUNT(tb4.order_id) FROM tb4
GROUP BY tb4.employee_id
ORDER BY tb4.employee_id;

--Exercício 5
CREATE OR REPLACE VIEW categorias AS
(
	SELECT (od.unit_price * od.quantity - od.discount) AS valor, ors.order_id,
	CASE
	WHEN SUM(od.unit_price * od.quantity - od.discount) >= 5000 THEN 'Gold'
	WHEN SUM(od.unit_price * od.quantity - od.discount) < 5000  AND SUM(od.unit_price * od.quantity - od.discount) >= 1000 THEN 'Silver'
	WHEN SUM(od.unit_price * od.quantity - od.discount) < 1000 THEN 'Bronze'
	END AS categoria
	FROM order_details od LEFT JOIN orders ors ON ors.order_id = od.order_id	
	GROUP BY od.unit_price, od.quantity, od.discount, ors.order_id
);
SELECT categoria, COUNT(order_id) AS numero_de_PEDIDOS, SUM(valor) AS valor_total, AVG(valor) AS media_de_valores FROM categorias
GROUP BY categoria;