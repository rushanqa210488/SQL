--Посчитайте выручку по каждой неделе 1998-го года. Какова максимальная недельная выручка? Ответ округлите до целого числа.


SELECT DATEPART (week, OrderDate), SUM(UnitPrice*Quantity*(1-Discount))
from orders as t1 INNER JOIN [dbo].[Order Details] as t2 on t1.OrderID = t2.OrderID
WHERE OrderDate BETWEEN '1998-01-01' and '1998-12-31'
GROUP BY DATEPART (week, OrderDate)
Order BY SUM(UnitPrice*Quantity*(1-Discount)) DESC


--Посчитайте по месяцам количество заказов, которые совершили клиенты из США. Сколько заказов было сделано в декабре 1996 года?


SELECT  DATEPART  (month, OrderDate), COUNT(*) 
FROM orders as t1 INNER JOIN customers as t2 on t1.CustomerID = t2.CustomerID
WHERE orderdate like '%1996%' and Country = 'usa'
GROUP BY  DATEPART  (month, OrderDate)


--Какое максимальное количество заказов в месяц было оформлено одним сотрудником?

select DATEPART(month, OrderDate) as month, DATEPART(year, OrderDate) as year, EmployeeID, count(OrderID) total_order
from Orders
group by DATEPART(month, OrderDate),DATEPART(year, OrderDate), employeeID
order by count(OrderID) desc

--Выведите заказы, которые были оформлены в 1997 году. С помощью CASE добавьте временный столбец. 
--Если дата фактической доставки (ShippedDate) больше запланированной даты доставки (RequiredDate), то значение - "delay", а иначе - "in time".
--С помощью вложенного запроса посчитайте сколько заказов были доставлено с задержкой.


SELECT COUNT(date) as delay
FROM (SELECT ShippedDate, RequiredDate, case when ShippedDate > RequiredDate then 'delay' else 'in time' end as date
from orders
where OrderDate BETWEEN '1997-01-01' and '1997-12-31') as t3
WHERE date = 'delay'

--Выведите имена клиентов и должности. С помощью CASE добавьте временный столбец prof_group. 
--Если в должности присутствует слово Marketing, тогда значение - 'Marketing'. 
--Если в должности присутствует слово Sales, тогда значение - 'Sales'. 
--В остальных случаях значение - 'Other'. Посчитайте количество клиентов в разрезе групп профессий.


SELECT prof_group, COUNT(*)
from (SELECT contactName, CASE when contactTitle like '%Marketing%' then 'Marketing'
                         WHEN contactTitle LIKE '%Sales%' then 'Sales' else 'Other' end as prof_group 
FROM customers) as t2
GROUP BY prof_group 

--Среди всех заказов клиента Jose Pavarotti найдите заказ с наименьшей выручкой. Какова выручка заказа?


select t1.orderID, SUM(UnitPrice*Quantity*(1-Discount))
from Orders as t1 INNER JOIN customers as t2 on t1.CustomerID = t2.CustomerID
                  INNER JOIN [dbo].[Order Details] as t3 on t1.orderID = t3.orderID
where contactName = 'Jose Pavarotti'
GROUP BY t1.orderID
ORDER BY SUM(UnitPrice*Quantity*(1-Discount))


--Как зовут сотрудников, которые когда-либо оформляли заказ на клиента Martín Sommer?


select DISTINCT lastName, FirstName
from Orders as t1 INNER JOIN customers as t2 on t1.CustomerID = t2.CustomerID
                  INNER JOIN employees as t3 on t1.employeeID = t3.employeeID
WHERE contactName = 'Martín Sommer'

--Найдите сотрудника, у которого с момента оформления первого заказа до момента оформления последнего заказа прошло больше всего времени. 
--Сколько дней прошло?

SELECT  employeeID, DATEDIFF(day, min(orderdate), max(orderdate)) as diff
from orders
GROUP BY employeeID
ORDER BY diff DESC


--В каком месяце была рекордная общая выручка по продуктам с названиями, которые начинаются на Chef Anton?


SELECT DISTINCT DATEPART(month, orderdate), DATEPART(year, orderdate), SUM(t2.UnitPrice*Quantity*(1-Discount)) as max
from products as t1 INNER JOIN [dbo].[Order Details] as t2 on t1.productID = t2.productID
                    INNER JOIN orders as t3 on t2.orderID = t3.orderID
WHERE productName like '%Chef Anton%'
GROUP BY  DATEPART(month, orderdate), DATEPART(year, orderdate)
ORDER by max DESC


--Выведите 3 столбца: год, название категории и выручку. 
--Какова выручка по категории Condiments в 1996 году? Округлите ответ до целого числа.



SELECT year(orderdate), CategoryName, SUM(t1.UnitPrice*Quantity*(1-Discount)) as t5
FROM [dbo].[Order Details] t1 INNER JOIN products as t2 on t1.productID = t2.productID
                              INNER JOIN orders as t3 on t1.orderID = t3.OrderID
                              INNER JOIN categories as t4 on t2.CategoryID = t4.CategoryID
WHERE orderdate BETWEEN '1996-01-01' and '1996-12-31'  and categoryName = 'Condiments'
GROUP BY year(orderdate), CategoryName