ALTER DATABASE classicmodels
SET search_path TO "classicmodels", public;

SELECT * FROM classicmodels.customers;

SELECT
	customernumber AS "Nomor Pelanggan",
	customername AS "Nama Pelanggan",
	phone AS Telepon,
	country AS Negara
FROM customers;

SELECT productCode, productName, buyPrice FROM products
WHERE buyPrice > 50
ORDER BY buyPrice DESC
LIMIT 7;

SELECT DISTINCT country AS "Negara Pelanggan" FROM customers
ORDER BY country ASC
LIMIT 5 OFFSET 5;

SELECT productname, quantityinstock, msrp FROM products
WHERE
	productline = 'Classic Cars' AND quantityInStock < 500
ORDER BY products ASC;