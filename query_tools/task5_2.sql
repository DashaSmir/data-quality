with daily_sales as (
	SELECT
		product_id,
		order_date,
		SUM(quantity) AS sum_of_quantity
	FROM orders_sales
	WHERE status = 'completed'
    GROUP BY product_id, order_date	
)
SELECT 
	inventory_snapshots.product_id,
	inventory_snapshots.snapshot_date,
	inventory_snapshots.stock_qty,
	COALESCE(sum_of_quantity,0) AS daily_sales,
	inventory_snapshots.stock_qty - COALESCE(sum_of_quantity,0) AS difference_of_data
FROM inventory_snapshots
JOIN daily_sales
ON daily_sales.product_id = inventory_snapshots.product_id
AND daily_sales.order_date = inventory_snapshots.snapshot_date
WHERE (inventory_snapshots.stock_qty - COALESCE(sum_of_quantity,0) < 0)
