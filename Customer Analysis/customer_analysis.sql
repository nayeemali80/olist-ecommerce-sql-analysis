
Copy(
SELECT 
    customer_state,
    COUNT(DISTINCT customer_unique_id) AS unique_customers
FROM customers
GROUP BY customer_state
ORDER BY unique_customers desc)
to 'D:/SQL Analysis Project/Customer Analysis/unique_customers_by_state.csv'
with csv header;


copy (
SELECT 
    COUNT(*) AS total_customers,
    COUNT(DISTINCT customer_unique_id) AS unique_customers,
    COUNT(*) - COUNT(DISTINCT customer_unique_id) AS repeat_customers
FROM customers)
to 'D:/SQL Analysis Project/Customer Analysis/repeat_vs_onetime_customers.csv'
with csv header;


copy 
(WITH customer_spending AS (
    SELECT 
        c.customer_unique_id,
        SUM(oi.price)::integer AS total_spent,
        COUNT(DISTINCT o.order_id) AS total_orders
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN customers c ON o.customer_id = c.customer_id
    GROUP BY c.customer_unique_id
)
SELECT 
    customer_unique_id,
    total_spent,
    total_orders
FROM customer_spending
WHERE total_orders > 1
ORDER BY total_spent DESC
LIMIT 10)
to 'D:/SQL Analysis Project/Customer Analysis/top_repeat_customers_by_total_spending.csv'
with csv header;


    