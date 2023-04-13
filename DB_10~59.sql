REM   Script: 테이블 만들기 초기 선언 코드
REM   테이블 만들기 초기 선언 코드

CREATE TABLE 고객 (  
  고객아이디  VARCHAR(20) NOT NULL,   
  고객이름    VARCHAR(20) NOT NULL,  
  나이        INT, 
  등급        VARCHAR(20) NOT NULL, 
  직업        VARCHAR(20), 
  적립금      INT DEFAULT 0, 
  PRIMARY KEY (고객아이디) 
);

CREATE TABLE 제품 ( 
  제품번호    CHAR(3) NOT NULL, 
  제품명      VARCHAR(20), 
  재고량      INT, 
  단가        INT, 
  제조업체    VARCHAR(20), 
  PRIMARY KEY (제품번호), 
  CHECK (재고량 >= 0 AND 재고량 <= 10000) 
);

CREATE TABLE 주문 ( 
  주문번호    CHAR(3) NOT NULL, 
  주문고객    VARCHAR(20), 
  주문제품    CHAR(3), 
  수량        INT, 
  배송지      VARCHAR(100), 
  주문일자    DATE, 
  PRIMARY KEY (주문번호), 
  FOREIGN KEY (주문고객) REFERENCES 고객(고객아이디), 
  FOREIGN KEY (주문제품) REFERENCES 제품(제품번호) 
);

CREATE TABLE 배송업체 ( 
  업체번호    CHAR(3) NOT NULL, 
  업체명      VARCHAR(20), 
  주소        VARCHAR(100), 
  전화번호    VARCHAR(20), 
  PRIMARY KEY (업체번호) 
);

INSERT INTO 고객 VALUES ('apple', '정소화', 20, 'gold', '학생', 1000);

INSERT INTO 고객 VALUES ('banana', '김선우', 25, 'vip', '간호사', 2500);

INSERT INTO 고객 VALUES ('carrot', '고명석', 28, 'gold', '교사', 4500);

INSERT INTO 고객 VALUES ('orange', '김용욱', 22, 'silver', '학생', 0);

INSERT INTO 고객 VALUES ('melon', '성원용', 35, 'gold', '회사원', 5000);

INSERT INTO 고객 VALUES ('peach', '오형준', NULL, 'silver', '의사', 300);

INSERT INTO 고객 VALUES ('pear', '채광주', 31, 'silver', '회사원', 500);

INSERT INTO 제품 VALUES ('p01', '그냥만두', 5000, 4500, '대한식품');

INSERT INTO 제품 VALUES ('p02', '매운쫄면', 2500, 5500, '민국푸드');

INSERT INTO 제품 VALUES ('p03', '쿵떡파이', 3600, 2600, '한빛제과');

INSERT INTO 제품 VALUES ('p04', '맛난초콜릿', 1250, 2500, '한빛제과');

INSERT INTO 제품 VALUES ('p05', '얼큰라면', 2200, 1200, '대한식품');

INSERT INTO 제품 VALUES ('p06', '통통우동', 1000, 1550, '민국푸드');

INSERT INTO 제품 VALUES ('p07', '달콤비스킷', 1650, 1500, '한빛제과');

INSERT INTO 주문 VALUES ('o01', 'apple', 'p03', 10, '서울시 마포구', to_date('2022-01-01', 'YYYY-MM-DD'));

INSERT INTO 주문 VALUES ('o02', 'melon', 'p01', 5, '인천시 계양구', to_date('2022-01-10', 'YYYY-MM-DD'));

INSERT INTO 주문 VALUES ('o03', 'banana', 'p06', 45, '경기도 부천시', to_date('2022-01-11', 'YYYY-MM-DD'));

INSERT INTO 주문 VALUES ('o04', 'carrot', 'p02', 8, '부산시 금정구', to_date('2022-02-01', 'YYYY-MM-DD'));

INSERT INTO 주문 VALUES ('o05', 'melon', 'p06', 36, '경기도 용인시', to_date('2022-02-20', 'YYYY-MM-DD'));

INSERT INTO 주문 VALUES ('o06', 'banana', 'p01', 19, '충청북도 보은군', to_date('2022-03-02', 'YYYY-MM-DD'));

INSERT INTO 주문 VALUES ('o07', 'apple', 'p03', 22, '서울시 영등포구', to_date('2022-03-15', 'YYYY-MM-DD'));

INSERT INTO 주문 VALUES ('o08', 'pear', 'p02', 50, '강원도 춘천시', to_date('2022-04-10', 'YYYY-MM-DD'));

INSERT INTO 주문 VALUES ('o09', 'banana', 'p04', 15, '전라남도 목포시', to_date('2022-04-11', 'YYYY-MM-DD'));

INSERT INTO 주문 VALUES ('o10', 'carrot', 'p03', 20, '경기도 안양시', to_date('2022-05-22', 'YYYY-MM-DD'));

--10번
SELECT 고객아이디, 고객이름, 등급 
 
FROM 고객;

--11번,12번
SELECT * 
 
FROM 고객;

--13번
SELECT 제조업체 
 
FROM 제품;

--14번
SELECT ALL 제조업체 
 
FROM 제품;

--15번
SELECT DISTINCT 제조업체 
FROM 제품 ;

--16번
SELECT 제품명, 단가 AS 가격 
 
FROM 제품;

--17번
SELECT 제품명, 단가 + 500 AS "조정 단가" 
FROM 제품;

--18번
SELECT 제품명, 재고량, 단가
FROM 제품
WHERE 제조업체 ='한빛제과';

--19번
select  주문제품, 수량, 주문일자 
 
from 주문 
 
where 주문고객 = 'apple' and 수량 >=15;

--20번
select 주문제품, 수량, 주문일자, 주문고객 
 
from 주문 
 
where 주문고객 = 'apple' OR 수량 >= 15;

--21번
select 제품명, 단가, 제조업체 
 
from 제품 
 
where 3000 >= 단가 and 단가 >= 2000;

--22번
select 고객이름, 나이, 등급, 적립금 
 
from 고객 
 
where 고객이름 like'김%' ;

--23번
SELECT 고객아이디, 고객이름, 등급 
 
FROM 고객 
 
WHERE 고객아이디 LIKE '_____';

--24번
SELECT 고객이름 
FROM 고객 
WHERE 나이 IS NULL;

--25번
SELECT 고객이름 
FROM 고객 
WHERE 나이 IS NOT NULL;

--26번
SELECT 고객이름, 등급, 나이 
FROM 고객 
ORDER BY 나이 DESC;

--27번
SELECT 주문고객, 주문제품, 수량, 주문일자 
FROM 주문 
WHERE 수량 >= 10  
ORDER BY 주문제품 ASC, 수량 DESC;

--28번
SELECT AVG(단가) 
FROM 제품;

--29번
SELECT SUM(재고량) AS "재고량 합계" 
FROM 제품 
WHERE 제조업체 = '한빛제과';


--30번
SELECT COUNT(고객아이디) AS 고객수 
FROM 고객;

--31번
SELECT COUNT(DISTINCT 제조업체) AS "제조업체 수" 
FROM 제품;

--32번
SELECT 주문제품, SUM(수량) AS "제품 별 총 수량" 
FROM 주문 
GROUP BY 주문제품;

--33번
SELECT 제조업체, COUNT(제품명), MAX(단가) AS "최고가" 
FROM 제품 
GROUP BY 제조업체;

--34번
SELECT 제조업체,COUNT(제품명) AS 제품수, MAX(단가) AS 최고가 
FROM 제품 
GROUP BY 제조업체 HAVING COUNT(제품명) >= 3;

--35번
SELECT 등급, COUNT(고객아이디) AS "등급 별 고객수", AVG(적립금) AS "적립금평균" 
FROM 고객 
GROUP BY 등급 HAVING AVG(적립금) >= 1000;

--36번
select 주문제품, 주문고객, sum(수량) as 총주문수량 
from 주문 
group by 주문제품, 주문고객;


--37번
SELECT 제품.제품명 
FROM 제품, 주문 
WHERE 주문고객 = 'banana' and 주문.주문제품 = 제품.제품번호;

--38번
select 주문.주문번호, 주문.주문일자 
from 고객, 주문 
where 고객.나이 >= 30 and 고객.고객아이디 = 주문.주문고객;

--39번
select 제품.제품명 
from 고객, 제품, 주문 
where 고객.고객이름 = '고명석' and 고객.고객아이디 = 주문.주문고객 and 주문.주문제품 = 제품.제품번호;

--40번
select 단가, 제품명 
from 제품 
where 제조업체 = (select 제조업체 
                                from 제품 
                                where 제품명 = '달콤비스킷');

--41번
select 고객이름, 적립금 
from 고객 
where 적립금 in (select max(적립금) 
                                from 고객);

--42번
select 제품.제품명, 제품.제조업체 
from 주문, 제품 
where 주문.주문고객 in (select 주문고객  
                                                from 주문 
                                        where 주문고객 ='banana') and 제품.제품번호 = 주문.주문제품;

--43번
select 제품명, 제조업체 
from 제품 
where 제품번호 not in (select 주문제품 
                                        from 주문 
                                        where 주문고객 ='banana');


--44번
select  제품명, 단가, 제조업체
from 제품
where 단가 > all (select 단가
    				from 제품
    				where 제조업체 = '대한식품');

--45번
select 고객이름
from 고객
where exists (select *
    				from 주문
    				where 주문일자 = '15-mar-22' and 고객.고객아이디 = 주문.주문고객);


--46번
select 고객이름
from 고객
where not exists (select *
    				from 주문
    				where 주문일자 = '15-mar-22' and 고객.고객아이디 = 주문.주문고객);

--47번
insert 
into 고객(고객아이디, 고객이름,나이,등급,직업,적립금)
values ('strawberry','최유경', 30, 'vip','공무원', 100 );

select *
from 고객;

--48번
insert 
into 고객(고객아이디, 고객이름, 나이, 등급, 적립금)
values ('tomato', '정은심', 36, 'gold', 4000);

select * from 고객;

--49번
update 제품
set 제품명 = '통큰파이'
where 제품번호 = 'p03';

select * 
from 제품;


--50번
update 제품
set 단가 = 단가*1.1;

select *
from 제품;


--51번
update 주문
set 수량 = 5
where 주문고객 in (select 고객아이디
    				from 고객
    				where 고객이름 = '정소화');

select *
from 주문;

--52번
delete
from 주문
where 주문일자 = '22-may-22';

select *
from 주문;

--53번
delete 
from 주문
where 주문고객 in (select 고객아이디
    				from 고객
    				where 고객이름 = '정소화');

select * from 주문;

--54번
delete
from 주문;

select *
from 주문;

--55번
create view 우수고객(고객아이디, 고객이름, 나이, 등급)
as select 고객아이디, 고객이름, 나이, 등급
	from 고객
	where 등급 = 'vip'
with check option;

select * from 우수고객;

--56번
create view 업체별제품수(제조업체, 제품수)
as select 제조업체, count(*)
	from 제품
	group by 제조업체
with check option;

select * from 업체별제품수;

--57번
select *
from 우수고객
where 나이 >=20;

--58번 선행
create view 제품1
as select 제품번호, 재고량, 제조업체
	from 제품
with check option;

select * from 제품1;

create view 제품2
as select 제품명, 재고량, 제조업체
	from 제품
with check option;

select * from 제품2;

--58번
insert into 제품1(제품번호,재고량,제조업체)
	values('p08', 1000, '식선식품');

select *
from 제품1;

--59번
drop view 우수고객;



