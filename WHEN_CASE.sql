--выражение CASE

--Пример №1

SELECT ContactName, City, region, case when Region is null then 'not defined' else Region end 
FROM Customers

--Пример №2

SELECT ContactName, Country, case when Country in ('Argetina', 'Brazil') then 'South America'
                                  when Country = 'Canada' then 'North America'
                                  when country in ('Spain', 'Portugal') then 'Europe' end as continent
from Customers                    
where Country in ('Argetina', 'Brazil', 'Canada', 'Spain', 'Portugal')



SELECT ContactName, Country, case when Country in ('Argetina', 'Brazil') then 'South America'
                                  when Country = 'Canada' then 'North America'
                                  else 'Europe' end as continent
FROM Customers
WHERE Country in ('Argetina', 'Brazil', 'Canada', 'Spain', 'Portugal')



SELECT continent, count(ContactName)
FROM 
    (SELECT ContactName, Country, case when Country in ('Argetina', 'Brazil') then 'South America'
                                    when Country = 'Canada' then 'North America'
                                    else 'Europe' end as continent
    FROM Customers
    WHERE Country in ('Argetina', 'Brazil', 'Canada', 'Spain', 'Portugal')) as tale1
GROUP BY continent

--Пример №3

SELECT OrderID,
sum(UnitPrice*Quantity*(1-Discount)) as Revenue, 
case when sum(UnitPrice*Quantity*(1-Discount)) < 1000 then '0-999'
         when sum(UnitPrice*Quantity*(1-Discount)) < 5000 then '1000-4999'
         else '5000 and >' end as revenue_group
FROM [Order Details] 
GROUP BY OrderID

select orderid, 
sum(UnitPrice*Quantity*(1-Discount)) as Revenue, 
case when sum(UnitPrice*Quantity*(1-Discount)) between 1 and 999 then '0-999'
         when sum(UnitPrice*Quantity*(1-Discount)) between 1000 and 4999 then '1000-4999'
         when sum(UnitPrice*Quantity*(1-Discount)) >=5000 then '5000 and >' end as revenue_group
from [Order Details] 
group by orderid




--Выведите имена сотрудников, страны и регионы. 
--С помощью выражения CASE добавьте новый временный столбец Region и замените пустые значения NULL на значения 'not defined'. 
--У скольких сотрудников регион не определен?

select FirstName, Country, case when Region  is NULL THEN 'not defined' else Region end as REGION
FROM Employees

SELECT COUNT(*) as NOT_DEF
FROM (select FirstName, Country, case when Region  is NULL THEN 'not defined' else Region end as REGION
FROM Employees ) as t1
WHERE REGION = 'not defined'

--Выведите имена, фамилии сотрудников и обращения (TitleOfCourtesy). 
--Далее с помощью выражения CASE добавьте временный столбец Gender. 
--Если обращение Ms. или Mrs., то gender - 'women', а если обращение Mr. или Dr., то gender - 'men'. 
--Затем с помощью вложенного запроса посчитайте кол-во мужчин и женщин. Сколько сотрудников женского пола?

SELECT FirstName, LastName, TitleOfCourtesy, case when TitleOfCourtesy in ('Ms.', 'Mrs.') THEN 'Women'
                                                  when TitleOfCourtesy in ('Mr.', 'Dr.') THEN 'Men' end as Gender
FROM Employees

SELECT COUNT(*) as GEN_WOMEN
FROM (SELECT FirstName, LastName, TitleOfCourtesy, case when TitleOfCourtesy in ('Ms.', 'Mrs.') THEN 'Women'
                                                  when TitleOfCourtesy in ('Mr.', 'Dr.') THEN 'Men' end as Gender
FROM Employees) as t2
WHERE Gender = 'Women'

--Выведите наименования продуктов и их цену. Далее с помощью выражения CASE добавьте столбец с сегментацией по цене. Если цена от 0 до 9.99,  то это сегмент '0-9.99'. 
--Если цена от 10 до 29.99, то это сегмент '10-29.99'. Если цена от 30 до 49.99, то это сегмент '30-49.99'. Если цена от 50, то это сегмент '50+'. 
--Затем с помощью вложенного запроса посчитайте кол-во товаров в разрезе каждого сегмента. Сколько товаров в сегменте '50+'?

SELECT ProductName, UnitPrice, CASE WHEN UnitPrice BETWEEN 0 and 9.99 THEN '0-9.99'
                                    WHEN UnitPrice BETWEEN 10 and 29.99 THEN '10-29.99'
                                    WHEN UnitPrice BETWEEN 30 and 49.99 THEN '30-49.99'
                                    WHEN UnitPrice > 50 THEN '50+' end as PRICE
FROM Products

SELECT PRICE, COUNT(*)
FROM (SELECT ProductName, UnitPrice, CASE WHEN UnitPrice BETWEEN 0 and 9.99 THEN '0-9.99'
                                    WHEN UnitPrice BETWEEN 10 and 29.99 THEN '10-29.99'
                                    WHEN UnitPrice BETWEEN 30 and 49.99 THEN '30-49.99'
                                    WHEN UnitPrice > 50 THEN '50+' end as PRICE
FROM Products) as t3
GROUP BY PRICE

