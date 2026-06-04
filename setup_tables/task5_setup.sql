CREATE TABLE orders_sales ( 
    order_id INT PRIMARY KEY, 
    product_id INT, 
    quantity INT,
    status VARCHAR ( 50 ),  
    order_date DATE 
);
CREATE TABLE inventory_snapshots ( 
    snapshot_id INT PRIMARY KEY, 
    product_id INT, 
    snapshot_date DATE, 
    stock_qty INT 
);


INSERT INTO orders_sales VALUES
(1, 101, 5, 'completed', '2026-06-01'),
(2, 102, 3, 'completed', '2026-06-01'),
(3, 101, 2, 'completed', '2026-06-01'),
(4, 103, 1, 'pending',   '2026-06-01'),
(5, 101, 1, 'cancelled', '2026-06-01'),
(6, 102, 2, 'completed', '2026-06-02'),
(7, 101, 10, 'completed', '2026-06-03');


INSERT INTO inventory_snapshots VALUES
(1, 101, '2026-06-01', 6), 
(2, 102, '2026-06-01', 5), 
(3, 103, '2026-06-01', 10), 
(4, 101, '2026-06-02', 8),  
(5, 102, '2026-06-02', 1), 
(6, 101, '2026-06-03', 5);
