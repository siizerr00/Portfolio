WITH cte_user_detail AS (
SELECT 
	ku.id AS user_id,
	ku.name user_name,
	ku.phone user_phone,
	ku.email user_email,
	kul.address delivery_address,
	kul.id id_location
FROM ku_user_location kul
JOIN ku_user ku ON kul.user_id = ku.id),

cte_product_category AS (
    SELECT 
        p.id AS product_id,
        p.name AS product_name,
        GROUP_CONCAT(c.name SEPARATOR ', ') AS categories
    FROM ku_product p
    LEFT JOIN ku_product_category pc ON p.id = pc.product_id
    LEFT JOIN ku_category c ON pc.category_id = c.id
    GROUP BY p.id, p.name
)
SELECT id user_id, user_name, user_email, user_phone, 
product_name, categories, SUM(kod.quantity) OVER (ORDER BY kod.delivery_date, cud.user_id) AS total FROM ku_order_detail kod
JOIN cte_user_detail cud on kod.user_location_id = cud.id_location
JOIN cte_product_category cpc on kod.product_id = cpc.product_id
WHERE od.delivery_date BETWEEN '2025-09-01' AND '2025-09-30'
ORDER BY kod.delivery_date, cud.user_id;
