create database dogcommunity;
use dogcommunity;

drop table tbl_place;
CREATE TABLE tbl_place
(
    place   VARCHAR(50)  NOT NULL,
    addr    VARCHAR(10)  not null,
    lng     FLOAT(9, 5)  not null,
    lat     FLOAT(9, 5)  not null,
    img     VARCHAR(2000),
    keyword varchar(10)  not null,
    url     varchar(100) not null
);
#강남구
insert into tbl_place(place, addr, lng, lat, img, keyword, url)
VALUES('봉브라더스','강남구',(37.50743376011841),(127.02630159885167),
    'https://peton.me/data/file/addPlace/%EB%B4%89%EB%B8%8C%EB%9D%BC%EB%8D%94%EC%8A%A4_39_1.jpg',
    '카페','https://place.map.kakao.com/27290897'),
	  ('드도그 카페','강남구',(37.510841047548766),(127.05477722181931),
	  'https://peton.me/data/file/addPlace/%EB%93%9C%EB%8F%84%EA%B7%B8%EC%B9%B4%ED%8E%98_550_11.jpg',
	  '카페','https://place.map.kakao.com/317104570'),
	  ('어여가자애견카페','강남구',(37.506610077432285),(127.03977429816996),
	  'https://peton.me/data/file/addPlace/%EC%96%B4%EC%95%BC%EA%B0%80%EC%9E%90%EC%95%A0%EA%B2%AC%EC%B9%B4%ED%8E%98_%ED%85%8C%ED%97%A4%EB%9E%80%EB%A1%9C39%EA%B8%B8_10.jpg',
	  '카페','https://place.map.kakao.com/1315738140'),
	 ('글램독 그라운드 삼성점','강남구',(37.510522663582016),(127.05643398445157),'https://peton.me/data/file/addPlace/2156328449_220916_44631453e6b306f76fc455ccc38f24d04af9e39d.jpg',
	 '카페','https://place.map.kakao.com/1310223522'),
	 ('놀로스퀘어','강남구',(37.51943464404522),(127.04902857749157),'https://peton.me/data/file/addPlace/%EB%86%80%EB%A1%9C_%EC%82%BC%EC%84%B1%EB%A1%9C133%EA%B8%B8_2.jpg',
	 '카페','https://place.map.kakao.com/1273239949'),
	 ('펫타리움','강남구',(37.522425522046476),(127.05515899740166),'https://peton.me/data/file/addPlace/%ED%8E%AB%ED%83%80%EB%A6%AC%EC%9B%80_725_9.jpg',
	 '카페','https://place.map.kakao.com/828840953'),
	 ('두젠틀','강남구',(37.504187548082534),(127.03611718700567),'https://peton.me/data/file/addPlace/%EB%91%90%EC%A0%A0%ED%8B%80_%EB%85%BC%ED%98%84%EB%A1%9C_1.jpg',
	 '카페','https://place.map.kakao.com/1719961618'),
	 ('까사밀','강남구',(37.522164229413114),(127.01955897811244),'https://peton.me/data/file/addPlace/%EA%B9%8C%EC%82%AC%EB%B0%80_%EB%8F%84%EC%82%B0%EB%8C%80%EB%A1%9C1%EA%B8%B8_6.jpg',
	 	 '식당','https://place.map.kakao.com/17266666'),
	  	 ('패티드','강남구',(37.509134175563524),(127.02732012603602),'https://peton.me/data/file/addPlace/%ED%8C%A8%ED%8B%B0%EB%93%9C_56_1.jpg',
	  	 '식당','https://place.map.kakao.com/646645795'),
	   	 ('블랙랩','강남구',(37.50669443626546),(127.04905417415861),'https://peton.me/data/file/addPlace/%EB%B8%94%EB%9E%99%EB%9E%A9_5-16_1.jpg',
	   	 '식당','https://place.map.kakao.com/1108194168'),
	     ('모스가든','강남구',(37.52257006389732),(127.07127922554207),'https://peton.me/data/file/addPlace/3553471791_220821_dcb0f3b8cad79f89006d2692b73724da32d16e13.jpg',
	     '식당','https://place.map.kakao.com/540731064'),
	     ('달마시안','강남구',(37.52630315402359),(127.03454969261294),'https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20210913_18%2F1631492525833HWAbY_JPEG%2F3tYcm3RZh_CgstNdpODxOE2B.jpg',
	     '식당','https://place.map.kakao.com/95300197'),
	 	  ('신사공원','강남구',(37.52667566393249),(127.02148619208224),'https://peton.me/data/file/addPlace/2041223848_230518_5bbaec7394fb48a2aa40d4013adac6ef29adcf37.jpg',
	     '공원','https://place.map.kakao.com/8410676'),
	     ('역삼개나리공원','강남구',(37.49781295885381),(127.0360264747945),'https://peton.me/data/file/addPlace/%EC%97%AD%EC%82%BC%EA%B0%9C%EB%82%98%EB%A6%AC%EA%B3%B5%EC%9B%90_24_1.jpg',
	     '공원','https://place.map.kakao.com/8000436'),
	     ('우슴','강남구',(37.50810996343249),(127.02419814165356),'https://peton.me/data/file/addPlace/%EC%9A%B0%EC%8A%B4_15_3.jpg',
	     '술집','https://place.map.kakao.com/964112442'),
	     ('스몰치즈박스','강남구',(37.52272384475418),(127.02607506136563),'https://peton.me/data/file/addPlace/%EC%8A%A4%EB%AA%B0%EC%B9%98%EC%A6%88%EB%B0%95%EC%8A%A4_25_4.jpg',
	     '술집','https://place.map.kakao.com/1214729256');





#마포구
insert into tbl_place(place, addr, lng, lat, img, keyword, url)
VALUES ('겨울이 머무는 집', '마포구', 37.54990306504191, 126.92337034277068,
        'https://img1.kakaocdn.net/cthumb/local/R0x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocalfiy%2F3F27FE8E688F4EA08044E2908743EC5E',
        '애견카페', 'https://place.map.kakao.com/923108798'),
       ('JULY 16th', '마포구', (37.55687564386524), (126.97131000623847),
        'http://files.ban-life.com/content/2021/07/content_body_16251128340.jpg', '술집',
        'https://place.map.kakao.com/710785938'),
       ('키친숲', '마포구', (37.579340455262184), (126.90712292542102),
        'http://files.ban-life.com/content/2021/07/content_body_16251128362.jpg', '식당',
        'https://place.map.kakao.com/1709576075'),
       ('훌라훌라', '마포구', (37.552659991140786), (126.90463803230146),
        'http://files.ban-life.com/content/2021/07/content_body_16251128437.jpg', '식당',
        'https://place.map.kakao.com/1384758884');