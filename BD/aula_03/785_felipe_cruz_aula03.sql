-- exercício 1A
SELECT COUNT (territory_id) FROM territories;

-- exercício 1B
SELECT COUNT (territory_id) FROM territories
GROUP BY region_id;

-- exercício 2A
SELECT COUNT (employee_id) FROM employees
GROUP BY reports_to;

-- exercício 2B
SELECT COUNT (employee_id) FROM employees
GROUP BY city;

-- exercício 3A
SELECT SUM (quantity) FROM order_details
GROUP BY order_id;

-- exercício 3B
SELECT order_id, SUM(unit_price * quantity - discount) as valor_total
FROM order_details
GROUP BY order_id;
	
-- exercício 3C
SELECT product_id FROM order_details
GROUP BY product_id
ORDER BY SUM(quantity) DESC
LIMIT 1;

-- exercício 3D
SELECT order_id, SUM(quantity) FROM order_details
GROUP BY order_id
HAVING SUM(quantity) < 3;

-- exercício 4A
SELECT customer_id, COUNT(order_id) AS qtd_pedidos FROM orders
GROUP BY customer_id
ORDER BY qtd_pedidos DESC
LIMIT 1;

-- exercício 4B
SELECT customer_id, COUNT(order_id) AS qtd_pedidos FROM orders
GROUP BY customer_id
ORDER BY qtd_pedidos 
LIMIT 1;

-- exercício 4C
SELECT 
CONCAT(DATE_PART('month', order_date), '-', DATE_PART('year', order_date)) AS mes, 
COUNT(order_id) AS qtd_pedidos FROM orders
GROUP BY DATE_PART('year', order_date), DATE_PART('month', order_date)
ORDER BY DATE_PART('year', order_date), DATE_PART('month', order_date);

-- exercício 4D
SELECT 
AVG(AGE(required_date, order_date)) AS tempo_medio, customer_id FROM orders
GROUP BY customer_id;

-- exercício 4E
SELECT 
ship_country, COUNT(order_id) FROM orders
GROUP BY ship_country
ORDER BY COUNT(order_id) DESC;

-- exercício 4F
SELECT 
ship_city, MAX(AGE(required_date, order_date)) FROM orders
GROUP BY ship_city 
ORDER BY COUNT(AGE(required_date, order_date)) DESC;

-- exercício 4G
SELECT customer_id, SUM(freight)AS frete FROM orders
GROUP BY customer_id;

-- exercício 4H
SELECT ship_via, SUM(freight) AS frete FROM orders
GROUP BY ship_via;

-- exercício 4I
SELECT customer_id, ship_via , SUM(freight) AS total_frete FROM orders
GROUP BY ship_via, customer_id
ORDER BY customer_id, ship_via;

-- exercício 5
SELECT country, COUNT(supplier_id) FROM suppliers
GROUP BY country
HAVING COUNT(supplier_id) <> 0
ORDER BY COUNT(supplier_id) DESC;

-- exercício 6A
SELECT supplier_id, COUNT(product_id) AS qtd_produtos FROM products
GROUP BY supplier_id;

-- exercício 6B
SELECT supplier_id, COUNT(product_id) AS qtd_produtos FROM products
GROUP BY supplier_id
ORDER BY qtd_produtos DESC;

-- exercício 6C
SELECT supplier_id, category_id, COUNT(product_id) AS qtd_produtos FROM products
GROUP BY supplier_id, category_id
ORDER BY supplier_id, category_id;

-- exercício 6D
SELECT COUNT(discontinued) AS qtd_descontinuados FROM products;

-- exercício 6E
SELECT supplier_id, SUM(units_in_stock) AS qtd_estoque FROM products
GROUP BY supplier_id
HAVING SUM(units_in_stock) < 20;

-- exercício 6F
SELECT category_id, AVG(unit_price) AS preco_medio FROM products
GROUP BY category_id;

-- exercício 6G
SELECT supplier_id, category_id, MAX(unit_price) AS mais_caro, MIN(unit_price) AS mais_barato, AVG(unit_price) AS media_valores from products
GROUP BY supplier_id, category_id
ORDER BY supplier_id, category_id;

