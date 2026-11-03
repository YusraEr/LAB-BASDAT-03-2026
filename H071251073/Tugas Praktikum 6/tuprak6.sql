set search_path to classicmodels;

---1
select productcode, productname, msrp, quantityinstock,
    case
	    when msrp < 50 and quantityinstock > 500
		    then 'Ekonomis - Stok Tinggi'
		when msrp < 50 and quantityinstock <= 500
		    then 'Ekonomis - Stok Rendah'
		when msrp between 50 and 100
		    then 'Harga Menengah'
		when msrp > 100
		    then 'Harga Premium'
	end as kategori
from products
order by msrp desc;

---2
select penjualan.productcode, penjualan.total_unit_terjual, penjualan.jumlah_pesanan
from (
    select productcode,
	       sum(quantityordered) as total_unit_terjual,
		   count(distinct ordernumber) as jumlah_pesanan
	from orderdetails
	group by productcode
) as penjualan
where penjualan.total_unit_terjual > (
     select avg(quantityordered)
	 from orderdetails
)
and penjualan.jumlah_pesanan > 10
order by penjualan.total_unit_terjual desc;

---3
select productcode, productname, quantityinstock, msrp
from products
where quantityinstock > (
      select avg(quantityinstock)
	  from products
)
and msrp > (
    select avg(msrp)
	from products
)
order by quantityinstock desc;

---4
begin;

update orders
set status = 'Pengiriman'
where ordernumber = 10100;

savepoint status_pengiriman;

update orders
set status = 'Batal'
where ordernumber = 10100;

rollback to savepoint status_pengiriman;

commit;

select ordernumber, status
from orders
where ordernumber = 10100;

---5
create table anggota (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	nama_anggota VARCHAR(50) not null,
	kota_domisili VARCHAR(20) not null
);

create table buku (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	judul_buku VARCHAR(100) not null,
	genre VARCHAR(20) not null,
	stock INTEGER DEFAULT 1
);

create table peminjaman (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	id_anggota INTEGER REFERENCES anggota(id),
	id_buku INTEGER REFERENCES buku(id),
	tanggal_pinjam DATE not null,
	tanggal_kembali DATE,
	denda INTEGER DEFAULT 0
);

create INDEX index_buku_genre
on buku(genre);

create INDEX index_anggota_kota_domisili
on anggota(kota_domisili);

