 -- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
 CREATE TABLE real_employee AS
 SELECT e.employee_name, s.monthly_salary FROM employee_salary es
 FULL JOIN salary s ON es.salary_id = s.id
 FULL JOIN  employees e ON es.employee_id = e.id;

 SELECT * FROM real_employee re 
 WHERE employee_name IS NOT NULL
 AND monthly_salary IS NOT NULL;

 --2. Вывести всех работников у которых ЗП меньше 2000.
 SELECT * FROM  real_employee re WHERE monthly_salary < 2000;

 --3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
 SELECT * FROM real_employee re 
 WHERE employee_name IS NULL;

 --4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но непонятно кто её получает.)
 SELECT * FROM real_employee re 
 WHERE employee_name IS NULL AND monthly_salary < 2000;

 --5. Найти всех работников кому не начислена ЗП.
 SELECT * FROM real_employee re 
 WHERE monthly_salary IS NULL;

 --6. Вывести всех работников с названиями их должности.
--SELECT * FROM roles_employee re;
SELECT e.employee_name, r.role FROM roles_employee re
JOIN employees e ON re.employee_id = e.id
JOIN roles r ON re.role_id = r.id;

 --7. Вывести имена и должность только Java разработчиков.
 SELECT e.employee_name, r.role FROM roles_employee re
 JOIN employees e ON re.employee_id = e.id
 JOIN roles r ON re.role_id = r.id
 WHERE r.role LIKE '%Java%';

 --8. Вывести имена и должность только Python разработчиков.
 SELECT e.employee_name, r.role FROM roles_employee re
 JOIN employees e ON re.employee_id = e.id
 JOIN roles r ON re.role_id = r.id
 WHERE r.role LIKE '%Python%';

 --9. Вывести имена и должность всех QA инженеров.
 SELECT e.employee_name, r.role FROM employees e
 JOIN roles_employee re ON e.id = re.employee_id 
 JOIN roles r ON r.id = re.role_id
 WHERE r.role LIKE '%QA%';

 --10. Вывести имена и должность ручных QA инженеров.
 SELECT e.employee_name, r.role FROM employees e
 JOIN roles_employee re ON e.id = re.employee_id 
 JOIN roles r ON r.id = re.role_id
 WHERE r.role LIKE '%Manual%';

-- 11. Вывести имена и должность автоматизаторов QA
 SELECT e.employee_name, r.role FROM employees e
 LEFT JOIN roles_employee re ON e.id = re.employee_id 
 LEFT JOIN roles r ON r.id = re.role_id
 WHERE r.role LIKE '%Automation%';

 --12. Вывести имена и зарплаты Junior специалистов
 SELECT e.employee_name, s.monthly_salary FROM employees e
 JOIN roles_employee re ON e.id = re.employee_id 
 JOIN roles r ON r.id = re.role_id
 JOIN employee_salary es ON e.id = es.employee_id
 JOIN salary s ON es.salary_id = s.id 
 WHERE r.role LIKE '%Junior%';

--13. Вывести имена и зарплаты Middle специалистов
 SELECT e.employee_name, s.monthly_salary FROM employees e
 JOIN roles_employee re ON e.id = re.employee_id 
 JOIN roles r ON r.id = re.role_id
 JOIN employee_salary es ON e.id = es.employee_id
 JOIN salary s ON es.salary_id = s.id 
 WHERE r.role LIKE '%Middle%';

 --14. Вывести имена и зарплаты Senior специалистов
 SELECT e.employee_name, s.monthly_salary FROM employees e
 JOIN roles_employee re ON e.id = re.employee_id 
 JOIN roles r ON r.id = re.role_id
 JOIN employee_salary es ON e.id = es.employee_id
 JOIN salary s ON es.salary_id = s.id 
 WHERE r.role LIKE '%Senior%';

 --15. Вывести зарплаты Java разработчиков
 SELECT  s.monthly_salary FROM employees e
 JOIN roles_employee re ON e.id = re.employee_id 
 JOIN roles r ON r.id = re.role_id
 JOIN employee_salary es ON e.id = es.employee_id
 JOIN salary s ON es.salary_id = s.id 
 WHERE r.role LIKE '%Java%';

 --16. Вывести зарплаты Python разработчиков
 SELECT  s.monthly_salary FROM employees e
 JOIN roles_employee re ON e.id = re.employee_id 
 JOIN roles r ON r.id = re.role_id
 JOIN employee_salary es ON e.id = es.employee_id
 JOIN salary s ON es.salary_id = s.id 
 WHERE r.role LIKE '%Python%';

 --17. Вывести имена и зарплаты Junior Python разработчиков
 SELECT e.employee_name, s.monthly_salary, r.role FROM employees e
 JOIN roles_employee re ON e.id = re.employee_id 
 JOIN roles r ON r.id = re.role_id
 JOIN employee_salary es ON e.id = es.employee_id
 JOIN salary s ON es.salary_id = s.id 
 WHERE r.role LIKE '%Junior%Python%';

 --18. Вывести имена и зарплаты Middle JS разработчиков
 SELECT e.employee_name, s.monthly_salary, r.role FROM employees e
 JOIN roles_employee re ON e.id = re.employee_id 
 JOIN roles r ON r.id = re.role_id
 JOIN employee_salary es ON e.id = es.employee_id
 JOIN salary s ON es.salary_id = s.id 
 WHERE r.role LIKE '%Middle%JavaScript%';

 --19. Вывести имена и зарплаты Senior Java разработчиков
 SELECT e.employee_name, s.monthly_salary, r.role FROM employees e
 JOIN roles_employee re ON e.id = re.employee_id 
 JOIN roles r ON r.id = re.role_id
 JOIN employee_salary es ON e.id = es.employee_id
 JOIN salary s ON es.salary_id = s.id 
 WHERE r.role LIKE '%Senior%Java %'; 

 --20. Вывести зарплаты Junior QA инженеров
 SELECT e.employee_name, s.monthly_salary, r.role FROM employees e
 JOIN roles_employee re ON e.id = re.employee_id 
 JOIN roles r ON r.id = re.role_id
 JOIN employee_salary es ON e.id = es.employee_id
 JOIN salary s ON es.salary_id = s.id 
 WHERE r.role LIKE '%Junior%QA%'; 

 --21. Вывести среднюю зарплату всех Junior специалистов
 SELECT  AVG(s.monthly_salary) AS avarage_salary FROM employees e
 JOIN roles_employee re ON e.id = re.employee_id 
 JOIN roles r ON r.id = re.role_id
 JOIN employee_salary es ON e.id = es.employee_id
 JOIN salary s ON es.salary_id = s.id 
 WHERE r.role LIKE '%Junior%'; 

 --2. Вывести сумму зарплат JS разработчиков
 SELECT  AVG(s.monthly_salary) AS avarage_salary FROM employees e
 JOIN roles_employee re ON e.id = re.employee_id 
 JOIN roles r ON r.id = re.role_id
 JOIN employee_salary es ON e.id = es.employee_id
 JOIN salary s ON es.salary_id = s.id 
 WHERE r.role LIKE '%JavaScript%'; 

 --23. Вывести минимальную ЗП QA инженеров
 SELECT  MIN(s.monthly_salary) AS minimal_salary FROM employees e
 JOIN roles_employee re ON e.id = re.employee_id 
 JOIN roles r ON r.id = re.role_id
 JOIN employee_salary es ON e.id = es.employee_id
 JOIN salary s ON es.salary_id = s.id 
 WHERE r.role LIKE '%QA%'; 

 --24. Вывести максимальную ЗП QA инженеров
 SELECT  MAX(s.monthly_salary) AS maximum_salary FROM employees e
 JOIN roles_employee re ON e.id = re.employee_id 
 JOIN roles r ON r.id = re.role_id
 JOIN employee_salary es ON e.id = es.employee_id
 JOIN salary s ON es.salary_id = s.id 
 WHERE r.role LIKE '%QA%';  

 --25. Вывести количество QA инженеров
 SELECT  COUNT(e.id) AS number_of_qa FROM employees e
 JOIN roles_employee re ON e.id = re.employee_id 
 JOIN roles r ON r.id = re.role_id
 JOIN employee_salary es ON e.id = es.employee_id
 JOIN salary s ON es.salary_id = s.id 
 WHERE r.role LIKE '%QA%';  

 --26. Вывести количество Middle специалистов.
 SELECT  COUNT(e.id) AS number_of_qa FROM employees e
 JOIN roles_employee re ON e.id = re.employee_id 
 JOIN roles r ON r.id = re.role_id
 JOIN employee_salary es ON e.id = es.employee_id
 JOIN salary s ON es.salary_id = s.id 
 WHERE r.role LIKE '%Middle%';  

 --27. Вывести количество разработчиков
 SELECT  COUNT(e.id) AS number_of_qa FROM employees e
 JOIN roles_employee re ON e.id = re.employee_id 
 JOIN roles r ON r.id = re.role_id
 JOIN employee_salary es ON e.id = es.employee_id
 JOIN salary s ON es.salary_id = s.id 
 WHERE r.role LIKE '%developer%';  

 --28. Вывести фонд (сумму) зарплаты разработчиков.
 SELECT  SUM(s.monthly_salary) AS sum_of_salary FROM employees e
 JOIN roles_employee re ON e.id = re.employee_id 
 JOIN roles r ON r.id = re.role_id
 JOIN employee_salary es ON e.id = es.employee_id
 JOIN salary s ON es.salary_id = s.id 
 WHERE r.role LIKE '%developer%';  

 --29. Вывести имена, должности и ЗП всех специалистов по возрастанию
 SELECT e.employee_name, s.monthly_salary, r.role FROM employees e
 JOIN roles_employee re ON e.id = re.employee_id 
 JOIN roles r ON r.id = re.role_id
 JOIN employee_salary es ON e.id = es.employee_id
 JOIN salary s ON es.salary_id = s.id 
 ORDER BY s.monthly_salary 

 --30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
 SELECT e.employee_name, s.monthly_salary, r.role FROM employees e
 JOIN roles_employee re ON e.id = re.employee_id 
 JOIN roles r ON r.id = re.role_id
 JOIN employee_salary es ON e.id = es.employee_id
 JOIN salary s ON es.salary_id = s.id 
 WHERE s.monthly_salary > 1700 AND s.monthly_salary < 2300
 ORDER BY s.monthly_salary;  
 
 --31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
 SELECT e.employee_name, s.monthly_salary, r.role FROM employees e
 JOIN roles_employee re ON e.id = re.employee_id 
 JOIN roles r ON r.id = re.role_id
 JOIN employee_salary es ON e.id = es.employee_id
 JOIN salary s ON es.salary_id = s.id 
 WHERE s.monthly_salary < 2300
 ORDER BY s.monthly_salary;  

 --32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
 SELECT e.employee_name, s.monthly_salary, r.role FROM employees e
 JOIN roles_employee re ON e.id = re.employee_id 
 JOIN roles r ON r.id = re.role_id
 JOIN employee_salary es ON e.id = es.employee_id
 JOIN salary s ON es.salary_id = s.id 
 WHERE s.monthly_salary IN (1100, 1500, 2000)
 ORDER BY s.monthly_salary;  