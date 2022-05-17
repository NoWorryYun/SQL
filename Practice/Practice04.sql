

--문제1.

select count(salary)
from employees
where salary < ( select avg(salary)
                 from employees);
                 
--문제2.

select  employee_id,
        first_name,
        salary,
        avg(salary),
        max(salary)
from employees
where salary >= (select avg(salary)
                from employees)
and salary <= (select max(salary)
              from employees) 
group by employee_id, first_name, salary
order by salary asc;


--문제3.

select  l.location_id,
        l.street_address,
        l.postal_code,
        l.city,
        l.state_province,
        l.country_id
from locations l, employees e, departments d
where (e.first_name, e.last_name) in ( select first_name,
                                          last_name
                                       from employees
                                       where first_name = 'Steven'
                                       and last_name = 'King')
and e.department_id = d.department_id
and d.location_id = l.location_id;


--문제4.

select  employee_id,
        first_name,
        salary
from employees
where salary <ANY (select salary
                   from employees
                   where job_id = 'ST_MAN')
order by salary desc;

--문제5.

--(1)
select  employee_id,
        first_name,
        salary,
        department_id
from employees
where (salary, department_id) in (  select max(salary), department_id
                                    from employees
                                    group by department_id  )
order by salary desc;

--(2)
select  e.employee_id,
        e.first_name,
        e.salary,
        e.department_id
from employees e, ( select max(salary) maxSalary, department_id
                  from employees
                  group by department_id ) s
where e.salary = s.maxSalary
and e.department_id = s.department_id
order by salary desc;


--문제6.

select  job_title,
        sum(salary)
from employees e, jobs j, (select sum(salary),
                                  job_id
                           from employees
                           group by job_id) s
where e.job_id = j.job_id
and e.job_id = s.job_id
group by e.job_id, job_title
order by sum(salary) desc;

--문제7.
select employee_id,
       first_name,
       salary
from employees e, (select avg(salary) avg, department_id
                   from employees
                   group by department_id) s
where e.department_id = s.department_id
and e.salary > s.avg;

--문제8.

select  rn,
        employee_id, 
        first_name,
        salary,
        hire_date
from    (select rownum rn,
                employee_id,
                first_name,
                salary,
                hire_date
        from (select employee_id, 
                     first_name,
                     salary,
                     hire_date
              from employees
              order by hire_date asc)
        )
where rn <= 15
and rn >= 11;




