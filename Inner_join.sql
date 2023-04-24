--iner join
--ошибка вывода общего столбца
--алиасы

select Products.CategoryID, CategoryName, ProductName
from Products inner join Categories on Products.CategoryID = Categories.CategoryID
WHERE CategoryName = 'Seafood'

select t1.CategoryID, CategoryName, ProductName, t2.CategoryName, t1.ProductID
from Products as t1 inner join Categories as t2 on t1.CategoryID = t2.CategoryID
WHERE CategoryName = 'Seafood'


select t2.City, COUNT(*), count(distinct t2.CustomerID)
from Orders as t1 inner join Customers as t2 on t1.CustomerID = t2.CustomerID
where t2.Country = 'Germany'
GROUP BY t2.City
order BY COUNT(*) DESC



select t2.ProductName, sum(t1.UnitPrice*t1.Quantity*(1-Discount))
from [Order Details] as t1 inner join Products as t2 on t1.ProductID = t2.ProductID
where CategoryID = 1
GROUP BY t2.ProductName


--Подсчитайте кол-во заказов, оформленных сотрудником Andrew Fuller.

select  t2.FirstName, COUNT(*)
from Orders as t1 inner join Employees t2 on t1.EmployeeID = t2.EmployeeID
where t2.FirstName = 'Andrew' and t2.LastName = 'Fuller'
GROUP BY t2.FirstName 



--Посчитайте суммарную выручку (стоимость) по заказам, сделанных в 1997 году.

select sum(t1.Quantity * t1.UnitPrice * (1-Discount))
from [Order Details] as t1 inner join Orders as t2 on t1.OrderID = t2.OrderID
where OrderDate BETWEEN '1997-01-01 00:00:00.000' and '1997-12-31 00:00:00.000'


--Выведите названия категорий и кол-во продуктов, входящих в категорий.

select t2.CategoryName, COUNT(*)
from Products as t1 inner join Categories as t2 on t1.CategoryID = t2.CategoryID
GROUP BY t2.CategoryName



--inner join три и более таблицы
--Выведите имена клиентов, чьй заказы оформил сотрудник Robert King

select distinct t3.CompanyName
from Orders as t1 inner join Employees as t2 on t1.EmployeeID = t2.EmployeeID
                  inner join Customers as t3 on t1.CustomerID = t3.CustomerID
where t2.FirstName = 'Robert' and t2.LastName = 'King'            



--Выведите имя и фамилию сотрудника, который оформил/принял заказ клиента , которого зовут Fransisco Chang

select t3.ContactName, t2.FirstName, t2.LastName
from Orders as t1 inner join Employees as t2 on t1.EmployeeID = t2.EmployeeID
                  inner join Customers as t3 on t1.CustomerID = t3.CustomerID
where t3.ContactName = 'Francisco Chang'
