
drop table tbl_pet;
CREATE TABLE tbl_pet
(
    user_no INT,
    pet_no        INT AUTO_INCREMENT PRIMARY KEY, -- 반려동물 번호
    pet_name      VARCHAR(10)          NOT NULL,
    pet_age       INT,
    pet_kind      VARCHAR(20)          NOT NULL,
    pet_gender    VARCHAR(100)         NOT NULL,
    pet_photo     VARCHAR(2000) , -- 테스트용으로 NOT NULL 조건 없앰 //UNIQUE NOT NULL
    profile_date_time TIMESTAMP            NOT NULL DEFAULT CURRENT_TIMESTAMP,
    hashtag       VARCHAR(1000),
    addr VARCHAR(10),
--   FOREIGN KEY (user_no)
--   REFERENCES tbl_user(user_no)
);


#최종 사용자 8개 펫 8개

insert into tbl_pet(user_no,pet_no,pet_name,pet_age,pet_kind,pet_gender,pet_photo,profile_date_time,hashTag,addr)
values(1,1,'뭉치',2,'불독','MALE','http://thumbnail.10x10.co.kr/webimage/image/basic600/290/B002903467.jpg?cmd=thumb&w=500&h=500&fit=true&ws=false','2023-05-11','#귀요미,#댕스타그램','강남구'),
	(2,2,'떙구',8,'시츄','FEMALE','https://dimg.donga.com/wps/NEWS/IMAGE/2013/12/30/59864097.2.jpg','2023-05-12','#맞팔#산책할사람#댕댕스타그램','강남구'),
	(3,3,'용식',3,'진돗개','FEMALE','https://images.mypetlife.co.kr/content/uploads/2022/08/17141309/korean-jindo-gca19cfb7f_1280-768x512.jpg','2023-05-15','#선팔#좋아요일상그램','강남구'),
	(4,4,'구름',1,'포메라니안','NO_GENDER','http://adog.kr/web/upload/NNEditor/20200515/515_22.jpg','2023-05-20','#좋반','강남구'),
	(5,5,'치치',4,'웰시코기','SECRET','https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F9922A33A5BC4214A0F','2023-05-20','#산책스타그램#소통해요#나는솔로','강남구'),
	(6, 6, '뽀삐', 1, '닥스훈트', 'NO_GENDER', 'https://dalkompet.com/wp-content/uploads/2020/01/%EB%8B%A5%EC%8A%A4%ED%9B%88%ED%8A%B8.jpg', '2023-05-25','#좋반#핵인싸#한강스타그램#르세라핌','강남구'),
	(7,7,'또치',5,'푸들','MALE','http://image.dongascience.com/Photo/2017/07/14994185580021.jpg','2023-05-20','#푸들스타그램#나는솔로#흔녀#daily','강남구'),
	(8,8,'탱구',6,'비숑프리제','SECRET','https://dalkompet.com/wp-content/uploads/2020/01/%EB%B9%84%EC%88%91%ED%94%84%EB%A6%AC%EC%A0%9C.jpg','2023-05-21','#셀스타그램#ootd#순구만세','강남구'	);


# 테스트 사진
http://thumbnail.10x10.co.kr/webimage/image/basic600/290/B002903467.jpg?cmd=thumb&w=500&h=500&fit=true&ws=false

insert into tbl_pet(user_no, pet_no,pet_name, pet_age, pet_kind, pet_gender, pet_photo
,profile_date_time , hashTag, addr,add_detail)
values (11,6, '뭉치', 2, '불독', 'MALE',
        'http://thumbnail.10x10.co.kr/webimage/image/basic600/290/B002903467.jpg?cmd=thumb&w=500&h=500&fit=true&ws=false',
        '2023-05-11', '#귀요미,#댕스타그램','서대문구','신사동'),
       (1,7, '떙구', 8, '시츄', 'FEMALE', 'https://dimg.donga.com/wps/NEWS/IMAGE/2013/12/30/59864097.2.jpg', '2023-05-12',
        '#맞팔#산책할사람#댕댕스타그램','서대문구','역삼동'),
       (2,8, '용식', 3, '진돗개', 'FEMALE',
        'https://images.mypetlife.co.kr/content/uploads/2022/08/17141309/korean-jindo-gca19cfb7f_1280-768x512.jpg',
        '2023-05-15', '#선팔#좋아요일상그램','서대문구','논현동'),
       (4,9, '구름', 1, '포메라니안', 'NO_GENDER', 'http://adog.kr/web/upload/NNEditor/20200515/515_22.jpg', '2023-05-18',
        '#좋반','용산구','신사동'),
       (3,10, '치치', 4, '웰시코기', 'SECRET',
        'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F9922A33A5BC4214A0F',
        '2023-05-20', '#산책스타그램#소통해요','용산구','논현동');


values (11,22, '뭉치', 2, '불독', 'MALE',
        'http://thumbnail.10x10.co.kr/webimage/image/basic600/290/B002903467.jpg?cmd=thumb&w=500&h=500&fit=true&ws=false',
        '2023-05-11', '#귀요미,#댕스타그램','성북구','신사동'),
       (1,2, '떙구', 8, '시츄', 'FEMALE', 'https://dimg.donga.com/wps/NEWS/IMAGE/2013/12/30/59864097.2.jpg', '2023-05-12',
        '#맞팔#산책할사람#댕댕스타그램','성북구','역삼동'),
       (2,3, '용식', 3, '진돗개', 'FEMALE',
        'https://images.mypetlife.co.kr/content/uploads/2022/08/17141309/korean-jindo-gca19cfb7f_1280-768x512.jpg',
        '2023-05-15', '#선팔#좋아요일상그램','성북구','논현동'),
       (4,4, '구름', 1, '포메라니안', 'NO_GENDER', 'http://adog.kr/web/upload/NNEditor/20200515/515_22.jpg', '2023-05-18',
        '#좋반','성동구','신사동'),
       (3,5, '치치', 4, '웰시코기', 'SECRET',
        'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F9922A33A5BC4214A0F',
        '2023-05-20', '#산책스타그램#소통해요','성동구','논현동');


SELECT P.pet_no
     , P.pet_name
     , P.pet_age
     , P.pet_kind
     , P.pet_gender
     , P.pet_photo
     , P.pet_date_time
     , P.hashtag
     , U.addr
     , U.add_detail
     , P.likes
     , P.hits
FROM tbl_pet P
         LEFT JOIN tbl_user U
                   ON P.user_no = U.user_no
WHERE U.addr = '강남구'
ORDER BY pet_age DESC
;

update tbl_pet set pet_gender='MALE'
where pet_no in (1);

update tbl_pet set pet_gender='FEMALE'
where pet_no in (2, 3);

update tbl_pet set pet_gender='NO_GENDER'
where pet_no in (4);

update tbl_pet set pet_gender='SECRET'
where pet_no in (5);


select *
from tbl_pet P
    LEFT JOIN tbl_user U
        ON P.user_no = U.user_no;

select pet_name,
       MAX(pet_age)
FROM tbl_pet P
    LEFT JOIN tbl_user U
        ON P.user_no = U.user_no
group by add_detail
having MAX(pet_age)

Select *
From tbl_pet P
         LEFT JOIN tbl_user U
                   ON P.user_no = U.user_no
where add_detail='논현동'
Order by rand()
Limit 1;

select add_detail
from tbl_user
where addr='강남구'
group by add_detail;

select pet_name from tbl_pet where addr='성북구';
