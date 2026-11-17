---1

INSERT INTO mahasiswa (nim, nama, email, id_prodi)
VALUES
     ('H009','Andi', 'andy&@gmail.com', 1),
	 ('H007', 'Budi', NULL, 1),
	 ('H005', 'Citra', 'citraa@gmail.com', 1)
RETURNING*;

SELECT*FROM mahasiswa;


---2
UPDATE mahasiswa
SET ipk = 3.50
WHERE ipk = 0.00
RETURNING*;

UPDATE mahasiswa
SET ipk = 3.75
WHERE ipk = 3.50
RETURNING*;

DELETE FROM mahasiswa
WHERE email IS NULL
RETURNING*;

SELECT*FROM mahasiswa

