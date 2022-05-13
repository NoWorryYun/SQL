select  employee_id,
        first_name,
        salary,
        job_id,
        manager_id,
        department_id
from employees;


select*
from departments;

select *
from locations;

select *
from countries;

select *
from regions;

select *
from jobs;


/*********************
그룹함수
*********************/

--그룹함수 - count()
select  count(*),
        count(commission_pct)   --null출력 안됨
        count(manager_id)
from employees;

select count(*)
from employees
where salary > 16000;

--그룹함수 -sum()
select sum(salary)
from employees;

--그룹함수 - avg()
select  avg(salary),
        avg(nvl(salary, 0)),     -- null 인 값은 0으로 변경후 평균 냄
        round(avg(salary), 0),
        count(*),
        sum(salary)
from employees;


--그룹함수 -max() / min()
select  max(salary),
        min(salary)
from employees;


--group by 절
select first_name
from employees
where salary > 16000
order by salary desc;


select  department_id,
        avg(salary),     --department_id(부서별 평균)
        sum(salary),     --department_id(부서별 합계)
        count(salary)   --department_id(부서별 카운트)
from employees
group by department_id
order by department_id asc;

select  department_id,
        avg(salary)
from employees
group by department_id;



select  department_id,
        salary
from employees;

--연봉(salary)의 합계가 20000이상인 부서의
--부서 번호와, 인원수, 급여합계를 출력하세요

select *
from employees;


--having 절
select  department_id,
        sum(salary),
        count(department_id)
from employees
--where sum(salary) >= 20000 << where절에는 group(sum, count, etc)함수를 쓸 수 없다.
having sum(salary) >= 20000     
and sum(salary) <= 100000
and department_id = 90
--and hire_date >= '04/01/01' << having절에는 group by로 참여한 컬럼만 쓸 수 있다.
group by department_id;


