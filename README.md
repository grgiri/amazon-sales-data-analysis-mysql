# 📊 Amazon Sales Data Analysis Using MySQL

![MySQL](https://img.shields.io/badge/SQL-MySQL-blue.svg)
![Project Type](https://img.shields.io/badge/Capstone-Project-success)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)

> **Comprehensive MySQL-based sales data analysis of Amazon transactions  — EDA, feature engineering, and business insights from scratch.**

---

## 📌 Project Overview

This capstone project focuses on extracting insights from Amazon sales data collected across three branches in **Mandalay**, **Yangon**, and **Naypyitaw**. The project involves building a structured SQL database, engineering features, and answering key business questions using **MySQL Workbench**.

---

## 🗃️ Dataset Description

The dataset includes **1,000 sales records** and **17 features** capturing transactional data across different branches.

| Column Name              | Description                                 | Data Type         |
|--------------------------|---------------------------------------------|-------------------|
| `invoice_id`             | Invoice of the sale                         | `VARCHAR(30)`     |
| `branch`                 | Branch code                                 | `VARCHAR(5)`      |
| `city`                   | City location of the branch                 | `VARCHAR(30)`     |
| `customer_type`          | Type of customer                            | `VARCHAR(30)`     |
| `gender`                 | Gender of the customer                      | `VARCHAR(10)`     |
| `product_line`           | Category of product sold                    | `VARCHAR(100)`    |
| `unit_price`             | Price per unit                              | `DECIMAL(10,2)`   |
| `quantity`               | Quantity sold                               | `INT`             |
| `VAT`                    | Tax on the purchase                         | `FLOAT(6,4)`      |
| `total`                  | Total transaction value                     | `DECIMAL(10,2)`   |
| `date`                   | Date of transaction                         | `DATE`            |
| `time`                   | Time of transaction                         | `TIMESTAMP`       |
| `payment_method`         | Payment method used                         | `VARCHAR`         |
| `cogs`                   | Cost of goods sold                          | `DECIMAL(10,2)`   |
| `gross_margin_percentage`| Gross margin percentage                     | `FLOAT(11,9)`     |
| `gross_income`           | Gross income                                | `DECIMAL(10,2)`   |
| `rating`                 | Customer rating                             | `FLOAT(2,1)`      |

---

## 🎯 Project Objectives

- Perform **sales analysis** to detect trends and opportunities.
- Conduct **customer analysis** to segment high-value buyers.
- Analyze **product lines** to find top performers and underperformers.
- Apply **feature engineering** for better time-based analysis.
- Answer **key business questions** using SQL only.

---

## 🔧 Methodology

### 1. 🧹 Data Wrangling
- Created SQL database and table using `NOT NULL` constraints.
- Imported data and validated integrity (no nulls).

### 2. 🧱 Feature Engineering
- `timeofday`: Categorizes sales into Morning, Afternoon, Evening.
- `dayname`: Weekday derived from `date` (Mon to Fri).
- `monthname`: Month derived from `date` (Jan to Mar).

### 3. 📊 Exploratory Data Analysis
- Conducted entirely in **MySQL Workbench** using SQL queries.

---

## 💡 Business Questions Answered

- What is the count of distinct cities and product lines?
- Which payment method is used most frequently?
- Which product line and city generate the highest revenue?
- Which branch exceeded the average number of products sold?
- What time of day and day of the week have the highest customer ratings?
- Which customer type contributes most to revenue and VAT?
- And many more...

> 💡 Over **25** targeted business questions answered using SQL.

---

## 🧰 Tools Used

- 💻 **MySQL Workbench**
- 🗄️ SQL Scripts for Database and EDA

---
