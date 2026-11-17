CREATE TABLE prodi (
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	nama_prodi VARCHAR(100) NOT NULL
);

CREATE TABLE mahasiswa (
	nim VARCHAR(10) PRIMARY KEY,
	nama VARCHAR(100) NOT NULL,
	ipk NUMERIC(3, 2) DEFAULT 0.00,
	email VARCHAR(150) UNIQUE,
	id_prodi INT,
	CONSTRAINT fk_mahasiswa_prodi
		FOREIGN KEY (id_prodi)
		REFERENCES prodi(id)
);

SELECT * FROM prodi;

INSERT INTO prodi (nama_prodi)
VALUES ('Sistem Informasi');

INSERT INTO mahasiswa
VALUES
	('H071251087', 'Nur Aisyah AT', 4.00, 'aisyahnurat@gmail.com', 1),
	('H071251059', 'Karis Kabanga', 3.50, 'kariskabanga@gmail.com', 1),
	('H071251092', 'Alisya Nadhifa Raihani', 3.50, 'alisyanadhifa@gmail.com', 1),
	('H071251063', 'Puti Amelia Azzahra', 3.50, 'putiamelia@gmail.com', 1);

INSERT INTO mahasiswa (nim, nama, email,id_prodi)
VALUES
	('H071251100', 'Marina', 'marinauvwhite@gmail.com', 1),
	('H071251040', 'Implora', 'implorashield@gmail.com', 1),
	('H071251032', 'Wardah', NULL, 1);
RETURNING *;

UPDATE mahasiswa
SET ipk = 3.75
WHERE ipk = 3.50
RETURNING *;

DELETE FROM mahasiswa
WHERE email IS NULL
RETURNING *;