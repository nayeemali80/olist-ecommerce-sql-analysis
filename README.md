🛒 Olist E-Commerce SQL Analysis
This project explores the Brazilian E-Commerce Public Dataset by Olist, using SQL to perform detailed business insights and trend analysis. The dataset contains real-world transactions from a multi-vendor marketplace, offering a great opportunity to practice data analysis, transformation, and storytelling using SQL.

📌 Project Objectives
Understand the structure and relationships across multiple e-commerce tables.

Use SQL queries to uncover customer behavior, sales trends, delivery performance, and more.

Simulate real-world reporting used in business intelligence and marketplace operations.

Prepare cleaned and structured datasets for visualization or further analysis in tools like Power BI.

🧩 Dataset Overview
The dataset includes multiple tables:

orders – Purchase orders and delivery timeline.

order_items – Products within each order.

products – Product metadata.

sellers – Seller-level information.

customers – Customer location and identifiers.

order_reviews – Customer feedback.

order_payments – Payment methods and installments.

category_translation – Product category names in English.

geolocation – Location mapping data.

Source: Olist E-Commerce Public Dataset on Kaggle

📊 Key Analysis Sections
The project is divided into multiple focused sections, each with corresponding SQL scripts and result .csv exports:

1. 📦 Order & Sales Overview
Monthly orders and revenue trends.

Total orders, total sales, average order value.

2. 🧍 Customer Insights
One-time vs repeat customers.

Top 10 customers by total spending.

Customer states with highest average delivery times.

3. 🚚 Delivery Performance
Actual vs estimated delivery time.

Sellers with the most late deliveries.

4. 💬 Review & Rating Behavior
Average review scores by product category.

Time lag between purchase and review.

5. 💳 Payment Behavior
Share of payment methods over time.

Average installments by month and payment type.

6. 🛍 Product Analysis
Top product categories by sales volume.

Freight-to-price ratio by product category.

7. 🧾 Seller Performance
Top sellers by revenue.

Delivery performance by seller state.

🚀 How to Use
Clone the repository:

bash
Copy
Edit
git clone https://github.com/nayeemali80/olist-ecommerce-sql-analysis.git
Open the .sql files using DBeaver, PgAdmin, or any SQL editor.

Connect to a PostgreSQL (or compatible) database with the Olist dataset imported.

Run the queries section-wise or as needed.

📈 Future Scope
Integrate with Power BI or Tableau for interactive dashboards.

Perform data cleaning and transformation using SQL CTEs or views.

Expand the project to machine learning-ready data pipelines.

🧑‍💻 Author
Nayeem Ibn Ali
GitHub: @nayeemali80
