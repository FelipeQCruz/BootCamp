--exercício 1
SELECT DISTINCT(employee_id) from employee_territories
ORDER BY employee_id DESC;

--exercício 2A
SELECT CONCAT(first_name, ' ', last_name) AS nome from employees
ORDER BY CONCAT(first_name, ' ', last_name);

--exercício 2B
SELECT CONCAT(first_name, ' ', last_name, ', ', title) AS nome_titulo from employees
ORDER BY CONCAT(first_name, last_name, title);

--exercício 2C
SELECT DISTINCT(last_name) from employees;

--exercício 2D
SELECT CONCAT(first_name, ' ', last_name) AS nome,
date_part('year', birth_date) from employees;

--exercício 2E
SELECT CONCAT(first_name, ' ', last_name) AS nome,
SUBSTRING(birth_date::text, 1, 4) from employees;

--exercício 2F
SELECT CONCAT(first_name, ' ', last_name) AS nome,
AGE(birth_date) AS idade from employees
ORDER BY AGE(birth_date) DESC;

--exercício 2G
SELECT CONCAT(first_name, ' ', last_name) AS nome,
AGE(birth_date) - AGE(hire_date) AS idade_contratado from employees
ORDER BY AGE(birth_date) - AGE(hire_date);

--exercício 2H
SELECT CONCAT(first_name, ' ', last_name) AS nome,
AGE(birth_date) AS MAIS_VELHO from employees
ORDER BY AGE(birth_date) DESC
LIMIT 1;

--exercício 2I, considerando a pessoa mais jovem da empresa
SELECT CONCAT(first_name, ' ', last_name) AS nome,
AGE(birth_date) AS mais_jovem from employees
ORDER BY AGE(birth_date)
LIMIT 1;

--exercício 2I, considerando a pessoa mais jovem ao ser contratada
SELECT CONCAT(first_name, ' ', last_name) AS nome,
AGE(birth_date) - AGE(hire_date) AS idade_contratado from employees
ORDER BY AGE(birth_date) - AGE(hire_date)
LIMIT 1;

--exercício 2J
SELECT CONCAT(first_name, ' ', last_name) AS nome, title, 
CASE 
WHEN title = 'Vice President, Sales' THEN '1'
WHEN title = 'Sales Manager' THEN '2' 
WHEN title = 'Inside Sales Coordinator' THEN '3'
WHEN title = 'Sales Representative' THEN '4' 
END AS prioridade
FROM employees;

--exercício 2K
SELECT CONCAT(first_name, ' ', last_name) AS nome, title, 
CASE 
WHEN title = 'Vice President, Sales' THEN '1'
WHEN title = 'Sales Manager' THEN '2' 
WHEN title = 'Inside Sales Coordinator' THEN '3'
WHEN title = 'Sales Representative' THEN '4' 
END AS prioridade,
AGE(hire_date) AS tempo_empresa
FROM employees;

--exercício 3A
SELECT product_id, product_name, unit_price FROM products
ORDER BY unit_price DESC
LIMIT 3;

--exercício 3B
SELECT product_id, product_name, units_in_stock FROM products
WHERE units_in_stock <> 0
ORDER BY units_in_stock
LIMIT 10;

--exercício 3C
SELECT product_id, product_name, unit_price, units_in_stock FROM products
WHERE units_in_stock > 0
ORDER BY unit_price DESC
LIMIT 5;

--exercício 3C
SELECT product_id, product_name, unit_price, units_in_stock FROM products
WHERE units_in_stock > 100 OR unit_price < 15;

--exercício 4A
SELECT   
CASE
WHEN LENGTH(LEFT(ship_name, POSITION(' ' IN ship_name))) != 0 THEN LEFT(ship_name, POSITION(' ' IN ship_name))
WHEN LENGTH(LEFT(ship_name, POSITION(' ' IN ship_name))) = 0 THEN ship_name
END as primeiro_nome
FROM orders;

--exercício 4B
SELECT 
(date_part('month', AGE(required_date, order_date))*30) + date_part('DAY', AGE(required_date, order_date))
AS tempo_de_entrega
FROM orders;

--exercício 4C
SELECT 
(date_part('month', AGE(required_date, order_date))*30) + date_part('DAY', AGE(required_date, order_date))
AS tempo_de_entrega,
freight
FROM orders
WHERE freight IS NOT NULL AND required_date IS NOT NULL
ORDER BY freight DESC, tempo_de_entrega DESC
LIMIT 5;

--exercício 4D
SELECT 
(date_part('month', AGE(required_date, order_date))*30) + date_part('DAY', AGE(required_date, order_date))
AS tempo_de_entrega,
freight
FROM orders
WHERE freight IS NOT NULL AND required_date IS NOT NULL
ORDER BY tempo_de_entrega DESC, freight DESC
LIMIT 5;

--exercício 4E
SELECT freight FROM orders
WHERE ship_country = 'Brazil'
ORDER BY freight
LIMIT 3;

--exercício 4F
SELECT LEFT(ship_country, 3) as pais, 
(date_part('month', AGE(required_date, order_date))*30) + date_part('DAY', AGE(required_date, order_date))
AS tempo_de_entrega,
freight AS frete
FROM orders
ORDER BY pais, tempo_de_entrega, freight;

