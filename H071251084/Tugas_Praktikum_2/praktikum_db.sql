-- CREATE TABLE mahasiswa(
-- 	nim CHAR(10)
-- );

-- constraint NOT NULL dan DEFAULT
-- CREATE TABLE mahasiswa (
-- 	nim CHAR(10) NOT NULL, 
-- 	nama VARCHAR(100) NOT NULL,
-- 	nilai INT DEFAULT 0
-- );

-- --constraint UNIQUE dan CHECK
-- CREATE TABLE mahasiswa (
-- 	nim CHAR(10) UNIQUE, 
-- 	nama VARCHAR(100) NOT NULL,
-- 	ipk NUMERIC (3,2)
-- 	CHECK (ipk >= 0.00 AND ipk <= 4.00),
-- 	umur INT CHECK (umur >= 19)
-- );


--constraint PRIMARY KEY dan FOREIGN KEY
--parents
CREATE TABLE prodi (
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	nama_prodi VARCHAR(100) NOT NULL
);

--child
CREATE TABLE mahasiswa (
	nim CHAR(10) PRIMARY KEY,
	nama VARCHAR(100) NOT NULL,
	ipk NUMERIC(3,2) DEFAULT 0.00,
	email VARCHAR(150) UNIQUE, 
	id_prodi INT,
	CONSTRAINT fk_mahasiswa_prodi
		FOREIGN KEY (id_prodi)
		REFERENCES prodi(id)
);

SELECT * FROM prodi;
SELECT * FROM mahasiswa;

SELECT constraint_name, constraint_type, table_name
FROM information_schema.table_constraints
WHERE table_schema = 'public';

SELECT Column_name,data_type,
character_maximum_length,numeric_precision,numeric_scale,
is_nullable,column_default
from information_schema.columns
WHERE table_schema = 'public' AND table_name = 'mahasiswa'
ORDER BY ordinal_position;

--alter table
ALTER TABLE prodi
ALTER COLUMN nama_prodi TYPE VARCHAR(150);

--drop kolom
ALTER TABLE mahasiswa
DROP COLUMN email;

--drop table
DROP TABLE mahasiswa;
DROP TABLE prodi;

-- INSERT INTO mahasiswa 
-- VALUES 
-- 	('H071251084', 'A.Muh.Ade Fahreza Arif', 3.95, 'adefahreza8@gmail.com', 1),
-- 	('H071251048', 'Fahreza', 3.50, NULL, 1),
-- 	('H0712510H1', 'Andika Rahman', 3.50, 'andikarahman@gmail.com', 1),
-- 	('H0712510H2', 'Achmad Tifli', 3.85, 'achmadtifli@gmail.com', 1),
-- 	('H0712510H3', 'Imam Arief Rachmat', 3.75, NULL, 1);

-- INSERT INTO mahasiswa 
-- VALUES 
-- 	('H071251084', 'A.Muh.Ade Fahreza Arif', 3.95, 'adefahreza8@gmail.com', 1),
-- 	('H071251048', 'Fahreza', 3.50, NULL, 1);



-- ini Tugas Praktikum 2
-- 1
INSERT INTO prodi (nama_prodi)
VALUES ('Sistem Informasi');

INSERT INTO prodi (nama_prodi)
VALUES 
	('Matematika'),
	('Ilmu Aktuaria');

SELECT * FROM prodi;

INSERT INTO mahasiswa (nim, nama, email, id_prodi)
VALUES 
	('H0712510H1', 'Andika Rahman', 'andikarahman@gmail.com', 1),
	('H0712510H2', 'Achmad Tifli', 'achmadtifli@gmail.com', 1),
	('H0712510H3', 'Imam Arief Rachmat', NULL, 1)
RETURNING *;

SELECT * FROM mahasiswa;
-- DELETE FROM mahasiswa;

-- 2
UPDATE mahasiswa 
SET ipk = 3.75
WHERE ipk = 3.50
RETURNING *;

DELETE FROM mahasiswa
WHERE email IS NULL
RETURNING *;