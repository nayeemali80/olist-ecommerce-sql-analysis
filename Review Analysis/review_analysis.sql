copy (SELECT 
    p.product_id,
    pct.product_category_name_english,
    ROUND(AVG(r.review_score), 2) AS avg_review_score
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN category_translation pct ON p.product_category_name = pct.product_category_name
JOIN order_reviews r ON oi.order_id = r.order_id
GROUP BY p.product_id, pct.product_category_name_english
ORDER BY avg_review_score DESC
LIMIT 10)
to 'D:/SQL Analysis Project/Review Analysis/average_review_score_per_product.csv'
with csv header;



copy (SELECT 
    COUNT(*) AS negative_reviews
FROM order_reviews
WHERE review_score <= 2)
to 'D:/SQL Analysis Project/Review Analysis/negative_reviews.csv'
with csv header
