
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
    add_detail VARCHAR(10)
--   FOREIGN KEY (user_no)
--   REFERENCES tbl_user(user_no)
);
# 테스트 사진
http://thumbnail.10x10.co.kr/webimage/image/basic600/290/B002903467.jpg?cmd=thumb&w=500&h=500&fit=true&ws=false


insert into tbl_pet(user_no,pet_name,pet_age,pet_kind,pet_gender,pet_photo,pet_date_time,hashTag)
values(1,'뭉치',2,'불독','MALE','http://thumbnail.10x10.co.kr/webimage/image/basic600/290/B002903467.jpg?cmd=thumb&w=500&h=500&fit=true&ws=false','2023-05-11','#귀요미,#댕스타그램'),
      (2,'떙구',8,'시츄','FEMALE','https://dimg.donga.com/wps/NEWS/IMAGE/2013/12/30/59864097.2.jpg','2023-05-12','#맞팔#산책할사람#댕댕스타그램'),
      (3,'용식',3,'진돗개','FEMALE','https://images.mypetlife.co.kr/content/uploads/2022/08/17141309/korean-jindo-gca19cfb7f_1280-768x512.jpg','2023-05-15','#선팔#좋아요일상그램'),
      (4,'구름',1,'포메라니안','NO_GENDER','http://adog.kr/web/upload/NNEditor/20200515/515_22.jpg','2023-05-18','#좋반'),
      (5,'치치',4,'웰시코기','SECRET','https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F9922A33A5BC4214A0F','2023-05-20','#산책스타그램#소통해요');


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
group by add_detail
