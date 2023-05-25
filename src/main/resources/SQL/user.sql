use dogcommunity;

drop table tbl_user;
select *
from tbl_user;
CREATE TABLE tbl_user
(
    user_no    INT AUTO_INCREMENT PRIMARY KEY,
    id         VARCHAR(100) UNIQUE NOT NULL,
    pwd        VARCHAR(100)        NOT NULL,
    user_name  VARCHAR(20),
    email      VARCHAR(30) UNIQUE,
    phone_num  VARCHAR(20) UNIQUE,
    addr       VARCHAR(100)        NOT NULL,
    add_detail VARCHAR(100)        NOT NULL,
    join_date  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 수정된 것 이것 사용하면 됨

insert into tbl_user(user_no,id,pwd,user_name,email,phone_num,addr,join_date)
values(1,'SU','진수','Suuu123!@','dlwstn0722@naver.com','01041358412','강남구','2023-05-11'),
	(2,'BITNA','빛나','Bitna5678!#','bitna0722@naver.com','01051248412','강남구','2023-05-12'),
	(3,'JIWON','지원','Jiwon3235@%','jiwon0722@google.com','01076129991','강남구','2023-05-15'),
	(4,'YOSICK','영식','Yosick0525&*','yosick@naver.com','01067513626','강남구','2023-05-18'),
	(5,'Dongguan','동관','Dongguan0526%^','dongguan@naver.com','01048353626','강남구','2023-05-18'),
	(6,'SOONGU','순구','Soongu9007!@','soongu9@google.com','01015213129','강남구','2023-05-20');

insert into tbl_user(user_no,id,pwd,user_name,email,phone_num,addr,join_date)
values(7,'DONGWOO','동우','Doongwoo0591@$','dongwoo8532@google.com','01042501918','강남구','2023-05-26');

insert into tbl_user(user_no,id,pwd,user_name,email,phone_num,addr,join_date)
values(8,'TAEGUN','태근','Taegun0708*!','taegun0125@google.com','01094251758','강남구','2023-05-26');


#  자동로그인 컬럼 추가
ALTER TABLE tbl_user
    ADD session_id VARCHAR(200) default 'none';

ALTER TABLE tbl_user
    ADD cookie_limit_time DATETIME;

