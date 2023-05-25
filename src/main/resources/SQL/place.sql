create
    database dogcommunity;
use
    dogcommunity;

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

insert into tbl_place(place, addr, lng, lat, img, keyword, url)
VALUES ('겨울이 머무는 집', '마포구', 37.54990306504191, 126.92337034277068,
        'https://img1.kakaocdn.net/cthumb/local/R0x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocalfiy%2F3F27FE8E688F4EA08044E2908743EC5E',
        '애견카페', 'https://place.map.kakao.com/923108798'),
       ('JULY 16th', '마포구', 37.55687564386524, 126.97131000623847,
        'http://files.ban-life.com/content/2021/07/content_body_16251128340.jpg', '술집',
        'https://place.map.kakao.com/710785938'),
       ('키친숲', '마포구', (37.579340455262184), (126.90712292542102),
        'http://files.ban-life.com/content/2021/07/content_body_16251128362.jpg', '식당',
        'https://place.map.kakao.com/1709576075'),
       ('훌라훌라', '마포구', (37.552659991140786), (126.90463803230146),
        'http://files.ban-life.com/content/2021/07/content_body_16251128437.jpg', '식당',
        'https://place.map.kakao.com/1384758884'),
       ('투머치러브', '마포구', (37.564404634024264), (126.93464022364583),
        'https://peton.me/data/editor/2210/f1d9a9b9933f3b395b30b349e5542968_1666765775_3832.jpg', '반려동물용품점',
        'https://place.map.kakao.com/1727196968'),
       ('피프티인더카트', '마포구', (37.562734857177034), (126.92586140567926),
        'https://peton.me/data/editor/2210/f1d9a9b9933f3b395b30b349e5542968_1666766037_7431.jpg', '카페',
        'https://place.map.kakao.com/531769737'),

       ('떙스오트연남', '마포구', (37.56619080045074), (126.919918357303),
        'https://peton.me/data/editor/2210/f1d9a9b9933f3b395b30b349e5542968_1666766078_1629.jpg', '카페',
        'https://place.map.kakao.com/966554753'),

       ('클래시펫', '마포구', (37.55148729405333), (126.91152010030314),
        'https://peton.me/data/file/addPlace/%ED%81%B4%EB%9E%98%EC%8B%9C%ED%8E%AB_14_4.jpg', '애견미용실',
        'https://place.map.kakao.com/671711241'),


       ('경의선 숲길공원', '마포구', (37.55517545253491), (126.93334962564266),
        'https://peton.me/data/editor/2210/f1d9a9b9933f3b395b30b349e5542968_1666765968_2663.jpg', '공원',
        'https://place.map.kakao.com/27388917'),


       ('퍼베이비', '마포구', (37.54686072684465), (126.93200759210367),
        'https://peton.me/data/file/addPlace/%ED%8D%BC%EB%B2%A0%EC%9D%B4%EB%B9%84_%EC%B0%BD%EC%A0%84%EB%A1%9C_100.jpg',
        '애견미용실', 'https://place.map.kakao.com/1775610757'),


       ('다온펫샵', '마포구', (37.55517545253491), (126.93334962564266),
        'https://peton.me/data/file/addPlace/%EB%8B%A4%EC%98%A8%ED%8E%AB%EC%83%B5_%EC%8B%A0%EC%B4%8C%EB%A1%9C14%EA%B8%B8_10.jpg',
        '펫샵',
        'https://place.map.kakao.com/27276882'),


       ('워킹페코', '마포구', (37.554407878998205), (126.9303597453211),
        'https://peton.me/data/file/addPlace/%EC%9B%8C%ED%82%B9%ED%8E%98%EC%BD%94_59_3.jpg', '유치원',
        'https://place.map.kakao.com/1759849785'),

       ('써니네', '마포구', (37.5566934369719), (126.92548542516097),
        'https://peton.me/data/file/addPlace/%EC%8D%A8%EB%8B%88%EB%84%A4%EC%95%A0%EA%B2%AC%EC%B9%B4%ED%8E%98_%EC%96%91%ED%99%94%EB%A1%9C18%EC%95%88%EA%B8%B8_1.jpg',
        '애견카페',
        'https://place.map.kakao.com/10600580'),

       ('머머살롱', '마포구', (36.63146453298006), (127.50649179037063),
        'https://peton.me/data/file/addPlace/%EB%A9%8D%EB%A9%8D%EC%82%B4%EB%A1%B1_%EC%9E%94%EB%8B%A4%EB%A6%AC%EB%A1%9C6%EA%B8%B8_10.jpg'
           , '애견미용', 'https://place.map.kakao.com/304121557'),

       ('1989버거스탠드 연남', '마포구', (37.560457504557604), (126.92572784519852),
        'https://peton.me/data/file/addPlace/2156328449_230106_6acde466f2750bd6ec81984e1344e1f5e9e6e1e3.jpg', '식당',
        'https://place.map.kakao.com/1466114865'),

       ('스튜디오코지', '마포구', (37.55397652176831), (126.92138284840631),
        'https://peton.me/data/file/addPlace/%EC%8A%A4%ED%8A%9C%EB%94%94%EC%98%A4%EC%BD%94%EC%A7%80_19_1.jpg', '펫샵',
        'https://place.map.kakao.com/1124570397'),

       ('플라잉펫', '마포구', (37.54895642203145), (126.95215728399012),
        'https://peton.me/data/file/addPlace/%ED%94%8C%EB%9D%BC%EC%9E%89%ED%8E%AB_35_1.jpg', '펫호텔',
        'https://place.map.kakao.com/1346296625'),

       ('홍익동물종합병원', '마포구', (37.54809773127233),
        (126.91839022427983),
        'https://peton.me/data/file/addPlace/%ED%99%8D%EC%9D%B5%EB%8F%99%EB%AC%BC%EC%A2%85%ED%95%A9%EB%B3%91%EC%9B%90_%EB%8F%85%EB%A7%89%EB%A1%9C_1.jpg',
        '병원', 'https://place.map.kakao.com/10047665'),

       ('하늘공원', '마포구', (37.56852888619263), (126.88688610574323),
        'https://peton.me/data/file/addPlace/%ED%95%98%EB%8A%98%EA%B3%B5%EC%9B%90_95_1.jpg', '공원',
        'https://place.map.kakao.com/8128910'),

       ('노을공원', '마포구', (37.57409491672887), (126.8758150699911),
        'https://peton.me/data/file/addPlace/%EB%85%B8%EC%9D%84%EA%B3%B5%EC%9B%90_108-2_1.jpg', '공원'
           , 'https://place.map.kakao.com/8225309'),

       ('그냥방실', '마포구', (37.556256887769635), (126.9042231911548),
        'https://peton.me/data/file/addPlace/%EA%B7%B8%EB%83%A5_%EB%B0%A9%EC%8B%A4_%ED%9D%AC%EC%9A%B0%EC%A0%95%EB%A1%9C20%EA%B8%B8_1.jpg'
           , '카페', 'https://place.map.kakao.com/1202937064');

select keyword
from tbl_place
group by keyword
ORDER BY COUNT(*) DESC;

select *
from tbl_place
where addr = '마포구' and keyword='식당';

SELECT user_no, pet_No, pet_name, pet_age
     , pet_kind, pet_gender,pet_photo
     ,profile_date_time, hashtag, addr, add_detail
FROM tbl_pet
WHERE addr = '강남구'
        LIMIT 0, 4;