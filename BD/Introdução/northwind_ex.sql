SELECT * FROM customers;

-- ecercício 2
SELECT company_name , city FROM customers;

-- selecionar alguma linha
SELECT * FROM customers LIMIT 10;

-- selecionar algumas linhas e algumas colunas
SELECT company_name, city FROM customers;

-- selecionar as cidades
SELECT DISTINCT(city) from customers;

-- renomear coluna
SELECT postal_code AS CEP FROM customers;
SELECT postal_code CEP1 FROM customers;