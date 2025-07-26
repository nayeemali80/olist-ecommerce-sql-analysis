copy (SELECT 
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.price) AS total_revenue,
    ROUND(AVG(oi.price)::numeric, 2) AS avg_order_value
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id)
to 'D:/SQL Analysis Project/Sales & Orders Analysis/sales_summery.csv'
with csv header;


Copy(
SELECT 
    TO_CHAR(order_purchase_timestamp::timestamp, 'YYYY-MM') AS order_month,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.price) AS total_sales
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY order_month
ORDER BY order_month)
to 'D:/SQL Analysis Project/Sales & Orders Analysis/monthly_sales_summary.csv'
with csv header;






