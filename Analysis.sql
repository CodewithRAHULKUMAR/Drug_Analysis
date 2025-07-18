SET SQL_SAFE_UPDATES = 0;
create database drugs;
use drugs;
select * from drugs_analysis;
delete from drugs_analysis;

select * from drugs_analysis;

create view Total_Store_Sales as
SELECT Store_Code, Location, SUM(Total_Sales) AS Total_Sales
FROM drugs_analysis
GROUP BY Store_Code, Location
order by Total_Sales DESC;
select * from Total_Store_Sales;

create view Drugs_Sales as
SELECT Drugs, Round(SUM(Total_Sales),2) AS Total_Sales
FROM drugs_analysis
GROUP BY Drugs
ORDER BY Total_Sales DESC
LIMIT 5;
select * from Drugs_Sales;

create view Subgroup_Qty as
SELECT Subgroup, ROUND(SUM(Total_Qty), 2) AS Total_Quantity
FROM drugs_analysis
GROUP BY Subgroup
ORDER BY Total_Quantity DESC;
select * from Subgroup_Qty;

create view Zero_Sale as
SELECT Store_Code,Location,Drugs,Total_Sales
FROM drugs_analysis
WHERE Total_Sales = 0;
select * from Zero_Sale;

create view Receipt_VS_Return as 
SELECT Store_Code, Round(SUM(CAST(Receipt_Value AS FLOAT)),2) AS Total_Receipt_Value,
Round(SUM(CAST(Rtv_Value AS FLOAT)),2) AS Total_Return_Value
FROM drugs_analysis
GROUP BY Store_Code
ORDER BY Total_Receipt_Value DESC, Total_Return_Value;
select * from Receipt_VS_Return;

create view Total_Returns as
SELECT Store_Code, Round(SUM(CAST(Rtv_Value AS FLOAT)),2) AS Total_Returns
FROM drugs_analysis
GROUP BY Store_Code
ORDER BY Total_Returns DESC
LIMIT 5;
select * from Total_Returns;

create view Store_Efficiency as 
SELECT Store_Code, COUNT(DISTINCT Drugs) AS Unique_Products,
Round(SUM(Total_Sales) / COUNT(DISTINCT Drugs),2) AS Sales_Per_Product
FROM drugs_analysis
GROUP BY Store_Code
ORDER BY Sales_Per_Product desc;
select* from Store_Efficiency;

create view Monthly_Saless as
SELECT Month, SUM(Total_Sales) AS Total_Sales
FROM drugs_analysis
GROUP BY Month
ORDER BY Month DESC;
select * from Monthly_Saless;

create view tot_returns as 
SELECT Month, Round(SUM(CAST(Rtv_Value AS FLOAT)),2) AS Total_Returns
FROM drugs_analysis
GROUP BY Month
ORDER BY Total_Returns DESC;
select * from tot_returns;

