SELECT
	sku,
	COUNT(*) AS number_of_dublicate,
	MIN(product_id) AS min_product_id,
	MAX(product_id) AS max_product_id
FROM products
GROUP BY sku
HAVING(COUNT(*) > 1);
