-- i
SELECT p.name as product_name, calories, fats, sugar, c.name as category_name
FROM products p
JOIN nutritions n
ON p.product_id = n.product_id
JOIN category c
ON p.category_id = c.category_id;

-- ii
SELECT o.order_id, date_time, address, customer_name, customer_ph,
       total_price, amount, p.name, p.price
FROM orders o
JOIN products_orders po
ON o.order_id = po.order_id
JOIN products p
ON po.product_id = p.product_id;

-- iii
INSERT INTO products_orders (order_id, product_id, amount)
VALUES
    (1, 18, 2),
    (2, 5, 1),
    (3, 14, 3),
    (4, 2, 2),
    (5, 12, 4);

-- iv
UPDATE orders
SET total_price = (
    SELECT SUM(amount * price)
    FROM products_orders po
    JOIN products p
    ON po.product_id = p.product_id
    WHERE order_id = orders.order_id
);

-- v
-- most expensive order
SELECT *
FROM orders
ORDER BY total_price DESC
LIMIT 1;

-- cheapest order
SELECT *
FROM orders
ORDER BY total_price
LIMIT 1;

-- average total price
SELECT AVG(total_price)
FROM orders;

-- vi
SELECT customer_name, COUNT(*) as ordered_times
FROM orders
GROUP BY customer_name
ORDER BY ordered_times DESC
LIMIT 1;

-- vii
-- best selling product
SELECT p.product_id, p.name, SUM(po.amount) as total_sold
FROM products_orders po
JOIN products p
ON po.product_id = p.product_id
GROUP BY po.product_id
ORDER BY total_sold DESC
LIMIT 1;

-- least selling product
SELECT p.product_id, p.name, SUM(po.amount) as total_sold
FROM products_orders po
JOIN products p
ON po.product_id = p.product_id
GROUP BY po.product_id
ORDER BY total_sold
LIMIT 1;

-- avg selling per product
SELECT p.product_id, p.name, AVG(po.amount) as avg_sold
FROM products_orders po
JOIN products p
ON po.product_id = p.product_id
GROUP BY po.product_id;

-- viii
-- best selling product
SELECT c.name as category_name, p.product_id, p.name, SUM(po.amount) as total_sold
FROM products_orders po
JOIN products p
ON po.product_id = p.product_id
JOIN category c
ON p.category_id = c.category_id
GROUP BY po.product_id
ORDER BY total_sold DESC
LIMIT 1;

-- least selling product
SELECT c.name as category_name, p.product_id, p.name, SUM(po.amount) as total_sold
FROM products_orders po
JOIN products p
ON po.product_id = p.product_id
JOIN category c
ON p.category_id = c.category_id
GROUP BY po.product_id
ORDER BY total_sold
LIMIT 1;

-- ix
SELECT p.name, p.product_id, COUNT(*) as occurrence
FROM products_orders po
JOIN products p
ON po.product_id = p.product_id
GROUP BY p.product_id
ORDER BY occurrence DESC
LIMIT 1;
