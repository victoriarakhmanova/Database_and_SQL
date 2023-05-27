USE mobile_phones;

-- 1. Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными
DROP TABLE IF EXISTS sales;
CREATE TABLE IF NOT EXISTS sales
(id INT PRIMARY KEY AUTO_INCREMENT,
order_date DATE,
count_product INT);

INSERT sales (id, order_date, count_product)
VALUES 
	(1, '2022-01-01', 156),
    (2, '2022-01-02', 180),
    (3, '2022-01-03', 21),
    (4, '2022-01-04', 124),
    (5, '2022-01-05', 341);


SELECT * FROM sales;


-- 2. Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300 (функция IF).

SELECT 
id AS 'id заказа',
IF(count_product < 100, 'Маленький заказ',
	IF(count_product BETWEEN 100 AND 300, 'Средний заказ','Большой заказ'))
AS 'Тип заказа'
FROM sales;



-- 3. Создайте таблицу “orders”, заполните ее значениями.
-- Покажите “полный” статус заказа, используя оператор CASE

DROP TABLE IF EXISTS orders;
CREATE TABLE IF NOT EXISTS orders
(id INT PRIMARY KEY AUTO_INCREMENT,
employee_id VARCHAR(20),
amount FLOAT,
order_status VARCHAR(20));



    
    
INSERT orders (id, employee_id, amount, order_status)
VALUES
(1, 'e03', 15.00, 'OPEN'),
(2, 'e01', 25.50, 'OPEN'),
(3, 'e05', 100.70, 'CLOSED'),
(4, 'e02', 22.18, 'OPEN'),
(5, 'e04', 9.50, 'CANCELLED');

-- В данном задании нужно выбрать все заказы (я так поняла, что это номер id)
SELECT id, 
CASE
	WHEN order_status = 'OPEN' THEN 'Order is in open state'
    WHEN order_status = 'CLOSED' THEN 'Order is closed'
    WHEN order_status = 'CANCELLED' THEN 'Order is cancelled'
END AS full_order_status
FROM orders;

