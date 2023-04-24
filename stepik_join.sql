JOIN

SELECT COUNT(customerid)
FROM Customers

SELECT * FROM Customers

select COUNT(distinct CustomerID)
from Orders

SELECT * from Orders

select t1.CustomerID, t1.ContactName, t2.OrderID, t2.CustomerID from Customers as t1 LEFT JOIN Orders as t2 on t1.CustomerID = t2.CustomerID
order by t2.OrderID

SELECT COUNT(distinct t1.CustomerID)
FROM Customers as t1 left join Orders as t2 on t1.CustomerID = t2.CustomerID
WHERE Orderid is null 

select  ContactName, count(distinct t2.OrderID)
from Customers as t1 LEFT JOIN Orders as t2 on t1.CustomerID = t2.CustomerID
GROUP BY ContactName
ORDER BY COUNT(distinct t2.OrderID)

select ContactName, City, OrderID from Customers as t1 left join Orders as t2 on t1.CustomerID = t2.CustomerID
WHERE t2.OrderID is NULL 


SELECT * from Categories cross JOIN Products

--union  union all
select Title
FROM Employees
UNION ALL
SELECT ContactTitle
From Customers

--exept intersest

select title
from Employees
EXCEPT
SELECT contactTitle
FROM Customers

select title
from Employees
INTERSECT
select contactTitle
from Customers

SELECT Country, title
FROM Employees
UNION
SELECT Country, ContactTitle
from Customers

SELECT Country, title
FROM Employees
UNION ALL
SELECT Country, ContactTitle
from Customers

select City
from Employees
UNION
SELECT City
FROM Customers

--Подзапросы или вложенные запросы

--пример №1

SELECT OrderDate, COUNT(*) as cnt
from Orders
GROUP BY OrderDate
HAVING COUNT(*)>2

SELECT COUNT(*)
FROM
    (SELECT OrderDate, COUNT(*) as cnt
    from Orders
    GROUP BY OrderDate
    HAVING COUNT(*)>2) as table1

--пример №2

SELECT CustomerID
from Customers
WHERE Country = 'USA'

select *
FROM Orders 
WHERE CustomerID in ('VINET', 'TOMSP', 'HANAR')

SELECT *
FROM Orders
WHERE CustomerID IN (SELECT CustomerID
                    FROM Customers
                    WHERE Country = 'USA')

SELECT *
FROM Orders
WHERE SHIPCountry = 'USA'

--пример №3
--Посчитать выручку по каждой стране.

SELECT Country, sum(UnitPrice * Quantity * (1-Discount))
from [Order Details] as t1 inner join Orders as t2 on t1.OrderID = t2.OrderID
                            INNER JOIN Customers as t3 on t2.CustomerID = t3.CustomerID
GROUP BY Country

--Посчитать суммарную выручку по всем странам.

SELECT sum(UnitPrice * Quantity * (1-Discount))
from [Order Details]

--Посчитать долю выручки по каждой стране от общей доли выручки.

SELECT Country, sum(UnitPrice * Quantity * (1-Discount)),
sum(UnitPrice * Quantity * (1-Discount)) / (select sum(UnitPrice * Quantity * (1-Discount))
                                           FROM [Order Details]) * 100
from [Order Details] as t1 inner JOIN Orders as t2 on t1.OrderID =t2.OrderID
                           INNER JOIN Customers as t3 on t2.CustomerID = t3.CustomerID
GROUP BY Country
ORDER BY sum(UnitPrice * Quantity * (1-Discount)) / (select sum(UnitPrice * Quantity * (1-Discount))
                                                    FROM [Order Details]) * 100 DESC


--Задача №1
--Выведите страны и кол-во клиентов, проживающих в этих странах. Оставьте только страны с количеством клиентов более одного.
--Затем, используя вложенный запрос, посчитайте количество оставшихся стран. 

SELECT Country, COUNT(*)
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 1 

SELECT COUNT(*) 
FROM (SELECT Country, COUNT(CustomerID) as total_country
      FROM Customers
      GROUP BY Country
      HAVING COUNT(CustomerID) > 1) as table2

--Задача №2
--Выведите ID клиентов и количество заказов, совершенных клиентами. Оставте только клиентов с количеством заказов больше 10.
--Затем используя вложенный запрос, посчитайте количество оставшихся клиентов. 

select CustomerID, COUNT(*)
from Orders
GROUP by CustomerID
HAVING COUNT(ShipVia) > 10

SELECT COUNT(*)
FROM (select CustomerID, COUNT(*) as tot_ord
from Orders
GROUP by CustomerID
HAVING COUNT(ShipVia) > 10) as quan_orders

select * FROM Categories
select * FROM Orders
select * from [Order Details]
select * FROM Products

--Задача №3
--Выведите товары, относящиеся к Category = 1/
--Используйте этот SQL-запрос как подзапрос, для того что бы посчитать общую вырочку по товаром, относящимся к Category = 1.

SELECT *
from Products
where CategoryID = 1

select sum(Quantity * UnitPrice * (1-Discount))
FROM [Order Details]
where ProductID in (SELECT ProductID
                    from Products
                    where CategoryID = 1)
 
 --Посчитайте количество заказов, в которых присутствует товар Chocolade.


--Решение с использованием подзапросов.

 SELECT ProductID, COUNT(*)
 FROM [Order Details]
 Where ProductID in (SELECT ProductID
 FROM Products
 WHERE ProductName LIKE 'Chocolade')
 GROUP BY ProductID

--Решение с использованием inner join.

 SELECT  COUNT(DISTINCT OrderID) from Products as t1 INNER JOIN [Order Details] as t2 on t1.ProductID = t2.ProductID
 where ProductName = 'Chocolade'
 

 --Посчитайте общую выручку, которую принесли товары категории Confections. Ответ округлите до целого числа.

--Решение используя join и подзапросы.
 SELECT sum(Quantity * UnitPrice * (1-Discount))
 FROM [Order Details]
 WHERE ProductID in ( SELECT ProductID from Categories as t1 INNER JOIN Products as t2 on t1.CategoryID = t2.CategoryID
 where CategoryName = 'Confections')

--Решение используя join.

 SELECT sum(Quantity*t1.UnitPrice*(1-Discount))
 FROM [Order Details] as t1 INNER JOIN Products as t2 on t1.ProductID = t2.ProductID
                                     INNER JOIN Categories as t3 on t2.CategoryID = t3.CategoryID
 WHERE CategoryName = 'Confections'
 
 --Посчитайте выручку по каждой категории. Какая категория принесла самую высокую выручку?
 
 SELECT categoryname, sum(t1.Quantity * t1.UnitPrice * (1-Discount))
 FROM [Order Details] as t1 INNER JOIN Products as t2 on t1.ProductID = t2.ProductID
                            INNER JOIN Categories as t3 on t2.CategoryID = t3.CategoryID
 GROUP BY CategoryName
 ORDER BY sum(t1.Quantity * t1.UnitPrice * (1-Discount)) DESC

 --Клиент Simon Crowther утверждает, что оформил заказ 29 апреля 1998 года, но заказ пришел неполный - часть товаров отсутствует. 
 --Найдите всю информацию по сотруднику, который оформил этот заказ, чтобы связаться с ним. Как зовут этого сотрудника?

SELECT t3.FirstName, t3.LastName from Customers as t1 INNER JOIN Orders as t2 on t1.CustomerID = t2.CustomerID
                              INNER JOIN Employees as t3 on t2.EmployeeID = t3.EmployeeID
WHERE ContactName = 'Simon Crowther' and OrderDate = '1998-04-29'

--Выведите города доставки (Shipcity) и кол-во заказов, которые были оформлены в эти города в 1997 году. Оставьте только города с количеством заказов больше 5. 
--Затем с помощью вложенного запроса посчитайте количество найденных городов.

SELECT* FROM Categories
SELECT* FROM Orders

SELECT ShipCity, COUNT(*) FROM Orders 
WHERE OrderDate BETWEEN '1997-01-01' and '1997-12-31'
GROUP BY ShipCity
HAVING COUNT(*) > 5

SELECT COUNT(*)
FROM  (SELECT ShipCity, COUNT(*) as t1 FROM Orders 
WHERE OrderDate BETWEEN '1997-01-01' and '1997-12-31'
GROUP BY ShipCity
HAVING COUNT(*) > 5) as t2