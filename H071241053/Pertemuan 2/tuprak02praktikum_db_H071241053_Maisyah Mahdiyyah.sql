INSERT INTO mahasiswa (nim, nama, email, id_prodi)
VALUES 
    ('H071241052', 'Nadia', 'nadkeren@gmail.com', 1),
    ('H071241012', 'Kayla', NULL, 1),
    ('H071241030', 'Zahra', 'azzmantab@gmail.com', 2)
RETURNING *;

UPDATE mahasiswa
SET ipk = 3.75
WHERE ipk = 3.50
RETURNING *;

DELETE FROM mahasiswa
WHERE email IS NULL
RETURNING *;
