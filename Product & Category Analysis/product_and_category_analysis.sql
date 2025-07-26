Copy(
SELECT 
    pct.product_category_name_english,
    SUM(oi.price) AS total_sales
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN category_translation pct ON p.product_category_name = pct.product_category_name
GROUP BY pct.product_category_name_english
ORDER BY total_sales DESC
LIMIT 10)
to 'D:/SQL Analysis Project/Product & Category Analysis/Top_10_Categories_by_Sales.csv'
with csv header;



COPY 
(SELECT 
    pct.product_category_name_english,
    ROUND((SUM(oi.freight_value) / NULLIF(SUM(oi.price), 0))::numeric, 2) AS freight_to_price_ratio
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN category_translation pct ON p.product_category_name = pct.product_category_name
GROUP BY pct.product_category_name_english
ORDER BY freight_to_price_ratio DESC
LIMIT 10)
to 'D:/SQL Analysis Project/Product & Category Analysis/Category_with_Highest_Freight_to_Price_Ratio.csv'
with csv header;


