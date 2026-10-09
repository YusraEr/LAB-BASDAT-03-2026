
-- Nomor 3
SELECT
    customernumber AS "Nomor Pelanggan",
    customername AS "Nama Pelanggan",
    phone AS "Telepon",
    country AS "Negara"
FROM classicmodels.customers;

-- Nomor 4
SELECT
    productCode,
    productName,
    buyPrice
FROM classicmodels.products
WHERE buyPrice > 50
ORDER BY buyPrice DESC
LIMIT 7;

-- Nomor 5
SELECT DISTINCT
    country AS "Negara Pelanggan"
FROM classicmodels.customers
ORDER BY country
OFFSET 5
LIMIT 5;

--soal tambahan
select checknumber, paymentdate, amount, customernumber
from classicmodels.payments
order by amount desc
limit 5;