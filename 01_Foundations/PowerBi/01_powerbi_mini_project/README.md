# 📊 Superstore Sales Analysis — Power BI Dashboard

🔰 **My first Power BI project** — an end-to-end journey from raw data to a fully interactive sales performance dashboard, built while learning Power Query, data modeling, DAX, and dashboard design.

![Dashboard Preview](01_powerbi_mini_project/sales-analysis-performance-dashboard.png)

---

## 📁 Table of Contents

- [Overview](#overview)
- [Dataset](#dataset)
- [Tools Used](#tools-used)
- [Project Workflow](#project-workflow)
  - [1. Data Cleaning (Power Query)](#1-data-cleaning-power-query)
  - [2. Data Modeling](#2-data-modeling)
  - [3. DAX Measures & Columns](#3-dax-measures--columns)
  - [4. Visualization & Dashboard Design](#4-visualization--dashboard-design)
  - [5. Custom Tooltips](#5-custom-tooltips)
- [Dashboard Preview](#dashboard-preview)
- [Key Insights](#key-insights)
- [How to Use](#how-to-use)
- [Project Structure](#project-structure)
- [What I Learned](#what-i-learned)
- [Author](#author)

---

## 📌 Overview

This project analyzes the **Superstore Sales dataset** — covering data cleaning, dimensional modeling, DAX-based calculations, and an interactive Power BI dashboard. It walks through the full BI development lifecycle: raw data → cleaned data → structured model → calculated measures → polished, interactive visuals.

## 🗂️ Dataset

The **Superstore Sales dataset**, containing order-level transaction data:
- Order & shipping dates
- Customer details (ID, Name, Segment)
- Product details (Category, Sub-Category, Product Name)
- Sales, Profit, Discount, Quantity
- Geographic details (City, State, Region, Country, Postal Code)

## 🛠️ Tools Used

| Tool | Purpose |
|---|---|
| **Power Query** | Cleaning and transforming raw data |
| **Power BI Modeling View** | Building the star schema & relationships |
| **DAX** | Calculated columns, measures, time intelligence |
| **Power BI Visuals** | Charts, maps, slicers, cards |
| **Report Page Tooltips** | Custom hover-detail popups |

---

## 🔄 Project Workflow

### 1. Data Cleaning (Power Query)
- Removed inconsistent/blank rows and duplicate records
- Standardized column data types (dates, numbers, text)
- Renamed columns for clarity and consistency
- Split/duplicated source data into clean dimension and fact tables

### 2. Data Modeling
Built using a **star schema** — a central fact table connected to supporting dimension tables:

**Fact Table**
- `Superstore` — Sales, Profit, Quantity, Discount, Order Date, Customer ID, Product ID

**Dimension Tables**
- `Dimgeography` — City, Country, Postal Code, Region, State
- `Dimproduct` — Category, Product ID, Product Name, Sub-Category
- `Dimcustomers` — Customer ID, Customer Name, Segment
- `Dates` — Full Date, Month Name, Quarter, Year

**Relationship type:** One-to-Many (1:*) — each dimension table holds a unique key, while the fact table holds the repeating foreign key across many transactions.

### 3. DAX Measures & Columns

**Calculated Columns**
```DAX
Profit Level = IF(Superstore[Profit] > 0, "Profitable", "Loss")
Discount Level = IF(Superstore[Discount] > 0.2, "High Discount", "Normal")
```

**Core Measures**
```DAX
Total Sales = SUM(Superstore[Sales])
Total Profit = SUM(Superstore[Profit])
Profit Margin % = DIVIDE(SUM(Superstore[Profit]), SUM(Superstore[Sales]), 0)
Total Quantity = SUM(Superstore[Quantity])
```

**Filter-based Measures (CALCULATE)**
```DAX
Technology Sales = CALCULATE(SUM(Superstore[Sales]), Dimproduct[Category] = "Technology")
```

**Time Intelligence Measures**
```DAX
Sales Last Year = CALCULATE(SUM(Superstore[Sales]), SAMEPERIODLASTYEAR(Dates[Full_date]))
Sales YoY Difference = [Total Sales] - [Sales Last Year]
Sales Growth YoY % = DIVIDE([Sales YoY Difference], [Sales Last Year], 0)
```

### 4. Visualization & Dashboard Design
- KPI Cards for **Total Sales, Total Profit, Total Quantity, Profit Margin %**
- Interactive **tile-style Year slicer** (2014–2018)
- Stacked column chart: **Sales by Category & Segment**
- Map visual: **Sales by State**
- Line chart: **Sales by Month**
- Custom color theme applied consistently across all visuals (green/tan/brown palette)

### 5. Custom Tooltips
Built dedicated **Report Page Tooltips** that appear on hover, showing deeper context without cluttering the main dashboard:
- **Category Tooltip** → Sales, Profit, Margin % by Category/Segment
- **State Tooltip** → Sales, Margin %, YoY comparison by State/Region
- **Month Tooltip** → Sales, MoM difference, MoM growth % by Month

---

## 📈 Dashboard Preview

![Main Dashboard](sales-analysis-performance-dasboard.png)

### Custom Tooltips

| Category Tooltip | State Tooltip | Month Tooltip |
|---|---|---|
| ![Category Tooltip](category-tooltip.png) | ![State Tooltip](state-tooltip.png) | ![Month Tooltip](month-tooltip.png) |

---

## 💡 Key Insights

- **Technology** is the top-performing category (₹238.17K in sales), led by the Home Office segment
- **Furniture** generates the lowest overall sales among the three categories
- **Consumer** segment consistently leads sales across all product categories
- Sales show strong seasonal peaks around **September–November**
- Overall **Profit Margin** sits at **11%** across the business

---

## 🚀 How to Use

1. Download `superstore-sales-analysis.pbix`
2. Open it in **Power BI Desktop**
3. Explore the **Model view** to see the star schema and relationships
4. Interact with the live dashboard:
   - Click a **Year tile** to filter the whole report
   - **Hover** over the chart, map, or line graph to see custom tooltips
5. Check the **Modeling tab → DAX formulas** for each measure

---

## 📂 Project Structure

```
├── superstore-sales-analysis.pbix          # Main Power BI report file
├── sales-analysis-performance-dasboard.png  # Main dashboard screenshot
├── category-tooltip.png                     # Category/Segment tooltip screenshot
├── state-tooltip.png                        # State/Region tooltip screenshot
├── month-tooltip.png                        # Month tooltip screenshot
└── README.md                                 # Project documentation
```

---

## 🎓 What I Learned

- Cleaning and transforming raw data using **Power Query**
- Designing a proper **star schema** with fact and dimension tables
- Writing **DAX** — calculated columns, measures, `CALCULATE`, iterators (`SUMX`), and time intelligence functions
- Applying **dashboard design principles** — layout, color theory, alignment, KPI placement
- Building **interactive elements** — tile slicers and custom report-page tooltips
- Understanding **Row-Level Security (RLS)** concepts for data access control
- Exporting and publishing reports to **Power BI Service**

---

## 👤 Author
SHAIKH NOMAN
Built as a hands-on beginner project to learn Power BI end-to-end — from raw data to a polished, interactive dashboard.

Feedback and suggestions are welcome! 🙌