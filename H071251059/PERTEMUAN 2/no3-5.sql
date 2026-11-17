----- NO 3-5

---3


SELECT customernumber, customername, phone, country FROM customers;

SELECT
	customernumber AS "Nomor Pelanggan",
	customername AS "Nama Pelanggan",
	phone AS "Telepon",
	country AS "Negara"
FROM customers;

---4

SELECT productcode, productname, buyprice FROM products
WHERE buyprice > 50
ORDER BY buyprice DESC
LIMIT 7;

---5
SELECT DISTINCT country AS "Negara Pelanggan" FROM customers
ORDER BY country ASC
LIMIT 5 OFFSET 5;

-------sc

SELECT checknumber, paymentdate, amount, customernumber FROM payments
ORDER BY amount DESC
LIMIT 5;



