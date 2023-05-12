
-- database 이름 통일

create database dogcommunity;
use dogcommunity;

CREATE TABLE tbl_user
(
    user_no        INT AUTO_INCREMENT PRIMARY KEY,
    id        VARCHAR(100) UNIQUE NOT NULL,
    pwd VARCHAR(100)        NOT NULL,
    user_name      VARCHAR(20),
    email     VARCHAR(30) UNIQUE,
    phone_num VARCHAR(20) UNIQUE,
    adds      VARCHAR(100)        NOT NULL,
    join_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

drop table tbl_user;


CREATE TABLE tbl_pet
(
    pet_no            INT AUTO_INCREMENT PRIMARY KEY, -- 반려동물 번호
    pet_name          VARCHAR(10)          NOT NULL,
    pet_age           INT,
    pet_kind          VARCHAR(20)          NOT NULL,
    pet_gender        VARCHAR(100)         NOT NULL,
    pet_photo         VARCHAR(2000) UNIQUE NOT NULL,
    pet_date_time TIMESTAMP            NOT NULL DEFAULT CURRENT_TIMESTAMP,
    hashTag           VARCHAR(1000)
--   user_no INT,
--   FOREIGN KEY (user_no)
--   REFERENCES tbl_user(user_no)
);
drop table tbl_pet;

-- 자유게시판
-- 조아요 조회 VARCHAR -> INT 로 수정
CREATE TABLE tbl_board
(
    board_no        INT AUTO_INCREMENT PRIMARY KEY,
    title           VARCHAR(30)  NOT NULL,
    content         VARCHAR(500) NOT NULL,
    board_date_time TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    attached_img    VARCHAR(500),
    likes           INT                   DEFAULT 0,
    hits            INT                   DEFAULT 0
    --   pet_no INT,
--   FOREIGN KEY (pet_no)
--   REFERENCES tbl_pet(pet_no)
);

-- 댓글
-- 댓글번호 , 내용 , 작성자
--  auto increment 자동으로 번호가 매겨져서 생략...
-- reply_comment
create table tbl_reply
(
    reply_no        INT AUTO_INCREMENT PRIMARY KEY,
    comment         Varchar(500) not null,
    reply_date_time TIMESTAMP    not null default current_timestamp
--     board_no Int,
--     pet_no INT,
--     FOREIGN KEY (pet_no) REFERENCES User(pet_no),
--     FOREIGN KEY (board_no)REFERENCES board(board_no)
);
