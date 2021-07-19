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
