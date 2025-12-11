select 
    kp.name,
    count(distinct order_id) unique_user,
    sum(kod.quantity) quantity,
    SUM(kp.price * kod.quantity) AS total_gmv
from ku_order_detail kod
join ku_product kp on kod.product_id = kp.id
join ku_order ko on ko.id = kod.order_id
join ku_order_detail_status kods on kod.status = kods.id
where kods.name = 'successful' and kod.delivery_date between '2025-07-01' and '2025-09-30'
group by ko.id, kp.name
order by 4,3 desc
