DELETE FROM products
WHERE product_id NOT IN (
    SELECT MIN(product_id)
    FROM products
    GROUP BY sku
);
