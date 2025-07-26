copy (SELECT 
    c.customer_state,
    ROUND(AVG(DATE(o.order_delivered_customer_date) - DATE(o.order_purchase_timestamp))::numeric, 2) AS avg_delivery_days
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE 
    o.order_status = 'delivered'
    AND o.order_delivered_customer_date IS NOT NULL
    AND o.order_purchase_timestamp IS NOT NULL
    AND o.order_delivered_customer_date <> ''
    AND o.order_purchase_timestamp <> ''
GROUP BY c.customer_state
ORDER BY avg_delivery_days desc)
to 'D:/SQL Analysis Project/Shipping & Delivery/average_actual_delivery_time_per_state.csv'
with csv header;


copy (SELECT 
    COUNT(*) AS late_orders
FROM orders
WHERE order_status = 'delivered'
  AND order_delivered_customer_date > order_estimated_delivery_date)
to 'D:/SQL Analysis Project/Shipping & Delivery/count_of_late_deliveries.csv'
with csv header;


