use jubelio

create table shipping_summary (
	shipping_id int,
	shipping_date date,
	seller_name varchar(255),
	buyer_name varchar(255),
	buyer_address varchar(255),
	buyer_city varchar(255),
	buyer_zipcode bigint,
	kode_resi varchar (255)
);

insert into shipping_summary (shipping_id, shipping_date, seller_name, buyer_name, buyer_address, buyer_city, buyer_zipcode, kode_resi
)
SELECT h.shipping_id, h.shipping_date, s.seller_name, b.buyer_name, b.address AS buyer_address, b.city AS buyer_city, b.zipcode AS buyer_zipcode, 
       CONCAT(h.shipping_id, '-', FORMAT(h.purchase_date, 'yyyyMMdd'), '-', FORMAT(h.shipping_date, 'yyyyMMdd'), '-', b.buyer_id, '-', s.seller_id) AS kode_resi
FROM shipping_table h
JOIN seller_table s ON h.seller_id = s.seller_id
JOIN buyer_table b ON h.buyer_id = b.buyer_id

;


