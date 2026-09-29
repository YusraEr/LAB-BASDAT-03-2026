-- SELECT * FROM classicmodels.customers;

SET search_path TO classicmodels , public;

-- 3
SELECT
	customernumber AS "Nomor Pelanggan",
	customername AS "Nama Pelanggan",
	phone AS "Telepon",
	country AS "Negara"
FROM customers;

-- 4
SELECT productcode, productname, buyprice FROM products
WHERE buyprice > 50
ORDER BY buyprice DESC
LIMIT 7;

-- 5
SELECT DISTINCT country AS "Negara Pelanggan" FROM customers
ORDER BY country ASC
LIMIT 5
OFFSET 5;

-- ini study case nya
SELECT ordernumber, orderdate, customernumber FROM orders
WHERE status = 'Cancelled'
ORDER BY ordernumber DESC;

-- SELECT DISTINCT country AS "Negara Pelanggan" FROM classicmodels.customers
-- ORDER BY country ASC;