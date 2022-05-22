--문제1.
select  first_name,
        manager_id,
        commission_pct,
        salary
from employees
where salary > 3000
and commission_pct is null
and manager_id is not null;

select *
from employees
order by commission_pct asc;


--문제2.
select  employee_id,
        first_name,
        salary,
        to_char(hire_date, 'yyyy-mm-dd day'),
        replace(phone_number, '.', '-'),
        department_id
from employees
where (department_id, salary) in (select department_id,
                                         max(salary)
                                  from employees
                                  where department_id is not null
                                  group by department_id)            
order by salary desc;


--문제3.

select  m.manager_id,
        m.first_name,
        round(avg(e.salary), 1) saa,
        min(e.salary),
        max(e.salary)
from employees e, employees m
where m.employee_id = e.manager_id
and e.hire_date >= '2005/01/01'
group by m.manager_id, m.first_name
having avg(e.salary) > 5000
order by saa desc;


--문제4.

select  e.employee_id 사원아이디,
        e.first_name 사원이름,
        d.department_name 부서이름,
        m.first_name 매니저이름
from employees e, employees m, departments d
where e.department_id = d.department_id(+)
and e.manager_id = m.employee_id;




--문제5.

select  ort.rn,
        ort.employee_id,
        ort.first_name,
        d.department_name,
        ort.salary,
        ort.hire_date
from departments d, (select rownum rn,
                            ot.employee_id,
                            ot.first_name,
                            ot.salary,
                            ot.hire_date,
                            ot.department_id
                     from (select employee_id,
                                  first_name,
                                  salary,
                                  hire_date,
                                  department_id
                           from employees
                           where hire_date >= '2005/01/01'
                           order by hire_date asc) ot
                     ) ort
where  ort.department_id = d.department_id(+)
and rn between 11 and 20
order by rn asc;                     
                     
select *
from employees
where hire_date >= '2005/01/01'
order by hire_date asc;


--문제 6.

select  first_name||' '||last_name 이름,
        salary 연봉,
        d.department_name 부서이름,
        hire_date
from employees e, departments d
where e.department_id = d.department_id(+)
and hire_date = (select max(hire_date)
                 from employees);


--문제 7.

select  e.employee_id,
        e.first_name,
        e.last_name,
        j.job_id,
        e.salary,
        em.avg_sal
from employees e, jobs j, (select  department_id as dep,
                                    avg_sal
                            from ( select department_id,
                                          avg(salary) as avg_sal
                                   from employees
                                   group by department_id)
                            where avg_sal = (select max(avg_sal)
                                             from (select department_id, avg(salary) as avg_sal
                                                   from employees
                                                   group by department_id)
                                            )
                            )em
where e.department_id = dep
and e.job_id = j.job_id
order by salary asc;
                       
--문제8.
select  department_name as dep
from ( select department_name,
             avg(salary) as avg_sal
      from employees, departments
      where employees.department_id = departments.department_id
     group by department_name)
where avg_sal = (select max(avg_sal)
                from (select department_name, avg(salary) as avg_sal
                      from employees, departments
                      where employees.department_id = departments.department_id
                      group by department_name)
                );



--문제9.
select  region_name
from ( select region_name,
             avg(salary) as avg_sal
       from employees e, departments d, locations l, countries c, regions r
      where e.department_id = d.department_id
      and d.location_id = l.location_id
      and l.country_id = c.country_id
      and c.region_id = r.region_id
     group by region_name)
where avg_sal = (select max(avg_sal)
                from (select region_name, avg(salary) as avg_sal
                      from employees e, departments d, locations l, countries c, regions r
                      where e.department_id = d.department_id
                      and d.location_id = l.location_id
                      and l.country_id = c.country_id
                      and c.region_id = r.region_id
                      group by region_name)
                );


--문제10.
select  job_title
from ( select job_title,
        avg(salary) as avg_sal
        from employees e, jobs j
        where e.job_id = j.job_id
        group by job_title)
where avg_sal = (select max(avg_sal)
                 from (select job_title, avg(salary) as avg_sal
                       from employees e, jobs j
                       where e.job_id = j.job_id
                 group by job_title)
                );