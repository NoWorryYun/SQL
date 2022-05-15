--문제1.

select count(manager_id) "haveMngCnt"
from employees;


--문제2.

select *
from jobs;

select  max_salary 최고임금,
        min_salary 최저임금,
        max_salary - min_salary "최고임금 - 최저임금"
from jobs;


--문제3.

select to_char(min(hire_date), 'yyyy"년" mm"월" dd"일"')
from employees
order by hire_date desc;

--문제4.

select  department_id 부서아이디,
        avg(salary) 평균임금,
        max(salary) 최고임금,
        min(salary) 최저임금
from employees
group by department_id
order by department_id desc;



--문제5.

SELECT  job_id 업무아이디,
        round(avg(salary), 0) 평균임금,
        max(salary) 최고임금,
        min(salary) 최저임금
FROM    employees
group by job_id
order by min(salary) desc,
         avg(salary) asc;

--문제6.

select to_char(max(hire_date), 'yyyy-mm-dd day')
from employees
order by hire_date asc;


--문제7.

select *
from employees;

select  department_id "부서",
        round(avg(salary),0) "평균임금",
        min(salary) "최저임금",
        round(avg(salary)-min(salary)) "평균임금 - 최저임금"
from employees
group by department_id
having avg(salary)-min(salary) < 2000
order by avg(salary)-min(salary) desc;

--문제8.

select *
from jobs;

select max_salary - min_salary "최고임금 - 최저임금"
from jobs
order by max_salary - min_salary desc;


--문제9.

select*
from employees;

select  round(avg(salary), 1),
        min(salary),
        max(salary)
from employees
group by manager_id, hire_date
having hire_date > '05/01/01'
and avg(salary) >= 5000
order by avg(salary) desc;


--문제10.
select *
from employees;


select  first_name,
        case when hire_date between min(hire_date) and '02/12/31' then '창립멤버'
             when hire_date between '03/01/01' and '03/12/31' then '03년입사'
             when hire_date between '04/01/01' and '04/12/31' then '04년입사'
             else '상장이후입사'
        end "optDate"
from employees
group by hire_date, first_name
order by hire_date asc;












