select ku.id user_id, 
ku.name user_name, 
ko.id order_id, 
kod.delivery_date, 
kp.name product_name, 
kp.price, 
sum(quantity) quantity
from ku_order_detail kod
join ku_product kp on kod.product_id = kp.id
join ku_order ko on ko.id = kod.order_id
join ku_user ku on ku.id = ko.user_id
where kod.status = 2 and
kod.delivery_date between date(ku.created_at) and DATE_ADD(DATE(ku.created_at), INTERVAL 1 YEAR)
group by 1,2,3,4,5,6
