-- exercício 1
SELECT emp1.first_name AS colaborador, emp2.first_name AS gestor 
FROM (employees AS emp1 CROSS JOIN employees AS emp2)
WHERE emp1.reports_to = emp2.employee_id;

--exercício 2A
-- Para a tabela tb_cidades:
-- Chave primária: id
-- Chave estrangeira: estado

-- Para a tabela tb_estados:
-- Chave primária: id

--Exercício 2B
--Arquivo 785_felipe_cruz_aula05_2B em anexo


--Exercício 3A

-- Categories: PK = category_id
-- customer_customer_demo: PK = customer_id, PK = customer_type_id
-- customer_demographics: PK = customer_type_id
-- customers: PK = customer_id
-- Employee_territories: FK = employee_id, FK = territory_id
-- Employees: PK = employee_id
-- order_details: FK = order_id, FK = product_id
-- orders: PK = order_id, FK1 = customer_id, FK2 = employee_id, FK3 = ship_via
-- products: PK = product_id, FK1 = supplier_id, FK2 = category_id
-- region: PK = region_id
-- shippers: PK = shipper_id
-- suppliers: PK = supplier_id
-- territories: PK = territory_id, FK1 = region_id
-- us_states: PK = state_id

--Exercício 3B
--Arquivo 785_felipe_cruz_aula05_3B em anexo

-- Exercício 4	
SELECT o.order_id, tb1.category_id 
	FROM orders o LEFT JOIN(
		SELECT od.order_id, tb2.category_id
			FROM order_details od LEFT JOIN (
				SELECT ct.category_id, products.product_id
			FROM categories ct LEFT JOIN products ON ct.category_id = products.category_id
			) tb2 ON od.product_id = tb2.product_id
	) tb1 ON o.order_id = tb1.order_id;
	
-- Exercício 5
SELECT tb4.customer_type_id, tb4.customer_desc, sp.supplier_id
	FROM suppliers sp FULL JOIN
	(SELECT tb3.customer_type_id, tb3.customer_desc, products.supplier_id
		FROM products RIGHT JOIN
		(SELECT tb2.customer_type_id, tb2.customer_desc, od.product_id
			FROM order_details od RIGHT JOIN
			(SELECT tb1.customer_type_id, tb1.customer_desc, orders.order_id
				FROM orders RIGHT JOIN
				(SELECT cd.customer_type_id, customers.customer_id, cd.customer_desc
					FROM customer_demographics cd LEFT JOIN customers ON cd.customer_type_id = customers.customer_id
				) tb1 ON tb1.customer_id = orders.customer_id
			) tb2 ON od.order_id = tb2.order_id
		) tb3 ON tb3.product_id = products.product_id
	) tb4 ON tb4.supplier_id = sp.supplier_id;
	
-- Exercício 6
SELECT tb1.category_id AS categoria_de_produto, COUNT(o.order_id) AS ordeNS_de_compra
	FROM orders o LEFT JOIN(
		SELECT od.order_id, tb2.category_id
			FROM order_details od LEFT JOIN (
				SELECT ct.category_id, products.product_id
			FROM categories ct LEFT JOIN products ON ct.category_id = products.category_id
			) tb2 ON od.product_id = tb2.product_id
	) tb1 ON o.order_id = tb1.order_id
GROUP BY categoria_de_produto
ORDER BY categoria_de_produto;