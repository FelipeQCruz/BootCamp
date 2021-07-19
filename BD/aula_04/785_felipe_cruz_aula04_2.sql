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

