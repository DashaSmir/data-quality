CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    status VARCHAR(50),
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    shipped_at TIMESTAMP,
    delivered_at TIMESTAMP
);

INSERT INTO orders (order_id, customer_id, status, created_at, updated_at, shipped_at, delivered_at) VALUES
(1, 101, 'shipped', '2026-05-01 10:00:00', '2026-05-20 08:00:00', '2026-05-20 08:00:00', NULL),
(2, 102, 'shipped', '2026-05-25 12:00:00', '2026-06-01 09:00:00', '2026-06-01 09:00:00', NULL),
(3, 103, 'delivered', '2026-05-15 14:00:00', '2026-05-28 16:00:00', '2026-05-20 10:00:00', '2026-05-28 16:00:00'),
(4, 104, 'shipped', '2026-05-10 11:00:00', '2026-05-10 11:00:00', '2026-05-10 11:00:00', NULL),
(5, 105, 'pending', '2026-06-02 09:00:00', '2026-06-02 09:00:00', NULL, NULL);
