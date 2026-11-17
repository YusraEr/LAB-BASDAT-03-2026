CREATE DATABASE db_rs_sejahtera

CREATE TABLE poliklinik (
	id_poli SERIAL PRIMARY KEY,
	nama_poli VARCHAR(50) UNIQUE NOT NULL,
	gedung VARCHAR(50) NOT NULL	
);

CREATE TABLE pasien (
	id_pasien SERIAL PRIMARY KEY,
	nik VARCHAR(16) UNIQUE NOT NULL,
	nama_pasien VARCHAR(150) NOT NULL,
	jenis_kelamin CHAR(1) CHECK (jenis_kelamin IN ('L', 'P'))
);

CREATE TABLE dokter (
	id_dokter SERIAL PRIMARY KEY,
	nama_dokter VARCHAR(150) NOT NULL,
	no_izin_praktek VARCHAR(30) UNIQUE,
	pengalaman_tahun INT DEFAULT 0 CHECK (pengalaman_tahun >= 0),
	id_poli INT,
	CONSTRAINT dokter_poliklinik
		FOREIGN KEY (id_poli)
		REFERENCES poliklinik(id_poli)
);

CREATE TABLE rekam_medis (
	id_rm SERIAL PRIMARY KEY,
	keluhan TEXT NOT NULL,
	biaya_pemeriksaan NUMERIC(10, 2) DEFAULT 150000,
	id_pasien SERIAL,
	CONSTRAINT rekam_medis_pasien
		FOREIGN KEY (id_pasien)
		REFERENCES pasien(id_pasien),
	id_dokter SERIAL,
	CONSTRAINT rekam_medis_dokter
		FOREIGN KEY (id_dokter)
		REFERENCES dokter(id_dokter)
);

CREATE TABLE resep_obat (
	id_resep SERIAL PRIMARY KEY,
	nama_obat VARCHAR(100) NOT NULL,
	jumlah INT CHECK (jumlah > 0),
	id_rm SERIAL,
	CONSTRAINT resep_obat_rekam_medis
		FOREIGN KEY (id_rm)
		REFERENCES rekam_medis(id_rm)
);

ALTER TABLE pasien
ADD COLUMN gol_darah VARCHAR(2);

ALTER TABLE resep_obat
ALTER COLUMN nama_obat TYPE TEXT;

ALTER TABLE poliklinik
DROP COLUMN gedung;

DROP TABLE resep_obat;

DROP TABLE rekam_medis;

ALTER TABLE poliklinik
ADD COLUMN lantai INT NOT NULL;

ALTER TABLE poliklinik
ADD COLUMN keterangan TEXT;

ALTER TABLE poliklinik
DROP COLUMN keterangan;

-------------------------------------------------

SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public';

SELECT column_name, data_type, character_maximum_length, is_nullable
FROM information_schema.columns
WHERE table_name = 'poliklinik';

SELECT column_name, data_type, character_maximum_length, is_nullable
FROM information_schema.columns
WHERE table_name = 'pasien';

SELECT column_name, data_type, character_maximum_length, is_nullable
FROM information_schema.columns
WHERE table_name = 'dokter';

SELECT column_name, data_type, character_maximum_length, is_nullable
FROM information_schema.columns
WHERE table_name = 'rekam_medis';

SELECT column_name, data_type, character_maximum_length, is_nullable
FROM information_schema.columns
WHERE table_name = 'resep_obat';