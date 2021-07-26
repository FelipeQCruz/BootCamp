-- Exercício 1
Select orders.order_id, SUM(od.unit_price*od.quantity - od.discount + orders.freight),
RANK() OVER (order by SUM(od.unit_price*od.quantity - od.discount + orders.freight) DESC)
from orders LEFT JOIN order_details od ON orders.order_id = od.order_id
group by orders.order_id;

-- Exercício 2
Select orders.order_id, SUM(od.unit_price*od.quantity - od.discount + orders.freight) AS valor_do_pedido,
SUM(od.unit_price*od.quantity - od.discount + orders.freight) OVER () AS valor_total_pedidos
from orders LEFT JOIN order_details od ON orders.order_id = od.order_id
group by orders.order_id, od.unit_price, od.quantity, od.discount, orders.freight;

-- Exercício 2A
CREATE OR REPLACE VIEW compara_total AS (
Select orders.order_id, SUM(od.unit_price*od.quantity - od.discount + orders.freight) AS valor_do_pedido,
SUM(od.unit_price*od.quantity - od.discount + orders.freight) OVER () AS valor_total_pedidos
from orders LEFT JOIN order_details od ON orders.order_id = od.order_id
group by orders.order_id, od.unit_price, od.quantity, od.discount, orders.freight
);
Select order_id, valor_do_pedido, valor_total_pedidos, 
RANK() OVER (order by valor_do_pedido DESC)
from compara_total;

-- Exercício 3
CREATE OR REPLACE VIEW relatorio_vendedor_mensal AS (
Select COUNT(orders.order_id) as pedidos, SUM(od.unit_price*od.quantity - od.discount + orders.freight) AS valor_do_pedido, orders.employee_id AS vendedor,
CONCAT(DATE_PART('year', order_date), '-', DATE_PART('month', order_date)) AS mes, 
SUM(od.unit_price*od.quantity - od.discount + orders.freight) OVER (order by orders.employee_id) AS valor_acumulado
from orders LEFT JOIN order_details od ON orders.order_id = od.order_id
group by orders.order_id, od.unit_price, od.quantity, od.discount, orders.freight
);
Select vendedor, mes, pedidos, valor_do_pedido, valor_acumulado
from relatorio_vendedor_mensal
GROUP BY vendedor, mes, pedidos, valor_do_pedido, valor_acumulado
ORDER BY vendedor, mes;