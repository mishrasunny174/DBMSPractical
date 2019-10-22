# Practical queries according to syllabus

1. ```select eno as 'employee no', ename as 'employee name',job_type as 'job', hire_date as 'Hire Date' from employee;```

2. ```select distinct job_type as jobs from employee;```

3. ```select concat(ename,',',job_type) as 'employee name, job' from employee;```

4. ```select concat_ws(',',eno,ename,job_type,manager,hire_date,dno,commission,salary) as 'THE OUTPUT' from employee;```

5. ```select ename as 'name', salary from employee where salary > 2850;```

6. ```select ename,dno from employee where eno='7900';```

7. ```select ename,salary from employee where salary not between 1500 and 2800;```

8. ```select ename, dno from employee where dno=10 order by ename;```

9. ```select ename, dno from employee where dno in(10,30) order by ename;```

10. ```select ename, hire_date from employee where year(hire_date) = 1981;```

11. ```select ename,job_type from employee where manager is NULL;```

12. ```select * from employee order by salary desc, commission desc;```

13. ```select ename from employee where ename like '__A%';```

14. ```select ename from employee where (ename like '%A%A%' or ename like '%R%R%') and (dno=30 or manager='7788');```

15. ```select ename,salary,commission from employee where commission>1.05*salary;```

16. ```select current_date();```

17. ```TODO```

18. ```select ename, ceil(datediff(current_date(),hire_date)/30) as 'number of months' from employee;```

19. ```select concat_ws(' ',ename,'earns',salary,'monthly but wants',3*salary) as 'Dream Salary' from employee;```

20. ```select concat(ucase(left(ename,1)),lcase(right(ename,char_length(ename)-1))) as name from employee where ename like 'J%' or ename like 'M%' or ename like 'A%';```

21. ```select ename, hire_date, dayname(hire_date) as dayofweek from employee;```

22. ```select ename, dname, employee.dno from employee join department on employee.dno=department.dno;```

23. ```select distinct job_type as jobs from employee,department where employee.dno=30;```

24. ```select ename,dname from employee join department on employee.dno=department.dno where ename like '%A%';```

25. ```select ename, job_type, employee.dno, dname from employee inner join department on employee.dno=department.dno where location='dallas';```

26. ```select e.eno,e.ename,m.eno as 'manager eno',m.ename as 'manager eno' from employee as e, employee as m where e.manager=m.eno union select eno, ename, NULL, NULL from employee where manager is null;```

27. ```select ename, dno, salary from employee where (dno,salary) in (select dno,salary from employee where commission is null)```

28. ```select ename, rpad("*",ceil(salary/1000),'*') as salary from employee;```

29. ```select max(salary) as 'max salary',min(salary) as 'min salary' ,avg(salary) as 'avg salary' ,sum(salary) as 'total salary' from employee;```

30. ```select job_type, count(*) from employee group by job_type;```

31. ```select count(*) as 'num of manager' from employee where job_type='manager';```

32. ```select department.dno as 'department number', dname as 'department name', count(*) as 'num of employees',avg(salary) as 'average salary' from department inner join employee on employee.dno=department.dno group by department.dno;```

33. ```select ename,hire_date from employee where dno in (select dno from employee where ename = 'blake')```

34. ```select eno, ename from employee where salary > all (select avg(salary) from employee);```

35. ```select eno, ename from employee where dno in (select dno from employee where ename like '%t%'); ```

36. ```select ename, salary from employee where manager = (select eno from employee where ename = 'king')```

37. ```select dno, ename, job_type as job from employee where dno = (select dno from department where dname='sales')```
