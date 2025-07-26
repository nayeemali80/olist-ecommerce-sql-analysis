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

