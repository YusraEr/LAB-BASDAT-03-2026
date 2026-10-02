-- Nomor 1

INSERT INTO mahasiswa (nim, nama, email, id_prodi)
VALUES
('H071251083', 'Faiz', NULL, 1),
('H071251082', 'Imam', 'Imam@gmail.com', 2),
('H071251081', 'Syarif', 'Syarif@gmail.com', 3);
SELECT * FROM  mahasiswa ;

-- Nomor 2
UPDATE mahasiswa
SET ipk = 3.75
WHERE ipk = 3.50;

DELETE FROM mahasiswa
WHERE email IS NULL
Returning *;

SELECT * FROM mahasiswa ;