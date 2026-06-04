CREATE TABLE customers ( 
    customer_id INT PRIMARY KEY, 
    full_name VARCHAR ( 255 ), 
    email VARCHAR ( 255 ), 
    phone VARCHAR ( 50 ), 
    birth_date DATE, 
    country VARCHAR ( 100 ), 
    segment VARCHAR ( 50 )
);

INSERT INTO customers (customer_id, full_name, email, phone, birth_date, country, segment) VALUES 
(1,'Daria DSa', 'dashddasnd@gmail.com', '89921334433', '2005-06-07','France', 'retail'),
(2, 'Мария Сидорова', NULL, '79221234567', '1985-08-22', 'Russia', 'corporate'),
(3, 'John Doe', 'john@gmail.com', NULL, NULL, 'USA', NULL),
(4, NULL, 'jane@yandex.ru', '79331234567', '1995-03-10', NULL, 'vip'),
(5, 'Анна Смирнова', 'anna@esdf.com', '79441234567', '1988-12-01', 'Russia', 'retail'),
(6, 'Петр Сидоров', NULL, NULL, '1992-07-07', 'Belarus', 'corporate');
