Zepto E-commerce SQL Data Analyst Project
📌 Project Overview

This project is a real-world SQL data analysis case study based on an e-commerce inventory dataset scraped from Zepto, a leading Indian quick-commerce platform.

The objective is to simulate how data analysts work with raw inventory data to:

Explore product catalogs

Clean messy real-world data

Answer business-driven questions using SQL

Derive actionable insights around pricing, inventory, and revenue

This project follows an end-to-end analytics workflow, making it suitable for SQL practice and data analyst portfolio use.

📁 Dataset Overview

Each row represents a unique SKU (Stock Keeping Unit).
Duplicate product names exist due to different weights, discounts, or packaging — similar to real e-commerce catalogs.

Columns
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
1. Data Ingestion

Imported CSV dataset into PostgreSQL

Resolved encoding issues by converting file to UTF-8

Validated schema and row counts after load

2. Exploratory Data Analysis (EDA)

Total record count

Sample data inspection

Null value checks across columns

Distinct product category analysis

In-stock vs out-of-stock comparison

Identification of duplicate product names across SKUs

3. Data Cleaning

Removed invalid records with zero MRP or zero selling price

Converted pricing fields from paise to rupees

Ensured consistency across numeric columns

4. Business Analysis & Insights

Key analytical queries include:

Top 10 products with highest discount percentages

High-MRP products that are currently out of stock

Estimated potential revenue by product category

Expensive products (MRP > ₹500) with minimal discounts

Top 5 categories offering highest average discounts

Price-per-gram analysis to identify value-for-money products

Product segmentation by weight (Low / Medium / Bulk)

Total inventory weight aggregated by category

📊 Key Outcomes

Identified discount-heavy SKUs for promotional strategies

Highlighted revenue leakage due to out-of-stock premium products

Compared category-level pricing efficiency

Enabled inventory prioritization using weight and availability metrics

🛠️ Tools Used

PostgreSQL

SQL

pgAdmin
