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

select  ee.rn,
        ee.employee_id,
        ee.first_name,
        d.department_name,
        ee.salary,
        ee.hire_date
from (select  rownum rn,
              e.employee_id,
              e.first_name,
              e.salary,
              e.hire_date
      from (select employee_id,
                   first_name,
                   salary,
                   hire_date
            from employees
            order by hire_date asc) e ) ee, departments d
where ee.department_id = d.department_id
order by hire_date asc;







