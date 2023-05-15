use dogcommunity;

drop table tbl_user;
select * from tbl_user;
CREATE TABLE tbl_user
(
      user_no   INT AUTO_INCREMENT PRIMARY KEY,
      id        VARCHAR(100) UNIQUE NOT NULL,
      pwd       VARCHAR(100)        NOT NULL,
      user_name VARCHAR(20),
      email     VARCHAR(30) UNIQUE,
      phone_num VARCHAR(20) UNIQUE,
      addr      VARCHAR(100)        NOT NULL,
      add_detail      VARCHAR(100)        NOT NULL,
      join_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

insert into tbl_user(id,user_name,pwd
,email,phone_num,add_detail ,addr,join_date)
values('SU','진수',1234,'dlwstn0722@naver.com','01041358412','논현동','강남구','2023-05-11'),
      ('BITNA','빛나',5678,'bitna0722@naver.com',01051248412,'논현동','강남구','2023-05-12'),
      ('JIWON','지원',3235,'jiwon0722@google.com',01076129991,'논현동','강남구','2023-05-15'),
      ('YOSICK','영식',0000,'yosick@naver.com',01067513626,'역삼동','강남구','2023-05-18'),
      ('SOONGU','순구',9007,'soongu9@google.com',01015213129,'신사동','강남구','2023-05-20');