copy (SELECT 
    s.seller_id,
    s.seller_state,
    ROUND(SUM(oi.price)::numeric, 2) AS total_sales
FROM order_items oi
JOIN sellers s ON oi.seller_id = s.seller_id
GROUP BY s.seller_id, s.seller_state
ORDER BY total_sales DESC
LIMIT 10)
to'D:/SQL Analysis Project/Seller Analysis/top_10_sellers_by_revenue.csv'
with csv header;

copy(
SELECT 
    seller_id,
    COUNT(DISTINCT order_id) AS total_orders
FROM order_items
GROUP BY seller_id
ORDER BY total_orders DESC
LIMIT 10)
to 'D:/SQL Analysis Project/Seller Analysis/sellers_with_most_orders.csv'
with csv header;



copy (
WITH delivery_time AS (
    SELECT 
        oi.seller_id,
        DATE(o.order_delivered_customer_date) - DATE(o.order_purchase_timestamp) AS delivery_days,
        DATE(o.order_estimated_delivery_date) - DATE(o.order_delivered_customer_date) AS delay_days
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    WHERE 
        o.order_status = 'delivered'
        AND o.order_purchase_timestamp IS NOT NULL AND o.order_purchase_timestamp <> ''
        AND o.order_delivered_customer_date IS NOT NULL AND o.order_delivered_customer_date <> ''
        AND o.order_estimated_delivery_date IS NOT NULL AND o.order_estimated_delivery_date <> ''
)
SELECT 
    s.seller_id,
    s.seller_state,
    ROUND(AVG(dt.delivery_days), 2) AS avg_delivery_days,
    COUNT(*) FILTER (WHERE dt.delay_days < 0) AS late_deliveries
FROM delivery_time dt
JOIN sellers s ON dt.seller_id = s.seller_id
GROUP BY s.seller_id, s.seller_state
ORDER BY late_deliveries DESC
LIMIT 10)
to 'D:/SQL Analysis Project/Seller Analysis/delivery_delay_by_seller.csv'
with csv header;



