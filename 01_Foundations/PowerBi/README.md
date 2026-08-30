 📊 Superstore Sales Analysis — Power BI Project

🔰 My first Power BI project — built while learning data modeling, Power Query, and dashboard design as a beginner.

📌 Overview

A beginner-level Power BI project analyzing the Superstore sales dataset — covering data cleaning, star schema modeling, and an interactive sales dashboard.

🗂️ Dataset

Superstore sales data — orders, customers, products, dates, and geography.

🛠️ Tools Used
Power Query (data cleaning)
Power BI Modeling View (relationships)
DAX (measures)
Power BI visuals (charts, slicers)
🧩 Data Model

Built using a star schema:

Fact table: Superstore (Sales, Profit, Quantity, Discount, Order Date)
Dimension tables: Dimgeography, Dimproduct, Dimcustomers, Dates

Relationship type: One-to-Many (1:*)

Dimension table → unique key (e.g., one row per Product)
Fact table → repeating key (same product appears in many orders)

 

📈 Dashboard
Year slicer (2014–2018) to filter data by time
Stacked bar chart: Sum of Sales by Category & Segment
 

💡 Key Insights
Technology is the top-selling category
Furniture has the lowest sales
Consumer segment leads across most categories
🚀 How to Use
Download Superstore-sales-analysis.pbix
Open in Power BI Desktop
Explore the Model view and dashboard
Use the Year slicer to filter results
📂 Files
├── Superstore-sales-analysis.pbix
├── Data-model-relationship.png
├── Visual_report_slicer.png
└── README.md
👤 Author
SHAIKH NOMAN 
Beginner project — first step in learning Power BI. Feedback welcome! 🙌
