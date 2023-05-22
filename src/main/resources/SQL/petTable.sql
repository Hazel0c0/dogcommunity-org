-- database 이름 통일

create database dogcommunity;

create database dogcommunity
    default character set utf8
    collate utf8_general_ci;

drop database dogcommunity;

use dogcommunity;



-- 자유게시판
-- 조아요 조회 VARCHAR -> INT 로 수정
CREATE TABLE tbl_board (
                           board_no INT AUTO_INCREMENT PRIMARY KEY,
                           content VARCHAR(500) NOT NULL,
                           board_date_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                           attached_img VARCHAR(1000),
                           likes INT DEFAULT 0,
                           hits INT DEFAULT 0,
                           pet_no INT,
                           pet_name VARCHAR(10),
                           pet_photo VARCHAR(2000)
);
--                            FOREIGN KEY (pet_no)
--                            REFERENCES tbl_pet(pet_no)

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
