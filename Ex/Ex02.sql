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


--Case ~ End문

select  employee_id,
        first_name,
        job_ID,
        salary,
        
        case when job_id = 'AC-ACCOUNT' then salary + salary*0.1
             when job_id = 'SA_REP' then salary+salary*0.2
             when job_id = 'ST_CLERK' then salary+salary*0.3
             else salary
        end realSalary
from employees;





--Decode 문


select  employee_id,
        first_name,
        job_ID,
        salary,
        decode(job_id,  'AC_ACCOUNT', salary+salary*0.1,
                        'SA_REP', salary+salary*0.2,
                        'ST_CLERK', salary+salary*0.3,
                        salary) realSalary
from employees;        


/*
직원의 이름, 부서, 팀을 출력하세요
팀은 코드로 결정하며
부서코드가 10~50이면 ‘A-TEAM’
        60~100이면 ‘B-TEAM’  
        110~150이면‘C-TEAM’ 
        나머지는 ‘팀없음’ 으로 출력하세요.
*/

select *
from employees;

select  first_name,
        job_id, 
        case when department_id between 10 and 50 then 'A-TEAM'
             when department_id between 60 and 100 then 'B-TEAM'
             when department_id between 110 and 150 then 'C-TEAM'
             else '팀없음'
        end department_id
from employees;



/**************
Join
**************/

select*
from employees, departments;



select  employee_id,
        first_name,
        salary,
        department_name,
        em.department_id "e_did",
        de.department_id "d_did"
from employees em, departments de
where em.department_id = de.department_id;


--모든 직원이름, 부서이름, 업무명 을 출력하세요

select  em.first_name,
        de.department_name,
        job.job_title
from employees em, departments de, jobs job
where em.department_id = de.department_id
and em.job_id = job.job_id
and em.salary>=7000;
