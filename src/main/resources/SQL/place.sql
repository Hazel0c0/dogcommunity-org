create database dogcommunity;
use dogcommunity;

drop table tbl_place;
CREATE TABLE tbl_place
(
    place VARCHAR(50) NOT NULL ,
    addr VARCHAR(10) not null ,
    lng FLOAT(9,5) not null ,
    lat FLOAT(9,5) not null ,
    img VARCHAR(2000),
    keyword varchar(10) not null,
    url varchar(100) not null
);

insert into tbl_place(place, addr, lng, lat,img,keyword,url)
VALUES ('겨울이 머무는 집','마포구',37.54990306504191, 126.92337034277068,'https://img1.kakaocdn.net/cthumb/local/R0x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocalfiy%2F3F27FE8E688F4EA08044E2908743EC5E','애견카페','https://place.map.kakao.com/923108798');