🛒 Zepto E-commerce SQL Data Analyst Project
📌 Project Overview

This project is a real-world SQL data analysis case study based on an e-commerce inventory dataset scraped from Zepto, one of India’s leading quick-commerce platforms.

The objective is to simulate how data analysts work with raw inventory data to:

Explore product catalogs

Clean messy, real-world data

Answer business-driven questions using SQL

Generate insights around pricing, inventory, and revenue

This project follows an end-to-end analytics workflow, making it ideal for SQL practice and data analyst portfolios.

📁 Dataset Overview

Each row represents a unique SKU (Stock Keeping Unit).
Duplicate product names exist due to different weights, discounts, and packaging, reflecting how real e-commerce catalogs are structured.

🧾 Dataset Columns
Column Name	Description
sku_id	Unique identifier for each SKU
name	Product name
category	Product category
mrp	Maximum Retail Price (₹)
discountPercent	Discount applied
discountedSellingPrice	Final selling price (₹)
availableQuantity	Units available in inventory
weightInGms	Product weight in grams
outOfStock	Stock availability flag
quantity	Units per package
🗄️ Database Schema
CREATE TABLE zepto (
  sku_id SERIAL PRIMARY KEY,
  category VARCHAR(120),
  name VARCHAR(150) NOT NULL,
  mrp NUMERIC(8,2),
  discountPercent NUMERIC(5,2),
  availableQuantity INTEGER,
  discountedSellingPrice NUMERIC(8,2),
  weightInGms INTEGER,
  outOfStock BOOLEAN,
  quantity INTEGER
);

🔄 Project Workflow
1️⃣ Data Ingestion

Imported CSV dataset into PostgreSQL

Fixed encoding issues by converting the file to UTF-8

Validated row counts and schema integrity after load

2️⃣ Exploratory Data Analysis (EDA)

Total record count

Sample data inspection

Null value analysis across columns

Distinct product category analysis

In-stock vs out-of-stock comparison

Identification of duplicate product names across SKUs

3️⃣ Data Cleaning

Removed records with zero MRP or zero selling price

Converted pricing fields from paise → rupees

Ensured numeric consistency across columns

4️⃣ Business Analysis & Insights

Key analytical queries performed:

🔹 Top 10 products with highest discount percentages

🔹 High-MRP products currently out of stock

🔹 Estimated potential revenue by product category

🔹 Expensive products (MRP > ₹500) with minimal discounts

🔹 Top 5 categories offering highest average discounts

🔹 Price-per-gram analysis to identify value-for-money products

🔹 Product segmentation into Low / Medium / Bulk weight groups

🔹 Total inventory weight aggregated by category

📊 Key Outcomes

Identified discount-heavy SKUs for promotional strategies

Highlighted revenue leakage due to out-of-stock premium items

Compared category-level pricing efficiency

Supported inventory prioritization using availability and weight metrics

🛠️ Tools Used

PostgreSQL

SQL

pgAdmin
