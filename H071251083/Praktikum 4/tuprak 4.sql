SET search_path TO classicmodels, public;
--1
SELECT 
	customernumber,
	sum (amount) AS "total setoran",
	count(distinct checknumber) AS "Jumlah transaksi",
	max (amount) AS "Setoran terbesar"
FROM payments
GROUP BY customernumber
HAVING (count (distinct checknumber))> 4 and avg (amount) >20000;

--2
SELECT customernumber AS "nomor pelanggan",
	sum (amount) AS "total setoran"
FROM payments
GROUP by customernumber
having (sum (amount)) > 80000
order by "total setoran" desc;

--3
select productline as "kategori barang",
	count (productcode) AS "Jumlah produk",
	round(avg(msrp), 2) AS "rata-rata harga jual",
	string_agg(productname, ', ' order by productname) as "daftar produk"
from products
group by productline
having count(productcode) > 10;

--4 
SELECT DISTINCT reportsto AS "Pegawai menengah"
FROM employees
WHERE reportsto is not null
EXCEPT
SELECT employeenumber
FROM employees
WHERE jobtitle like '%VP%' or jobtitle like '%President%';

--5
SELECT productcode as "kode barang",
	sum (quantityordered) as "total terjual",
	round (avg (priceeach), 2)
FROM orderdetails
WHERE priceeach > 100
group by productcode
having sum(quantityordered) > 50
order by sum(quantityordered) desc;

--6
select productcode as "kode barang",
	sum (quantityordered) as "Total pesanan",
	sum (quantityordered * priceeach) as "pendapatan kotor",
	round(avg(priceeach), 2) as"rata-rata harga",
	max (priceeach) - min (priceeach) as "selisih harga"
from orderdetails
where quantityordered > 20
group by productcode
having sum (quantityordered * priceeach) > 50000
order by sum (quantityordered * priceeach) desc;

--7
SELECT customerNumber FROM customers
WHERE creditLimit > 80000
INTERSECT
SELECT customerNumber FROM orders
WHERE status like '$Cancelled$' status like '%On Hold%'
EXCEPT
SELECT customerNumber FROM payments
GROUP BY customerNumber
HAVING SUM(amount) > 100000;




	
	
	