SET search_path TO classicmodels;

--- TP6

--- 1
SELECT productcode, productname, msrp, quantityinstock, 
CASE 
	WHEN msrp < 50 AND quantityinstock > 500 THEN 'Ekonomis - Stok Tinggi'
	WHEN msrp < 50 AND quantityinstock <= 500 THEN 'Ekonomis - Stok Rendah'
	WHEN msrp > 50 AND msrp < 100 THEN 'Harga Menengah'
	WHEN msrp > 100 THEN 'Harga Premium'
END AS kategori
FROM products
ORDER BY msrp DESC;

--- 2
SELECT productCode, total_unit_terjual, jumlah_pesanan_berbeda
FROM (
    SELECT productCode,
    SUM(quantityordered) AS total_unit_terjual,
    COUNT(ordernumber) AS jumlah_pesanan_berbeda
    FROM orderdetails
    GROUP BY productCode
)
WHERE total_unit_terjual > (SELECT AVG(quantityordered) FROM orderdetails)
  AND jumlah_pesanan_berbeda > 10
ORDER BY total_unit_terjual DESC;

--- 3
SELECT productcode, productname, quantityinstock, msrp
FROM products
WHERE quantityinstock > (SELECT AVG(quantityinstock) FROM products)
AND msrp > (SELECT AVG(msrp) FROM products)
ORDER BY quantityinstock DESC;

--- 4
SELECT ordernumber, status
FROM orders
WHERE ordernumber = '10100';
BEGIN;
UPDATE orders
SET status = 'Pengiriman'
WHERE ordernumber = '10100';
SAVEPOINT status_pengiriman;
UPDATE orders
SET status = 'Batal'
WHERE ordernumber = '10100';
ROLLBACK TO SAVEPOINT status_pengiriman;
COMMIT;

--- 5
CREATE TABLE anggota (
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	nama_anggota VARCHAR(50) NOT NULL,
	kota_domisili VARCHAR(20) NOT NULL
);
SELECT * FROM anggota;

DROP TABLE buku;
CREATE TABLE buku (
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	judul_buku VARCHAR(100) NOT NULL,
	genre VARCHAR(20) NOT NULL,
	stok INT DEFAULT 1
);

CREATE TABLE peminjaman (
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	id_anggota INT,
	FOREIGN KEY (id_anggota) REFERENCES anggota(id),
	id_buku INT,
	FOREIGN KEY (id_buku) REFERENCES buku(id),
	tanggal_pinjam DATE NOT NULL,
	tanggal_kembali DATE NULL,
	denda INT DEFAULT 0
);
SELECT * FROM peminjaman;

CREATE INDEX index_genre ON buku(genre);
CREATE INDEX index_kota_domisili ON anggota(kota_domisili);

SELECT pg_indexes.tablename, indexname, indexdef 
FROM pg_indexes
WHERE schemaname = 'classicmodels' AND tablename = 'anggota';
