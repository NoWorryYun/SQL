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
    

--각 부서별로 최고급여를 받는 사원을 출력하세요


--이름을 표현할 수 없다.
select  max(salary)
from employees
group by department_id;


--한칸한칸 맞춰서 출력됨

select employee_id,
        first_name,
        salary,
        department_id
from employees
where (Department_id, salary) in ( (10, 4400), (20, 13000), (90, 24000) );


select  first_name,
        department_id,
        salary
from employees
where (department_id, salary) IN ( select  department_id,
                                          max(salary)
                                  from employees
                                  group by department_id);



--ANY

--부서번호가 110인 직원의 급여 보다 큰 모든 직원의 사번, 이름, 급여를 출력하세요. (or 연산 > 8300보다 큰)

select first_name,
        salary,
        department_id
from employees
where department_id = 110;

select *
from employees
where salary > 8300
or salary > 12008;


select  first_Name,
        salary
from employees
where salary >any (select salary
                   from employees
                   where department_id = 110);


--all <--> any 비교
-- (1) 부서번호가 110인 직원의 급여 --> 12008 , 8300

select  first_name,
        salary,
        department_id
from employees
where department_id = 110;


select  first_name,
        salary,
        department_id
from employees
where salary > 8300
and salary > 12008;


select  first_name,
        salary,
        department_id
from employees
where salary >all ( select  salary
                    from employees
                    where department_id = 110);







