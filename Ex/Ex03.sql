
--equi join

select *
from employees, departments;

select  e.first_name,
        d.department_name
from employees e, departments d
where e.department_id = d.department_id;

--left join (표준방법 left outer join ~ on)
select  first_name,
        e.department_id,
        d.department_name,
        d.department_id
from employees e left outer join departments d
on e.department_id = d.department_id;


--left join (오라클용, (+))

select  first_name,
        e.department_id,
        d.department_name,
        d.department_id
from employees e, departments d
where e.department_id = d.department_id(+);


--right join (표준방법 right outer join ~ on)
select  first_name,
        e.department_id,
        d.department_name,
        d.department_id
from employees e right outer join departments d
on e.department_id = d.department_id;

--left join (오라클용, (+))
select  first_name,
        e.department_id,
        d.department_name,
        d.department_id
from employees e, departments d
where e.department_id(+) = d.department_id;

--full join (표준방법 full outer join ~ on)
select  e.first_name,
        e.department_id,
        d.department_name,
        d.department_id
from employees e full outer join departments d
on e.department_id = d.department_id;


--self join

select *
from employees;

select  e1.employee_id as employee_id,
        e1.first_name as employee_name,
        e1.phone_number as employee_phone,
        e1.salary as employee_salary,
        e2.first_name as manager_name,
        e2.phone_number as manager_phone,
        e2.employee_id as manager_id
from employees e1, employees e2
where e1.manager_id = e2.employee_id;