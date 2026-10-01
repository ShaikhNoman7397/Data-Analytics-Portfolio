# 📊 Superstore Sales Analysis — Power BI Project

🔰 **My first Power BI project** — built while learning data modeling, Power Query, and dashboard design as a beginner.

---

## 📌 Overview
A beginner-level Power BI project analyzing the Superstore sales dataset — covering data cleaning, star schema modeling, and an interactive sales dashboard.

## 🗂️ Dataset
Superstore sales data — orders, customers, products, dates, and geography.

## 🛠️ Tools Used
- Power Query (data cleaning)
- Power BI Modeling View (relationships)
- DAX (measures)
- Power BI visuals (charts, slicers)

## 🧩 Data Model
Built using a **star schema**:
- **Fact table:** Superstore (Sales, Profit, Quantity, Discount, Order Date)
- **Dimension tables:** Dimgeography, Dimproduct, Dimcustomers, Dates

**Relationship type:** One-to-Many (1:*)
- Dimension table → unique key (e.g., one row per Product)
- Fact table → repeating key (same product appears in many orders)

![Data Model](Raltionship_between_tables.png)

## 📈 Dashboard
- Year slicer (2014–2018) to filter data by time
- Stacked bar chart: **Sum of Sales by Category & Segment**

![Dashboard](Relatioshipslicer.png)

## 💡 Key Insights
- Technology is the top-selling category
- Furniture has the lowest sales
- Consumer segment leads across most categories

## 🚀 How to Use
1. Download `Superstore.pbix`
2. Open in Power BI Desktop
3. Explore the Model view and dashboard
4. Use the Year slicer to filter results

## 📂 Files
```
├── Superstore.pbix
├── Raltionship_between_tables.png
├── Relatioshipslicer.png
└── README.md
```

## 👤 Author
Beginner project — first step in learning Power BI. Feedback welcome! 🙌
