/*Analisis data Sales */

select * from online_sales ;

-- Menghitung jumlah quantity per-kategori dan mengurutkan data berdasarkan total_quantity
select Product_Category, sum(Quantity) as total_quantity from online_sales 
group by Product_Category 
order by total_quantity desc ;


-- Menghitung Trend Line / Tanggal Per Transaksi dari bulan mei 2019 sampai september 201i
select transaction_date, count(transaction_id) as jumlah_transaksi from online_sales
where transaction_date between '1-5-2019' and '31-09-2019'
group by transaction_date 
order by transaction_date asc ;

-- Menghitung Coupon Status berdasarkan Product_category
select Product_Category,coupon_status, count(*) as Transaction_count
from online_sales
group by  Product_Category,coupon_status ;
	

-- Total Sales Revenue
select Round(SUM(Avg_price * Quantity)) from online_sales ;

-- Impact Coupon Status 
select coupon_status, round(AVG(quantity*avg_price)) as AverageRevenue from online_sales
group by coupon_status;

-- Melihat Junlah Customer by gender

select distinct(a.transaction_id), b.gender
	from online_sales as a
	join customersdata as b 
	on a.customerID = b.customerID ;
	

-- Mengelompokan total transaksi berdasarkan gender
select b.gender,count(a.transaction_id)
	from online_sales as a
	join customersdata as b 
	on a.customerID = b.customerID 
group by b.gender;

-- Revenue Berdasarkan Location

select b.location,Round(SUM(a.Avg_price * a.Quantity)) as Total_Revenue
	from online_sales as a
	join customersdata as b 
	on a.customerID = b.customerID 
group by b.location;
	
	
	









