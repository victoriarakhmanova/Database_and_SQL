SELECT * FROM mobile_phones.phones;

SELECT ProductName, Manufacturer, Price
FROM phones
WHERE ProductCount > 2;

SELECT *
FROM phones
WHERE Manufacturer = 'Samsung';

SELECT *
FROM phones
WHERE ProductName LIKE '%iPhone%';

SELECT *
FROM phones
WHERE Manufacturer LIKE 'Samsung';

SELECT *
FROM phones
WHERE ProductName LIKE '%8%';