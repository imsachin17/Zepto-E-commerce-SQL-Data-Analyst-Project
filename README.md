
# **🛒 Zepto E-commerce SQL Data Analyst Project**

---

## **📌 Project Overview**

This project is a **real-world SQL data analysis case study** based on an e-commerce inventory dataset scraped from **Zepto**, a quick-commerce platform.

The goal is to simulate how **data analysts** work with **raw inventory data** to:

* **Explore product catalogs**
* **Clean messy, real-world datasets**
* **Answer business-driven questions using SQL**
* **Generate insights on pricing, inventory, and revenue**

---

## **📁 Dataset Overview**

Each row represents a unique **SKU (Stock Keeping Unit)**.
Duplicate product names exist due to **different weights, discounts, and packaging**, which mirrors real e-commerce catalog structures.

---

### **🧾 Dataset Columns**

| **Column Name**            | **Description**                |
| -------------------------- | ------------------------------ |
| **sku_id**                 | Unique identifier for each SKU |
| **name**                   | Product name                   |
| **category**               | Product category               |
| **mrp**                    | Maximum Retail Price (₹)       |
| **discountPercent**        | Discount applied               |
| **discountedSellingPrice** | Final selling price (₹)        |
| **availableQuantity**      | Units available in inventory   |
| **weightInGms**            | Product weight in grams        |
| **outOfStock**             | Stock availability indicator   |
| **quantity**               | Units per package              |

---

## **🗄️ Database Schema**

```sql
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
```

---

## **🔄 Project Workflow**

---

### **1️⃣ Data Ingestion**

* Imported the CSV dataset into **PostgreSQL**
* Resolved **UTF-8 encoding issues**
* Validated **row counts** and **schema integrity**

---

### **2️⃣ Exploratory Data Analysis (EDA)**

* Counted total records
* Reviewed sample data
* Checked for **null values**
* Identified **distinct product categories**
* Compared **in-stock vs out-of-stock** products
* Detected **duplicate product names** across SKUs

---

### **3️⃣ Data Cleaning**

* Removed records with **zero MRP** or **zero selling price**
* Converted pricing values from **paise to rupees**
* Ensured numeric consistency across columns

---

### **4️⃣ Business Analysis & Insights**

* **Top 10 products** by discount percentage
* **High-MRP products** currently out of stock
* **Potential revenue estimation** by category
* **Expensive products (MRP > ₹500)** with low discounts
* **Top 5 categories** offering highest average discounts
* **Price-per-gram analysis** for value comparison
* Product segmentation into **Low / Medium / Bulk**
* **Total inventory weight** by category

---

## **📊 Key Outcomes**

* Identified **high-discount SKUs** for promotions
* Highlighted **revenue loss opportunities** from stockouts
* Compared **pricing efficiency across categories**
* Supported **inventory optimization decisions**

---

## **🛠️ Tools Used**

* **PostgreSQL**
* **SQL**
* **pgAdmin**


