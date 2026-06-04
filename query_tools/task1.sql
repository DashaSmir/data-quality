SELECT
	order_id,
	status,
	updated_at,
	EXTRACT (DAYS FROM (CURRENT_TIMESTAMP - updated_at)) AS days_since_update
FROM orders
WHERE status = 'shipped' and updated_at < CURRENT_TIMESTAMP - INTERVAL '7 days'
