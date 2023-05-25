-- database 이름 통일

create database dogcommunity;

create database dogcommunity
    default character set utf8
    collate utf8_general_ci;

drop database dogcommunity;

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
CREATE TABLE tbl_reply (
    reply_no INT AUTO_INCREMENT PRIMARY KEY,
    comment VARCHAR(500) NOT NULL,
    reply_date_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
      pet_name VARCHAR(10),
    board_no INT,
   pet_no INT,
   pet_photo VARCHAR(2000)
);


-- 게시물

INSERT INTO tbl_board (content, board_date_time, attached_img, likes, hits, pet_no, pet_name)
VALUES
    ('즐거운 자바', '2023-05-11', 'https://dimg.donga.com/wps/NEWS/IMAGE/2017/10/21/86861258.2.jpg', 3, 5, 1, '금수'),
    ('핵인싸 개간지 순구쌤', '2023-05-14', 'https://cdn.imweb.me/upload/S201807025b39d1981b0b0/5cad95219ca68.jpg', 111, 234, 2, '요시쿠'),
    ('국밥에 소주', '2023-05-17', 'https://cdn.imweb.me/upload/S201807025b39d1981b0b0/5cad95219ca68.jpg', 77, 100, 3, '숭구'),
    ('한강 산책하실분', '2023-05-21', 'https://admin.ntdtv.kr/assets/uploads/2022/07/8-7-795x436.jpg', 43, 23, 4, '땡구'),
    ('강아지 산책도 하고 연애도 하고', '2023-05-05', 'https://dimg.donga.com/wps/NEWS/IMAGE/2017/10/21/86861258.2.jpg', 99, 41, 5, '뽀삐');
-- 펫번호 7번부터 추가 하면 petno 받아서 밑에 추가 해주면 됨
--     ('요시쿠는 훌륭해', '2023-05-23', 'Image 6', 23, 10, 6),
--     ('대화가 필요한 댕댕', '2023-05-23', 'Image 7', 9, 5, 7),
--     ('나에게 봄날은 언제올까', '2023-05-25', 'Image 8', 27, 31, 8),
--     ('해축 토트넘 첼시 몰락', '2023-05-24', 'Image 9', 25, 44, 9),
--     ('내친구 댕댕이를 소개합니다', '2023-05-13', 'Image 10', 33, 999, 10);

--댓글


INSERT INTO tbl_reply(reply_no, comment, reply_date_time, pet_name,board_no, pet_no,pet_photo)
VALUES
    (1, '코딩의 끝은 어디에', '2023-05-21','리트',1,1,'https://cdn.imweb.me/upload/S201807025b39d1981b0b0/5cad95219ca68.jpg'),
    (2, '춤출 때가 가장 섹시해', '2023-05-14','요시쿠',2,2,'https://cdn.imweb.me/upload/S201807025b39d1981b0b0/5cad95219ca68.jpg'),
    (3, '술이 술술 들어간다', '2023-05-18','숭구',3,3,'https://cdn.imweb.me/upload/S201807025b39d1981b0b0/5cad95219ca68.jpg'),
    (4, '한강에는 치맥이지', '2023-05-21','땡구',4,4,'https://admin.ntdtv.kr/assets/uploads/2022/07/8-7-795x436.jpg'),
    (5, '솔로 탈출하고 싶다', '2023-05-07','뽀삐',5,5,'https://dimg.donga.com/wps/NEWS/IMAGE/2017/10/21/86861258.2.jpg');