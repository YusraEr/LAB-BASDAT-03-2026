CREATE TABLE prodi (
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
	nama_prodi VARCHAR(100) NOT NULL
);


CREATE TABLE mahasiswa (
	nim VARCHAR(15) PRIMARY KEY,
	nama VARCHAR(100) NOT NULL,
	ipk NUMERIC(3,2) DEFAULT 0.00,
	email VARCHAR(150) UNIQUE,
	id_prodi INT,
	CONSTRAINT fk_mahasiswa_prodi
		FOREIGN KEY (id_prodi)
		REFERENCES prodi(id)
);

INSERT INTO prodi (nama_prodi)
VALUES ('Sistem Informasi');

SELECT * FROM prodi;

INSERT INTO mahasiswa (nim, nama, ipk, email, id_prodi)
VALUES 
	('H011', 'aaaaa', 3.90, 'aaaaaa@gmail.com', 1),
	('H021', 'iiiii', 3.50, 'iiiiii@gmail.com', 1),
	('H031', 'uuuuu', 3.50, 'uuuuuu@gmail.com', 1),
	('H041', 'eeeee', 3.85, NULL, 1);

SELECT * FROM mahasiswa;
------- 1 & 2

INSERT INTO mahasiswa (nim, nama, email, id_prodi) 
VALUES
	('MHS0053', 'Karis Kabanga', 'karissssSS@gmail.com', 1),
	('MHS0086', 'Kesia Karamoy', 'kesiaaaaaa@gmail.com', 1),
	('MHS0093', 'Meindar Satria', NULL, 1)
RETURNING *;
SELECT * FROM mahasiswa;

UPDATE mahasiswa
SET ipk = 3.75
WHERE ipk = 3.50

DELETE FROM mahasiswa
WHERE email IS NULL
RETURNING *;



