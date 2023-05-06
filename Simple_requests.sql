--Простые запросы.

--Какой грузоотправитель исполнил больше всего заказов?

SELECT CompanyName, COUNT(*) as Total_orders
FROM Orders as t1 INNER JOIN Shippers as t2 on t1.ShipVia = t2.Shipperid
GROUP BY CompanyName

--Как зовут клиента с наибольшим кол-вом заказов?

SELECT ContactName, COUNT(*) as Total_orders
FROM Orders t1 INNER JOIN Customers t2 on t1.CustomerID = t2.CustomerID
GROUP BY ContactName
ORDER BY Total_orders DESC

--Посчитайте количество клиентов, у которых Французский язык является официальным. Это жители страны Франции или города Женевы, который находится в Швейцарии. 

SELECT * FROM Customers
WHERE Country = 'France' or City = 'Genève'


SELECT  COUNT(*)
FROM (SELECT * FROM Customers
WHERE Country = 'France' or City = 'Genève') as t1


--Найдите клиента, который проживает в одном городе (City), но оформляет доставку в другой город (Shipcity).

--Решение №1

select ContactName, City
from Customers as t1 inner join Orders as t2 on t1.CustomerID = t2.CustomerID
EXCEPT
select ContactName, shipCity
from Customers as t1 inner join Orders as t2 on t1.CustomerID = t2.CustomerID

--Решение №2
select distinct cust.ContactName, cust.City,  ord.ShipCity
from Customers as cust inner join Orders as ord on cust.CustomerID = ord.CustomerID
where cust.City != ord.ShipCity


--Сначала выведите имена всех жителей Испании. Затем добавьте по каждому жителю количество совершенных заказов. Сколько заказов совершил Diego Roel? 
--Примечание: задачу можно решить с помощью LEFT JOIN.

SELECT ContactName, COUNT(OrderID)
FROM Customers as t1 left JOIN Orders as t2 on t1.CustomerID = t2.CustomerID
where Country = 'Spain'
GROUP BY contactName


--Посчитайте количество заказов, которые не были доставлены (столбец ShippedDate не заполнен)?

SELECT COUNT(*)
FROM orders
where shippedDate is NULL

--В какие города (ShipCity) страны (ShipCountry) Великобритания были оформлены заказы в феврале 1998 года?


select ShipCity
from Orders      
where ShipCountry = 'UK' and OrderDate BETWEEN '1998-02-01' and '1998-02-28'

--C помощью LIKE найдите клиентов с именами, которые начинаются на Mari. Сколько их?

SELECT COUNT(*)
from Customers
WHERE contactName like 'Mari%'

--C помощью функции LEN() найдите самое длинное полное имя (имя и фамилия) клиента. Из какого количества символов, включая пробел, состоит полное имя.

SELECT len(ContactName) as len
FROM customers
ORDER BY len DESC

--Найдите заказ (OrderID), стоимость которого составила 2900.

SELECT OrderID, sum(UnitPrice* Quantity*(1-Discount)) 
from [dbo].[Order Details]
GROUP BY OrderID
HAVING sum(UnitPrice* Quantity*(1-Discount))  = 2900