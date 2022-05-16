--문제1.

select *
from departments;

select  e.employee_id,
        e.first_name,
        e.last_name,
        d.department_name
from employees e, departments d
where e.department_id = d.department_id
order by d.department_name asc, e.employee_id desc;

--문제2.

select *
from employees;


select  e.employee_id,
        e.first_name,
        e.salary,
        d.department_name,
        j.job_title
from employees e, jobs j, departments d
where e.department_id is not null
and e.job_id = j.job_id
and e.department_id = d.department_id
order by employee_id asc;

--문제2-1.

select  e.employee_id,
        e.first_name,
        e.salary,
        d.department_name,
        j.job_title
from employees e, jobs j, departments d
where e.job_id = j.job_id
and e.department_id = d.department_id(+)
order by employee_id asc;



--문제3.

select *
from locations;

select *
from departments;

select *
from departments, locations, employees;


select  l.location_id,
        l.city,
        d.department_name,
        d.department_id
from departments d, locations l
where d.location_id = l.location_id
order by location_id asc;

--문제3-1.

select  l.location_id,
        l.city,
        d.department_name,
        d.department_id
from departments d, locations l
where d.location_id(+) = l.location_id
order by location_id asc;

--문제4.

select  r.region_name,
        c.country_name
from countries c, regions r
where c.region_id=r.region_id
order by region_name asc, country_name desc;

--문제5.
select  e.employee_id,
        e.first_name,
        e.hire_date,
        m.first_name,
        m.hire_date
from employees e, employees m
where e.employee_id = m.manager_id
and e.hire_date > m.hire_date;



--문제6.

select  c.country_name,
        c.country_id,
        l.city,
        l.location_id,
        d.department_id,
        d.department_name
from countries c, locations l, departments d
where c.country_id=l.country_id
and l.location_id=d.location_id
order by country_name asc;


--문제7.

select  e.first_name||e.last_name,
        e.employee_id,
        jh.job_id,
        jh.start_date,
        jh.end_date
from employees e, job_history jh
where e.employee_id=jh.employee_id
and jh.job_id = 'AC_ACCOUNT';


--문제8.

select*
from departments;

select*
from employees;

select  d.department_id,
        d.department_name,
        e.first_name,
        l.city,
        c.country_name,
        r.region_name
from employees e, departments d, locations l, countries c, regions r
where d.location_id = l.location_id
and l.country_id = c.country_id
and c.region_id = r.region_id
and e.employee_id = d.manager_id;



--문제9.

select  e.employee_id,
        e.first_name,
        d.department_name,
        m.first_name
from employees e, employees m, departments d
where e.department_id = d.department_id(+)
and e.manager_id = m.employee_id
order by e.first_name;







