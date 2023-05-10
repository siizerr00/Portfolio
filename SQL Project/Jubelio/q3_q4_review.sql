create table shipping_summary (
	shipping_date date,
	seller_name varchar(255),
	buyer_name varchar(255),
	buyer_address varchar(255),
	buyer_city varchar(255),
	buyer_zipcode bigint,
	kode resi varchar (255)
);

insert into shipping_summary (
	shipping_date, seller_name, buyer_name, buyer_address, buyer_city, kode resi
)
select	s.seller_id, s.promo_id, s.purchase_date, p.promo_name, 
		(s.quantity * m.price) as total_price, 
		p.price_deduction,
		coalesce((s.quantity * m.price) - p.price_deduction, 0) as price_after_promo
from sales_table s
join marketplace_table m on s.seller_id = m.seller_id
join promo_code p on s.promo_id = p.promo_id
where s.purchase_date between '2022-06-01' and '2022-12-31';

select * from q3_q4_review