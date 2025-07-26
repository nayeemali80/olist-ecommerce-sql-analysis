
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
