/****************

select문
    select 절
    from 절

****************/
--모든 컬럼 조회하기

select * -- ( * )모든이라는 뜻
from employees;

select *
from departments;


--원하는 컬럼만 조회하기
select employee_id, first_name, last_name
from employees;



--예제)
--사원의 이름(first_name)과 전화번호 입사일을 출력하세요.
select first_name, phone_number, hire_date, salary
from employees;

--예제)
--사원의이름(first_name)과성(last_name)급여, 전화번호, 이메일, 입사일을출력하세요

select   first_name
        ,last_name
        ,salary
        ,phone_number
        ,email, hire_date

from employees;

--출력할때 컬럼명 별명 사용하기

select first_name " 이름 ",
        phone_number " 전화번호 ",
        hire_date" 입사일 ",
        salary" 급여 "
from employees;

--사원의 사원번호 이름(first_name) 성(last_name) 급여 전화번호 이메일 입사일로 표시되도록 출력하세요
-- 별명짓는법 " " or #### as 별명 or #### 별명 (as생략가능 / 영어로 쓸 땐 대문자로 표기됨 / 띄워쓰기 불가능) 

select first_name as 이름,
        last_name  성,
        salary" 급여 ",
        phone_number " hp ",
        email " 이메일 ",
        hire_date" 입사일 "
from employees;


--연산연결자(컬럼을 붙이기) || , 공백은 ' '
select first_name || ' ' || last_name || ' '|| salary
       
from employees;


--전체가 한 컬럼 // 중간에 글자를 추가할 수 있음

select  first_name || ' hire date is ' || hire_date 입사일

from employees;

--산술연산자

select   first_name
        ,salary
        ,salary*12
        ,(salary+300)*12
from employees;

--다음을 실행해보고 오류를 분석해보세요

select job_id*12 --숫자가 아니라 계산이 안된다
from employees;

/*
전체 직원의 정보를 다음과 같이 출력하세요
성명(first_namelast_name)
    성과이름사이에–로구분ex) William-Gietz
급여 연봉(급여*12)
연봉2(급여*12+5000)
전화번호
*/

select  first_name|| '-' ||last_name 성명,
        salary*12 연봉1,
        salary*12+5000 연봉2,
        phone_number 전화번호
        
from employees;


/*where 절*/

select *
from employees
where department_id = 10;


/*
연봉이15000 이상인 사원들의 이름과 월급을 출력하세요
07/01/01 일 이후에 입사한 사원들의 이름과 입사일을 출력하세요
이름이 Lex인 직원의 연봉을 출력하세요
*/

select * from employees;

select first_name, salary
from employees
where salary > 15000;

select first_name, hire_date
from employees
where '07/01/01' <= hire_date;

select salary
from employees
where first_name = 'Lex';


--조건이 2개 이상일때 한꺼번에 조회하기
--연봉이 14000이상 17000이하인 사원의 이름과 연봉을 구하시오

select first_name || '  ' || salary "이름(연봉)"
from employees
where salary >=14000
and salary <=17000;


select first_name || '  ' || salary "이름(연봉)"
from employees
where salary between 14000 and 17000;



--입사일이04/01/01 에서05/12/31 사이의 사원의 이름과 입사일을 출력하세요

select first_name, hire_date
from employees
where hire_date >= '04/01/01' and hire_date <= '05/12/31';


--in 연산자로 여러 조건을 검사하기

select first_name, last_name, salary
from employees
where first_name in ('Neena', 'Lex', 'John');

--같은의미
select first_name, last_name, salary
from employees
where first_name = 'Neena'
or  first_name = 'Lex'
or  first_name = 'John';



--연봉이2100, 3100, 4100, 5100인 사원의 이름과 연봉을 구하시오

select first_name, salary
from employees
where salary in (2100, 3100, 4100, 5100);

select first_name, salary
from employees
where salary = 2100 
or salary = 3100 
or salary = 4100
or salary = 5100;


--Like 연산자로 비슷한것들 모두 찾기
select first_name, Last_name, salary
from employees
where first_name like 'L%';


/*
이름에 am 을 포함한 사원의 이름과 연봉을 출력하세요
이름의 두번째 글자가 a 인 사원의 이름과 연봉을 출력하세요
이름의 네번째 글자가 a 인 사원의 이름을 출력하세요
이름이 4글자인 사원중 끝에서 두번째 글자가 a인 사원의 이름을 출력하세요
*/

select first_name, salary
from employees
where first_name like '%am%';

select first_name, salary
from employees
where first_name like '_a%';

select first_name
from employees
where first_name like '___a%';

select first_name
from employees
where first_name like '__a_';




select first_name,
        salary,
        commission_pct,
        salary * commission_pct        
from employees
where salary between 13000 and 15000;


select first_name,
        salary,
        commission_pct,
        salary * commission_pct        
from employees
where commission_pct is not null;

/*
커미션 비율이 있는 사원의 이름과 연봉 커미션비율을 출력하세요
담당매니저가 없고 커미션비율이 없는 직원의 이름을 출력하세요
*/

select first_name, salary, commission_pct
from employees
where commission_pct is not null;

select first_name
from employees
where manager_id is null
and commission_pct is null;



--order by 절을 사용해 보기 좋게 정렬하기

select first_name,
        salary
from employees
where salary >= 10000
order by salary asc;    --desc <내림차순


select *
from employees
order by first_name asc;

/*
부서번호를 오름차순으로 정렬하고 부서번호, 급여, 이름을 출력하세요
급여가 10000 이상인 직원의 이름 급여를 급여가 큰직원부터 출력하세요
부서번호를 오름차순으로 정렬하고 부서번호가 같으면 급여가 높은 사람부터 부서번호 급여 이름을 출력하세요
*/

select department_id, salary, first_name
from employees
order by department_id asc;

select first_name, salary
from employees
where salary >= 10000
order by salary asc;

select department_id, salary, first_name
from employees
where department_id = department_id
order by department_id asc, salary desc, first_name desc;


/*
단일행 함수
*/
--문서함수 = initcap(컬럼명) // 첫글자 대문자변환
--부서번호 100인 직원의 이메일주소와 부서번호를 출력하세요
select    email
        , initcap(email) as "email 12"
        , department_id
from employees
where department_id = 100;

--문자함수 -- Lower(컬럼명) / UPPER (컬럼명)

select   first_name
        ,UPPER(first_name) 대문자
        ,LOWER(first_name) 소문자
from employees
where department_id = 100;


--문자함수 -- SUBSTR(컬럼명, 시작위치, 글자수)


select   first_name
        ,SubSTR(first_name, 1, 4)
        ,SUBSTR(first_name, -3, 2) 
        ,SUBSTR(first_name, -7, 2) 
from employees
where department_id = 100;

--문자함수 --LPAD(컬럼명, 자리수, '채울문자') / RPAD(컬럼명, 자리수, '채울문자')

select  first_name,
        lpad(first_name,10,'*'),
        rpad(first_name,10,'*'),
        lpad(rpad(first_name,10,'*'), 15,'*')
from employees;

--문자함수 replace (컬럼명, 문자1, 문자2)
select  first_name,
        replace(first_name, 'a', '*'),
        replace(first_name, substr(first_name, 2, 3),'***')
from employees
where department_id = 100;


select replace('abcdefg', 'bc', '*******')
from dual;

select subStr('900214-1234234', 8, 1)
from dual;


--숫자함수 Round(숫자, 출력을 원하는 자리수(반올림))
select  round(123.346, 2) "r2",
        round(123.456, 0) "r0",
        round(123.456, -1) "r-1",
        round(125.456, -1) "r-1"
from dual;


--숫자함수 TRUNC(숫자, 출력을 원하는 자리수(버림))
select  trunc(123.346, 2) "r2",
        trunc(123.456, 0) "r0",
        trunc(123.456, -1) "r-1",
        trunc(125.456, -1) "r-1"
from dual;

--날짜함수 --sysdate()

select sysdate
from dual;

select *
from employees;

select MONTHS_BETWEEN(sysdate, hire_date)
from employees
where department_id = 110;

--To_CHAR(숫자, '출력모양') 숫자형 > 문자형 변환하기
select  first_name,
        to_char(salary*12, '$999999')
from employees
where department_id = 110;

select  to_char(9876, '99999'),
        to_char(9876, '099999'),
        to_char(9876, '$99999'),
        to_char(9876, '9999.99'),
        to_char(987654321, '999,999,999,999,999'),
        to_char(987654321, '999,999,999,999,999.999')
        
from dual;


--변환함수>To_CHAR(날짜, '출력모양') 날짜->문자형으로 변환하기
select  sysdate,
        to_char(sysdate, 'YYYY'),
        to_char(sysdate, 'YY'),
        to_char(sysdate, 'mm'),
        to_char(sysdate, 'mon'),
        to_char(sysdate, 'month'),
        to_char(sysdate, 'dd'),
        to_char(sysdate, 'day'),
        to_char(sysdate, 'ddth'),
        to_char(sysdate, 'hh24'),
        to_char(sysdate, 'hh'),
        to_char(Sysdate, 'mi'),
        to_char(Sysdate, 'ss'),
        
        to_char(sysdate, 'yyyy-mm-dd'),
        to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss'),
        to_char(sysdate, 'yyyy"년" mm"월" dd"일" hh24:mi:ss')
from dual;

--NVL(컬럼명, null일때 값) / NVL2(컬럼명, Null아닐때 값, null일때 값)
select  commission_pct,
        nvl(commission_pct, 0),
        nvl2(commission_pct, 100, 0)
from employees;











