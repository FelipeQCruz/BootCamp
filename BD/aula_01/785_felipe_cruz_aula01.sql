-- exercicio 1
select territory_id FROM employee_territories;

--exercicio 2A
select last_name FROM employees;

--exercicio 2B
select last_name FROM employees;

--exercicio 2B
select last_name FROM employees;

--exercicio 2C
select first_name, last_name, date_part('year', birth_date) AS ano FROM employees
WHERE date_part('year', birth_date) > 1960;

--exercicio 2D
select first_name, last_name, date_part('year', hire_date) AS ano FROM employees
WHERE date_part('year', hire_date) = 1993;

--exercicio 2E
select first_name, last_name, date_part('year', birth_date) AS ano FROM employees
WHERE date_part('year', birth_date) BETWEEN  1950 AND 1958;

--exercicio 2F
select first_name, last_name, birth_date, hire_date FROM employees
WHERE date_part('year', birth_date) = 1963 AND date_part('year', hire_date) = 1993;

--exercicio 2G
select first_name, last_name FROM employees
WHERE reports_to = 5;

--exercicio 2H
select first_name, last_name FROM employees
WHERE city IN ('Seattle', 'Kirkland');

--exercício 3A
SELECT product_id, SUM(quantity) AS quantidade FROM order_details
WHERE quantity > 50
GROUP BY product_id;

--exercício 3B
SELECT product_id, SUM(discount) AS desconto FROM order_details
WHERE discount > 0.2
GROUP BY product_id;

--exercício 3C
SELECT product_id, SUM(discount) AS desconto FROM order_details
WHERE discount <= 0.05
GROUP BY product_id;

--exercício 4A
SELECT order_id, date_part('year', order_date) AS ano_pedido, date_part('month', order_date) AS mes_pedido  FROM orders
WHERE date_part('year', order_date) <= 1996 AND date_part('month', order_date) < 9
GROUP BY order_id;

--exercício 4B
SELECT order_id, date_part('year', shipped_date) AS ano_envio, date_part('month', shipped_date) AS mes_envio  FROM orders
WHERE date_part('year', shipped_date) = 1996 AND date_part('month', shipped_date) = 9
GROUP BY order_id;

--exercício 4C
SELECT order_id, ship_region FROM orders
WHERE ship_region IS NOT NULL
GROUP BY order_id;

--exercício 4D
SELECT order_id, customer_id, employee_id, order_date AS data_pedido, required_date AS data_requisicao, shipped_date AS data_envio, ship_via, freight, ship_name, ship_address, ship_city, ship_region, ship_postal_code, ship_country FROM orders
LIMIT 5;

--exercício 5A
SELECT contact_name FROM suppliers
WHERE contact_name LIKE 'M%';

--exercício 5B
SELECT contact_name, contact_title FROM suppliers
WHERE contact_title LIKE '%Manager%';

--exercício 5C
SELECT contact_name, contact_title, country FROM suppliers
WHERE contact_title LIKE '%Sales%' AND country IN ('Sweden', 'Denmark');
