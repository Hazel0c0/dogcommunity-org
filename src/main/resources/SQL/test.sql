drop table tbl_pet;
CREATE TABLE tbl_pet
(
    user_no           INT,
    pet_no            INT AUTO_INCREMENT PRIMARY KEY, -- 반려동물 번호
    pet_name          VARCHAR(10)  NOT NULL,
    pet_age           INT,
    pet_kind          VARCHAR(20)  NOT NULL,
    pet_gender        VARCHAR(100) NOT NULL,
    pet_photo         VARCHAR(2000),                  -- 테스트용으로 NOT NULL 조건 없앰 //UNIQUE NOT NULL
    profile_date_time TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    hashtag           VARCHAR(1000),
    addr              VARCHAR(10),
    add_detail        VARCHAR(10)

--   FOREIGN KEY (user_no)
--   REFERENCES tbl_user(user_no)
);


#최종 사용자 8개 펫 8개

insert into tbl_pet(user_no, pet_no, pet_name, pet_age, pet_kind, pet_gender, pet_photo, profile_date_time, hashTag,
                    addr, add_detail)
values (1, 1, '뭉치', 2, '불독', 'MALE',
        'http://thumbnail.10x10.co.kr/webimage/image/basic600/290/B002903467.jpg?cmd=thumb&w=500&h=500&fit=true&ws=false',
        '2023-05-11', '#귀요미,#댕스타그램', '강남구', '신사동'),
       (2, 2, '떙구', 8, '시츄', 'FEMALE', 'https://dimg.donga.com/wps/NEWS/IMAGE/2013/12/30/59864097.2.jpg', '2023-05-12',
        '#맞팔#산책할사람#댕댕스타그램', '강남구', '신사동'),
       (3, 3, '용식', 3, '진돗개', 'FEMALE',
        'https://images.mypetlife.co.kr/content/uploads/2022/08/17141309/korean-jindo-gca19cfb7f_1280-768x512.jpg',
        '2023-05-15', '#선팔#좋아요일상그램', '강남구', '신사동'),
       (4, 4, '구름', 1, '포메라니안', 'NO_GENDER', 'http://adog.kr/web/upload/NNEditor/20200515/515_22.jpg', '2023-05-20',
        '#좋반', '강남구', '신사동'),
       (5, 5, '치치', 4, '웰시코기', 'SECRET',
        'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F9922A33A5BC4214A0F',
        '2023-05-20', '#산책스타그램#소통해요#나는솔로', '강남구', '신사동'),
       (6, 6, '뽀삐', 1, '닥스훈트', 'NO_GENDER',
        'https://dalkompet.com/wp-content/uploads/2020/01/%EB%8B%A5%EC%8A%A4%ED%9B%88%ED%8A%B8.jpg', '2023-05-25',
        '#좋반#핵인싸#한강스타그램#르세라핌', '강남구', '신사동'),
       (7, 7, '또치', 5, '푸들', 'MALE', 'http://image.dongascience.com/Photo/2017/07/14994185580021.jpg', '2023-05-20',
        '#푸들스타그램#나는솔로#흔녀#daily', '강남구', '신사동'),
       (8, 8, '탱구', 6, '비숑프리제', 'SECRET',
        'https://dalkompet.com/wp-content/uploads/2020/01/%EB%B9%84%EC%88%91%ED%94%84%EB%A6%AC%EC%A0%9C.jpg',
        '2023-05-21', '#셀스타그램#ootd#순구만세', '강남구', '신사동');



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

insert into tbl_user(user_no, id, user_name, pwd, email, phone_num, addr, add_detail, join_date)
values (1, 'SU', '진수', 'Suuu123!@', 'dlwstn0722@naver.com', '01041358412', '강남구', '신사동', '2023-05-11'),
       (2, 'BITNA', '빛나', 'Bitna5678!@', 'bitna0722@naver.com', '01051248412', '강남구', '신사동', '2023-05-12'),
       (3, 'JIWON', '지원', 'Jiwon3235@%', 'jiwon0722@google.com', '01076129991', '강남구', '신사동', '2023-05-15'),
       (4, 'YOSICK', '영식', 'Yosick0525&*', 'yosick@naver.com', '01067513626', '강남구', '신사동', '2023-05-18'),
       (5, 'Dongguan', '동관', 'Dongguan0526%^', 'dongguan@naver.com', '01048353626', '강남구', '신사동', '2023-05-18'),
       (6, 'SOONGU', '순구', 'Soongu9007!@', 'soongu9@google.com', '01015213129', '강남구', '신사동', '2023-05-20'),
       (7, 'DONGWOO', '동우', 'Doongwoo0591@$', 'dongwoo8532@google.com', '01042501918', '강남구', '신사동', '2023-05-26'),
       (8, 'TAEGUN', '태근', 'Taegun0708*!', 'taegun0125@google.com', '01094251758', '강남구', '신사동', '2023-05-26');