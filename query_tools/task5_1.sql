SELECT
	orders_sales.product_id,
	orders_sales.order_date,
	inventory_snapshots.stock_qty,
	SUM(orders_sales.quantity) AS sum_of_quantity
FROM orders_sales
JOIN inventory_snapshots ON
orders_sales.product_id = inventory_snapshots.product_id AND
orders_sales.order_date = inventory_snapshots.snapshot_date
WHERE orders_sales.status = 'completed'
GROUP BY orders_sales.product_id, orders_sales.order_date, inventory_snapshots.stock_qty
HAVING SUM(orders_sales.quantity) > inventory_snapshots.stock_qty;
