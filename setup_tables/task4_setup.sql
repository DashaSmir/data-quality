CREATE TABLE transactions ( 
    txn_id INT PRIMARY KEY, 
    customer_id INT, 
    amount DECIMAL ( 12 , 2 ), 
    currency VARCHAR ( 10 ), 
    txn_date DATE, 
    txn_type VARCHAR ( 50 ), 
    status VARCHAR ( 50 ) 
); 
INSERT INTO transactions VALUES
(1, 1001, 1500.00, 'USD', '2026-06-01', 'debit', 'completed'),
(2, 1002, -200.00, 'EUR', '2026-06-02', 'credit', 'completed'),
(3, 1003, 500.00, 'WWW', '2026-06-03', 'debit', 'pending'), 
(4, 1004, 100.00, 'RUB', '2028-05-07', 'refund', 'completed'),
(5, 1005, 0.00, 'USD', '2026-06-05', 'transfer', 'failed'),
(6, 1006, 300.00, 'CNY', '2026-06-06', 'credit', 'completed');
