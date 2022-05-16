
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
