--  1. Создайте процедуру, которая принимает кол-во сек и формат их в кол-во дней часов. 
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
USE sem6;
DELIMITER //
DROP PROCEDURE IF EXISTS calc;
CREATE PROCEDURE IF NOT EXISTS calc(num INT)
DETERMINISTIC
BEGIN
DECLARE days, hours, minutes, seconds int;
DECLARE  sec_in_day, sec_in_hour, sec_in_minutes int;
SET sec_in_day = 60*60*24;
SET sec_in_hour = 60 * 60;
SET sec_in_minutes = 60;
SET days = num DIV sec_in_day ;
SET hours = (num -(days * sec_in_day)) DIV sec_in_hour;
SET minutes = (num - (days * sec_in_day) - (hours * sec_in_hour)) DIV sec_in_minutes ;
SET seconds = (num - (days * sec_in_day) - (hours * sec_in_hour)) % sec_in_minutes ;
SELECT concat(days, ' days', hours, ' hours ', minutes, ' minutes ', seconds, ' seconds' ) AS 'SECONDS IN DATE';
END //
DELIMITER ;

CALL calc(123456);


-- 2. Создайте функцию, которая  выводит только четные числа от 1 до 10 включительно.
-- Пример: 2,4,6,8,10 (можно сделать через шаг +  2: х = 2, х+=2)

DELIMITER //
CREATE FUNCTION even()
RETURNS VARCHAR(45)
DETERMINISTIC
BEGIN
DECLARE num INT;
DECLARE result VARCHAR(45);
SET result = ' ';
SET num = 2;
WHILE num < 11
DO
SET result = CONCAT(result, ' ', num);
SET num = num +2;
END WHILE;
RETURN result;
END //
DELIMITER ;
SELECT even();