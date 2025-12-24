/* =========================================================
   PROJECT: Zepto Product Data Analysis
   DATABASE: PostgreSQL
   OBJECTIVE:
   - Explore product data
   - Clean pricing inconsistencies
   - Perform business-focused analysis
   ========================================================= */


/* =========================
   TABLE CREATION
   ========================= */

-- Drop table if it already exists to avoid conflicts
DROP TABLE IF EXISTS zepto;

-- Create the Zepto product table
CREATE TABLE zepto (
    sku_id SERIAL PRIMARY KEY,              -- Unique SKU identifier
    category VARCHAR(120),                  -- Product category
    name VARCHAR(150) NOT NULL,             -- Product name
    mrp NUMERIC(8,2),                       -- Maximum Retail Price (₹)
    discountPercent NUMERIC(5,2),           -- Discount percentage
    availableQuantity INTEGER,              -- Units available in inventory
    discountedSellingPrice NUMERIC(8,2),    -- Selling price after discount (₹)
    weightInGms INTEGER,                    -- Product weight in grams
    outOfStock BOOLEAN,                     -- Stock status
    quantity INTEGER                        -- Quantity per pack
);


/* =========================
   DATA EXPLORATION
   ========================= */

-- 1. Count total number of records
SELECT COUNT(*) AS total_rows
FROM zepto;

-- 2. View a sample of the data
SELECT *
FROM zepto
LIMIT 10;

-- 3. Identify rows containing NULL values in important columns
SELECT *
FROM zepto
WHERE name IS NULL
   OR category IS NULL
   OR mrp IS NULL
   OR discountPercent IS NULL
   OR discountedSellingPrice IS NULL
   OR weightInGms IS NULL
   OR availableQuantity IS NULL
   OR outOfStock IS NULL
   OR quantity IS NULL;

-- 4. List all distinct product categories
SELECT DISTINCT category
FROM zepto
ORDER BY category;

-- 5. Count products that are in stock vs out of stock
SELECT outOfStock,
       COUNT(sku_id) AS product_count
FROM zepto
GROUP BY outOfStock;

-- 6. Identify products that appear multiple times (duplicate product names)
SELECT name,
       COUNT(sku_id) AS number_of_skus
FROM zepto
GROUP BY name
HAVING COUNT(sku_id) > 1
ORDER BY number_of_skus DESC;


/* =========================
   DATA CLEANING
   ========================= */

-- 7. Identify products with zero pricing (invalid data)
SELECT *
FROM zepto
WHERE mrp = 0
   OR discountedSellingPrice = 0;

-- 8. Remove records where MRP is zero (cannot be sold)
DELETE FROM zepto
WHERE mrp = 0;

-- 9. Convert price values from paise to rupees
UPDATE zepto
SET mrp = mrp / 100.0,
    discountedSellingPrice = discountedSellingPrice / 100.0;

-- Verify price conversion
SELECT mrp, discountedSellingPrice
FROM zepto;


/* =========================
   DATA ANALYSIS
   ========================= */

-- Q1. Top 10 best-value products based on highest discount percentage
SELECT DISTINCT name,
       mrp,
       discountPercent
FROM zepto
ORDER BY discountPercent DESC
LIMIT 10;

-- Q2. Products with high MRP (₹300+) that are currently out of stock
SELECT DISTINCT name,
       mrp
FROM zepto
WHERE outOfStock = TRUE
  AND mrp > 300
ORDER BY mrp DESC;

-- Q3. Estimated revenue per category
-- (Discounted price × available quantity)
SELECT category,
       SUM(discountedSellingPrice * availableQuantity) AS total_revenue
FROM zepto
GROUP BY category
ORDER BY total_revenue DESC;

-- Q4. Premium products with low discounts
-- (MRP > ₹500 and discount < 10%)
SELECT DISTINCT name,
       mrp,
       discountPercent
FROM zepto
WHERE mrp > 500
  AND discountPercent < 10
ORDER BY mrp DESC, discountPercent ASC;

-- Q5. Top 5 categories offering the highest average discount
SELECT category,
       ROUND(AVG(discountPercent), 2) AS avg_discount_percent
FROM zepto
GROUP BY category
ORDER BY avg_discount_percent DESC
LIMIT 5;

-- Q6. Price per gram for products above 100g
-- Helps identify best value for money
SELECT DISTINCT name,
       weightInGms,
       discountedSellingPrice,
       ROUND(discountedSellingPrice / weightInGms, 2) AS price_per_gram
FROM zepto
WHERE weightInGms >= 100
ORDER BY price_per_gram ASC;

-- Q7. Categorize products by weight size
SELECT DISTINCT name,
       weightInGms,
       CASE
           WHEN weightInGms < 1000 THEN 'Low'
           WHEN weightInGms < 5000 THEN 'Medium'
           ELSE 'Bulk'
       END AS weight_category
FROM zepto;

-- Q8. Total inventory weight per category
-- (Weight × available quantity)
SELECT category,
       SUM(weightInGms * availableQuantity) AS total_inventory_weight_gms
FROM zepto
GROUP BY category
ORDER BY total_inventory_weight_gms DESC;
