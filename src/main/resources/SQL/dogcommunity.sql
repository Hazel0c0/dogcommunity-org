
-- database 이름 통일

create database dogcommunity;
use dogcommunity;

CREATE TABLE User
(
    user_no       INT AUTO_INCREMENT PRIMARY KEY,
    user_id       VARCHAR(100) UNIQUE NOT NULL,
    user_password VARCHAR(100)        NOT NULL,
    user_nickname VARCHAR(10) UNIQUE  NOT NULL,
    user_add      VARCHAR(100)        NOT NULL
);

-- not null

CREATE TABLE Pet
(
    pet_no            INT AUTO_INCREMENT PRIMARY KEY, -- 반려동물 번호
    pet_name          VARCHAR(10)          NOT NULL,
    pet_age           INT,
    pet_kind          VARCHAR(20)          NOT NULL,
    pet_gender        VARCHAR(10)          NOT NULL,
    pet_photo         VARCHAR(2000) unique NOT NULL,
    profile_date_time TIMESTAMP            not null default current_timestamp,
    user_no           INT,
    FOREIGN KEY (user_no)
        REFERENCES User (user_no)
);

-- 자유게시판
-- 조아요 조회 VARCHAR -> INT 로 수정
CREATE TABLE board
(
    board_no        INT AUTO_INCREMENT PRIMARY KEY,
    title           VARCHAR(30)  not null,
    content         VARCHAR(500) not null,
    borad_date_time TIMESTAMP    not null default current_timestamp,
    attached_img    varchar(500),
    likes           varchar(500),
    hits            varchar(500),
    user_no         INT,
    FOREIGN KEY (user_no)
        REFERENCES User (user_no)
);

-- 댓글
-- 댓글번호 , 내용 , 작성자
--  auto increment 자동으로 번호가 매겨져서 생략...
create table reply
(
    reply_no        INT AUTO_INCREMENT PRIMARY KEY,
    comment         Varchar(500) not null,
    reply_date_time TIMESTAMP    not null default current_timestamp,
    likes           varchar(500),
    hits            varchar(500),
    board_no        Int,
    user_no         INT,
    FOREIGN KEY (user_no) REFERENCES User (user_no),
    FOREIGN KEY (board_no) REFERENCES board (board_no)
);

-- pet 테이블 입력 넣기
insert into Pet(pet_name, pet_age, pet_kind, pet_gender, pet_photo)
values ('뭉치', 2, '불독', '남',
        'http://thumbnail.10x10.co.kr/webimage/image/basic600/290/B002903467.jpg?cmd=thumb&w=500&h=500&fit=true&ws=false');
