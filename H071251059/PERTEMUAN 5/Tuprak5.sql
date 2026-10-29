SET search_path TO classicmodels;

--- TP5

--- 1
SELECT c.contactfirstname, c.customername, o.city, 
	e.firstname || ' ' || e.lastname AS sales_rep_name
FROM customers c
JOIN employees e
	ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN offices o
	ON o.officeCode = e.officeCode
WHERE c.contactfirstname ILIKE 'A%' AND o.city != 'NYC'
ORDER BY c.customername ASC;

--- 2
SELECT c.customername, 
	SUM(p.amount) AS total_payment, 
	MAX(p.amount) AS max_single_payment
FROM customers c
JOIN payments p
ON p.customernumber = c.customernumber
GROUP BY c.customernumber, c.customername
HAVING SUM(p.amount) > 50000
ORDER BY total_payment DESC;

--- 3
SELECT c.customername, 
	COUNT(DISTINCT o.ordernumber) AS total_order,
	ROUND(AVG(od.quantityordered), 2) AS avg_quantity_per_order
FROM customers c
JOIN orders o
ON o.customernumber = c.customernumber
JOIN orderdetails od
ON od.ordernumber = o.ordernumber
GROUP BY c.customername
HAVING COUNT(o.ordernumber) > 3
AND AVG(od.quantityordered) > 35
ORDER BY total_order DESC, avg_quantity_per_order DESC;

--- 4
SELECT p.productline,
	SUM(od.quantityordered) AS total_terjual, 
	ROUND(AVG(od.priceeach),2) AS rata_rata_harga, 
	ROUND(AVG((p.msrp - od.priceeach) / p.msrp * 100),2) AS avg_discount_percentage
FROM products p
JOIN orderdetails od
ON od.productcode = p.productcode
GROUP BY p.productline
HAVING SUM(od.quantityordered) > 3000 
AND AVG(priceeach) > 80
ORDER BY total_terjual DESC;

--- 5
SELECT c.customername, 
	SUM(od.quantityordered * od.priceeach) AS total_transaksi,
	COUNT(DISTINCT o.ordernumber) AS total_shipped_orders,
	ROUND(SUM(od.quantityordered * od.priceeach)/ COUNT(DISTINCT O.ordernumber),2) AS avg_transaction_per_order
FROM customers c
JOIN orders o 
ON o.customernumber = c.customernumber
JOIN orderdetails od
ON od.ordernumber = o.ordernumber
WHERE o.status = 'Shipped'
GROUP BY c.customername
HAVING COUNT(DISTINCT EXTRACT(YEAR FROM o.orderdate)) > 1
ORDER BY total_transaksi DESC
LIMIT 5;

--- 6
SELECT c.customerName,
	c.city AS customer_city,
	ofc.city AS office_city,
	SUM(od.quantityOrdered) AS total_unit_terjual,
	ROUND(AVG(od.quantityOrdered * od.priceEach), 2) AS avg_nilai_per_order
FROM customers c
JOIN employees e
ON c.salesRepEmployeeNumber = e.employeeNumber
JOIN offices ofc
ON e.officeCode = ofc.officeCode
JOIN orders o
ON c.customerNumber = o.customerNumber
JOIN orderdetails od
ON o.orderNumber = od.orderNumber
WHERE ofc.territory = 'EMEA'
GROUP BY c.customerNumber, c.customerName, c.city, ofc.city
HAVING COUNT(DISTINCT EXTRACT(YEAR FROM o.orderDate)) > 2
AND SUM(od.quantityOrdered) > 1000
AND (SUM(od.quantityOrdered * od.priceEach)/ COUNT(o.orderNumber)) > 10000
ORDER BY avg_nilai_per_order DESC;
