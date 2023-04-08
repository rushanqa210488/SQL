	  
--SQL HomeWork 2. Joins  

-- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.

select e.employee_name, sl.monthly_salaries  from employees  as e 
inner join emplyee_salary as es on e.id = es.emplyee_id 
inner join salaries as sl on sl.id = es.salary_id;
----------------------------------------------------------------------
                               
-- 2. Вывести всех работников у которых ЗП меньше 2000.

select e.employee_name, sl.monthly_salaries  from employees  as e
inner join emplyee_salary as es on e.id = es.emplyee_id 
inner join salaries as sl on sl.id = es.salary_id
where sl.monthly_salaries < 2000;
----------------------------------------------------------------------

-- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select distinct  sl.id, sl.monthly_salaries,e.id , e.employee_name  from emplyee_salary as es inner join salaries as sl on es.salary_id  = sl.id 
left  join employees as e on e.id = es.emplyee_id  
where e.employee_name is null ;  

-------------------------------------------------------------------------

-- 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select distinct  sl.id, sl.monthly_salaries,e.id , e.employee_name  from emplyee_salary as es inner join salaries as sl on es.salary_id  = sl.id 
left  join employees as e on e.id = es.emplyee_id  
where e.employee_name is null and sl.monthly_salaries < 2000;

------------------------------------------------------------------------------

-- 5. Найти всех работников кому не начислена ЗП.

select e.employee_name, sl.monthly_salaries   from emplyee_salary as es inner join salaries as sl on es.salary_id  = sl.id 
right  join employees as e on e.id = es.emplyee_id 
where sl.monthly_salaries is null;

--------------------------------------------------------------------------------

-- 6. Вывести всех работников с названиями их должности.

select e.employee_name, r.role_name  from employees e inner join roles_employees re on e.id = re.employee_id 
                          inner join roles1 r on re.role_id = r.id  

---------------------------------------------------------------------------------

-- 7. Вывести имена и должность только Java разработчиков.
                          
select e.employee_name, r.role_name  from employees e inner join roles_employees re on e.id = re.employee_id 
inner join roles1 r on re.role_id = r.id
where r.role_name like '%Java %';

----------------------------------------------------------------------------------                          

-- 8. Вывести имена и должность только Python разработчиков.

select e.employee_name, r.role_name  from employees e inner join roles_employees re on e.id = re.employee_id 
inner join roles1 r on re.role_id = r.id
where r.role_name like '%Python%';

-----------------------------------------------------------------------------------

-- 9. Вывести имена и должность всех QA инженеров.

select e.employee_name, r.role_name  from employees e inner join roles_employees re on e.id = re.employee_id 
inner join roles1 r on re.role_id = r.id
where r.role_name like '%QA%';

------------------------------------------------------------------------------------

-- 10. Вывести имена и должность ручных QA инженеров.

select e.employee_name, r.role_name  from employees e inner join roles_employees re on e.id = re.employee_id 
inner join roles1 r on re.role_id = r.id
where r.role_name like '%Manual QA%';

------------------------------------------------------------------------------------

-- 11. Вывести имена и должность автоматизаторов QA

select e.employee_name, r.role_name  from employees e inner join roles_employees re on e.id = re.employee_id 
inner join roles1 r on re.role_id = r.id
where r.role_name like '%Automation QA%';

-------------------------------------------------------------------------------------

-- 12. Вывести имена и зарплаты Junior специалистов

select e.employee_name, r.role_name, s.monthly_salaries  from employees e inner join roles_employees re on e.id = re.employee_id 
inner join roles1 r on re.role_id = r.id
inner join emplyee_salary es on es.emplyee_id = e.id 
inner join salaries s on s.id = es.salary_id 
where r.role_name like '%Junior%';

-------------------------------------------------------------------------------------

-- 13. Вывести имена и зарплаты Middle специалистов

select e.employee_name, r.role_name, s.monthly_salaries  from employees e inner join roles_employees re on e.id = re.employee_id 
inner join roles1 r on re.role_id = r.id
inner join emplyee_salary es on es.emplyee_id = e.id 
inner join salaries s on s.id = es.salary_id 
where r.role_name like '%Middle%';

-------------------------------------------------------------------------------------
-- 14. Вывести имена и зарплаты Senior специалистов

select e.employee_name, r.role_name, s.monthly_salaries  from employees e inner join roles_employees re on e.id = re.employee_id 
inner join roles1 r on re.role_id = r.id
inner join emplyee_salary es on es.emplyee_id = e.id 
inner join salaries s on s.id = es.salary_id 
where r.role_name like '%Senior%';

-------------------------------------------------------------------------------------

-- 15. Вывести зарплаты Java разработчиков

select e.employee_name, r.role_name, s.monthly_salaries  from employees e inner join roles_employees re on e.id = re.employee_id 
inner join roles1 r on re.role_id = r.id
inner join emplyee_salary es on es.emplyee_id = e.id 
inner join salaries s on s.id = es.salary_id 
where r.role_name like '%Java %';

-------------------------------------------------------------------------------------
-- 16. Вывести зарплаты Python разработчиков

select e.employee_name, r.role_name, s.monthly_salaries  from employees e inner join roles_employees re on e.id = re.employee_id 
inner join roles1 r on re.role_id = r.id
inner join emplyee_salary es on es.emplyee_id = e.id 
inner join salaries s on s.id = es.salary_id 
where r.role_name like '%Python%';

--------------------------------------------------------------------------------------

-- 17. Вывести имена и зарплаты Junior Python разработчиков

select e.employee_name, r.role_name, s.monthly_salaries  from employees e inner join roles_employees re on e.id = re.employee_id 
inner join roles1 r on re.role_id = r.id
inner join emplyee_salary es on es.emplyee_id = e.id 
inner join salaries s on s.id = es.salary_id 
where r.role_name like '% Junior Python%';

-------------------------------------------------------------------------------------
-- 18. Вывести имена и зарплаты Middle JS разработчиков

select e.employee_name, r.role_name, s.monthly_salaries  from employees e inner join roles_employees re on e.id = re.employee_id 
inner join roles1 r on re.role_id = r.id
inner join emplyee_salary es on es.emplyee_id = e.id 
inner join salaries s on s.id = es.salary_id 
where r.role_name like '%Middle JavaScript%';

-------------------------------------------------------------------------------------

-- 19. Вывести имена и зарплаты Senior Java разработчиков

select e.employee_name, r.role_name, s.monthly_salaries  from employees e inner join roles_employees re on e.id = re.employee_id 
inner join roles1 r on re.role_id = r.id
inner join emplyee_salary es on es.emplyee_id = e.id 
inner join salaries s on s.id = es.salary_id 
where r.role_name like '%Senior Java %';

------------------------------------------------------------------------------------

-- 20. Вывести зарплаты Junior QA инженеров

select  r.role_name, s.monthly_salaries  from  roles_employees re inner join roles1 r on re.role_id = r.id 
inner join emplyee_salary es on es.emplyee_id = re.employee_id 
inner join salaries s on s.id = es.salary_id 
where r.role_name like '%Junior%QA%';

------------------------------------------------------------------------------------

-- 21. Вывести среднюю зарплату всех Junior специалистов

select avg(s.monthly_salaries) as avg_salary_junior from  roles_employees re inner join roles1 r on re.role_id = r.id 
inner join emplyee_salary es on es.emplyee_id = re.employee_id 
inner join salaries s on s.id = es.salary_id 
where r.role_name like '%Junior%'

------------------------------------------------------------------------------------

-- 22. Вывести сумму зарплат JS разработчиков

select sum(s.monthly_salaries) as sum_salary_js_dev from  roles_employees re inner join roles1 r on re.role_id = r.id 
inner join emplyee_salary es on es.emplyee_id = re.employee_id 
inner join salaries s on s.id = es.salary_id 
where r.role_name like '%JavaScript%'

-------------------------------------------------------------------------------------

-- 23. Вывести минимальную ЗП QA инженеров

select min(s.monthly_salaries) as min_salary_QA from  roles_employees re inner join roles1 r on re.role_id = r.id 
inner join emplyee_salary es on es.emplyee_id = re.employee_id 
inner join salaries s on s.id = es.salary_id 
where r.role_name like '%QA%'

-------------------------------------------------------------------------------------

-- 24. Вывести максимальную ЗП QA инженеров

select max(s.monthly_salaries) as max_salary_QA from  roles_employees re inner join roles1 r on re.role_id = r.id 
inner join emplyee_salary es on es.emplyee_id = re.employee_id 
inner join salaries s on s.id = es.salary_id 
where r.role_name like '%QA%'

--------------------------------------------------------------------------------------

-- 25. Вывести количество QA инженеров

select count(r.role_name) as Total_QA_engineer from roles1 r inner join roles_employees re on r.id = re.role_id
where r.role_name like '%QA%'

--------------------------------------------------------------------------------------

-- 26. Вывести количество Middle специалистов.

select count(r.role_name) as Total_Middle_employee from roles1 r inner join roles_employees re on r.id = re.role_id
where r.role_name like '%Middle%'

----------------------------------------------------------------------------------------

-- 27. Вывести количество разработчиков

select count(r.role_name) as total_developers from roles1 r inner join roles_employees re on r.id = re.role_id 
where r.role_name like '%developer%'; 

------------------------------------------------------------------------------------------

-- 28. Вывести фонд (сумму) зарплаты разработчиков.

select sum(s.monthly_salaries) as sum_salary_developer  from roles1 r inner join roles_employees re on r.id = re.role_id 
inner join emplyee_salary es on es.emplyee_id = re.employee_id 
inner join salaries s on s.id = es.salary_id 
where r.role_name like '%developer%'; 

--------------------------------------------------------------------------------------------

-- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию

select  e.employee_name, r.role_name, s.monthly_salaries from employees e inner join roles_employees re on e.id = re.employee_id 
inner join roles1 r on r.id = re.role_id 
inner join emplyee_salary es on es.emplyee_id = e.id 
inner join salaries s on s.id = es.salary_id 
order by s.monthly_salaries;

--------------------------------------------------------------------------------------------

-- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300

select  e.employee_name, r.role_name, s.monthly_salaries from employees e inner join roles_employees re on e.id = re.employee_id 
inner join roles1 r on r.id = re.role_id 
inner join emplyee_salary es on es.emplyee_id = e.id 
inner join salaries s on s.id = es.salary_id 
where s.monthly_salaries between 1700 and 2300
order by s.monthly_salaries;

----------------------------------------------------------------------------------------------

-- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300

select  e.employee_name, r.role_name, s.monthly_salaries from employees e inner join roles_employees re on e.id = re.employee_id 
inner join roles1 r on r.id = re.role_id 
inner join emplyee_salary es on es.emplyee_id = e.id 
inner join salaries s on s.id = es.salary_id 
where s.monthly_salaries < 2300
order by s.monthly_salaries;

-------------------------------------------------------------------------------------------------

-- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000

select  e.employee_name, r.role_name, s.monthly_salaries from employees e inner join roles_employees re on e.id = re.employee_id 
inner join roles1 r on r.id = re.role_id 
inner join emplyee_salary es on es.emplyee_id = e.id 
inner join salaries s on s.id = es.salary_id 
where s.monthly_salaries in (1100, 1500, 2000)
order by s.monthly_salaries;