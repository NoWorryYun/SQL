/*******************************************

*SubQuery

*******************************************/
-- 단일행 subquery
/*
select  first_name,
        salary
from employees
where first_name = 'Den';

select *
from employees
where salary >= 11000;
*/

select*
from employees
where salary >= (select salary 
                 from employees
                 where first_name = 'Den');
  
--급여를가장적게받는사람의이름, 급여, 사원번호는?

select  first_name,
        salary,
        employee_id
from employees
where salary = (select min(salary)
                from employees);
  
  
                
--평균급여보다적게받는사람의이름, 급여를출력하세요

select  first_name,
        salary
from employees
where salary > (select avg(Salary)
                from employees)
order by salary asc;


--다중행 subquery
--?? 부서번호가 110인 직원의 급여와 같은 모든 직원의 사번, 이름, 급여를 출력하세요

select  employee_id
        first_name,
        salary
from employees
where department_id = 110;

--비교
select  employee_id,
        first_name,
        salary
from employees
where salary > 8300
or salary <= 12008;


select  employee_id,
        first_name,
        salary
from employees
where salary in (select salary
                 from employees
                 where employee_id = 110);
    











