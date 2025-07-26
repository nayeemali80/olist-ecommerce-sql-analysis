copy (SELECT 
    payment_type,
    COUNT(*) AS total_number_of_payments,
    ROUND(AVG(payment_value)::numeric, 2) AS avg_payment
FROM order_payments
GROUP BY payment_type
ORDER BY total_number_of_payments desc)
to 'D:/SQL Analysis Project/Payment Behavior/payment_types_and_count.csv'
with csv header;


copy (SELECT
    payment_type,
    ROUND(AVG(payment_installments), 2) AS avg_installments
FROM order_payments
GROUP BY payment_type
ORDER BY avg_installments desc)
to 'D:/SQL Analysis Project/Payment Behavior/avg_installments_per_payment_type.csv'
with csv header;


copy (WITH monthly_installments AS (
    SELECT 
        DATE_TRUNC('month', o.order_purchase_timestamp::timestamp) AS month,
        op.payment_type,
        AVG(op.payment_installments) AS avg_installments
    FROM orders o
    JOIN order_payments op ON o.order_id = op.order_id
    GROUP BY month, op.payment_type
)
SELECT 
    TO_CHAR(month, 'YYYY-MM') AS month,
    payment_type,
    ROUND(avg_installments, 2) AS avg_installments
FROM monthly_installments
ORDER BY month, avg_installments desc)
to 'D:/SQL Analysis Project/Payment Behavior/installment_purchases_over_time.csv'
with csv header;


