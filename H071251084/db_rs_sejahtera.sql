CREATE DATABASE db_rs_sejahtera

CREATE TABLE poliklinik (
	id_poli INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	nama_poli VARCHAR (50) NOT NULL UNIQUE,
	gedung VARCHAR (50) NOT NULL
);

CREATE TABLE pasien (
	id_pasien INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	nik VARCHAR (16) NOT NULL UNIQUE,
	nama_pasien VARCHAR (150) NOT NULL,
	jenis_kelamin CHAR (1) CHECK (jenis_kelamin = 'L' OR jenis_kelamin = 'P')
);

CREATE TABLE dokter (
	id_dokter INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	nama_dokter VARCHAR (150) NOT NULL,
	no_izin_praktek VARCHAR (30) UNIQUE,
	pengalaman_tahun INT CHECK (pengalaman_tahun >= 0) DEFAULT 0,
	id_poli INT,
	CONSTRAINT fk_dokter_poli
		FOREIGN KEY (id_poli)
		REFERENCES poliklinik (id_poli)
	
);

CREATE TABLE rekam_medis (
	id_rm INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	keluhan TEXT NOT NULL,
	biaya_pemeriksaan NUMERIC (8,2) DEFAULT 150000,
	id_pasien INT,
	CONSTRAINT fk_rm_pasien
		FOREIGN KEY (id_pasien)
		REFERENCES pasien (id_pasien),
	id_dokter INT,
	CONSTRAINT fk_rm_dokter
		FOREIGN KEY (id_dokter)
		REFERENCES dokter (id_dokter)
);

CREATE TABLE resep_obat (
	id_resep INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	nama_obat VARCHAR (100) NOT NULL,
	jumlah INT CHECK (jumlah > 0),
	id_rm INT,
	CONSTRAINT fk_resep_rm
		FOREIGN KEY (id_rm)
		REFERENCES rekam_medis (id_rm)
);

SELECT table_name, data_type, character_maximum_length, is_nullable
FROM information_schema.columns
WHERE table_name = 'resep_obat';


ALTER TABLE pasien
ADD COLUMN gol_darah VARCHAR(2);

ALTER TABLE resep_obat
ALTER COLUMN nama_obat TYPE TEXT;

ALTER TABLE poliklinik
DROP COLUMN gedung;


DROP TABLE resep_obat, rekam_medis;



CREATE DATABASE data_perusahaan;

CREATE TABLE departemen (
	id_departemen INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	nama_departemen VARCHAR (30) NOT NULL UNIQUE
)

CREATE TABLE karyawan (
	id_karyawan INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	nama_karyawan VARCHAR (150) NOT NULL,
	gaji_karyawan NUMERIC (10,2) CHECK (gaji_karyawan >= 4000000) DEFAULT 4000000,
	id_departemen INT,
	CONSTRAINT fk_karyawan_depart
		FOREIGN KEY (id_departemen)
		REFERENCES departemen (id_departemen)
)


