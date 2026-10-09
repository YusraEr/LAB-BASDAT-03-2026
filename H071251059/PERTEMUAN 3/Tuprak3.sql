SET search_path TO classicmodels;

--- no 1
SELECT ordernumber,UPPER(productcode) AS "Kode Produk",
    quantityordered,priceeach FROM orderdetails
WHERE (quantityordered BETWEEN 20 AND 50 OR priceeach < 30)
AND LEFT(productcode, 3) = 'S18'
ORDER BY quantityordered DESC;

--- no 2
SELECT customernumber,customername, country, 
	contactfirstname || ' ' || contactlastname AS "Nama Kontak",
	GREATEST(creditlimit, 10000)  AS "Selisih Kredit" 
FROM customers
WHERE(country='USA' OR country='Canada' OR country='France') AND creditlimit > 30000
ORDER BY creditlimit DESC;

--- no 3
SELECT productcode, productname, buyprice, msrp,
GREATEST(buyprice, msrp) AS "Harga Tertinggi",
LEAST(buyprice, msrp) AS "Harga Terendah" FROM products
WHERE productname Ilike '%car%';

--- no 4
SELECT ordernumber, orderdate,shippeddate,
EXTRACT(YEAR FROM orderdate) AS "Tahun",
EXTRACT(MONTH FROM orderdate) AS "Bulan",
	shippeddate - orderdate AS "Lama Pengiriman",
	AGE(shippeddate, orderdate) AS "Interval Pengiriman",
CURRENT_DATE AS "Tanggal Laporan", CURRENT_TIME AS "Waktu Laporan"
FROM orders; 

--- no 5
SELECT ordernumber, orderdate, shippeddate,
	orderdate + INTERVAL '10 days' AS "Estimasi Kirim",
COALESCE(shippeddate + INTERVAL '10 days') AS "Tanggal Aktual",
	shippeddate - orderdate AS "Selisih Waktu"
FROM orders
WHERE comments ILIKE '%customer%' 
AND EXTRACT (MONTH FROM orderdate) BETWEEN 10 AND 12
AND ordernumber % 2 = 1
ORDER BY orderdate DESC;


