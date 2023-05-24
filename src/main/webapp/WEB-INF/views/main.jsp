<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <!--메인 화면 공통 부분 JSP-->
    <%@ include file="include/header.jsp" %>

    <!--추가 개별 CSS 넣기 -->
    <%--    <link rel="stylesheet" href="/assets/css/main-body.css">--%>

</head>
<style>
    .mainbody-box {
        width: 60%;
        margin-top: 160px;
        margin-left: 10px;
    }

    .container {
        /*height: 900px;*/
        border: 4px solid #000;
        border-radius: 20px;
        padding: 20px;
        display: flex;
        flex-wrap: wrap;
        flex-direction: row;
        justify-content: space-around;
        align-content: stretch;
        /* justify-content: flex-start; */
    }

    .item {
        width: 300px;
        height: 300px;
        border: 4px solid rgba(151, 151, 204, 0.76);
        border-radius: 20px;
        text-align: center;
        line-height: 150px;
        overflow: hidden;
        cursor: pointer;
    }

    .item:hover {
        width: 450px;
        height: 450px;
    }

    .bigBox {
        width: 400px;
        height: 400px;
        border: 4px solid rgba(243, 200, 117, 0.68);
        border-radius: 20px;
        text-align: center;
        line-height: 150px;
        margin-bottom: 10px;

    }

    .container img, iframe {
        width: 100%;
        background-size: cover;
    }


</style>

<body>

<section class="mainbody-box">
    <div class="container">
        <a href="https://petplanet.co/">
            <div class="item smallBox"><img src="/assets/img/1.png" alt=""></div>
        </a>
        <a href="https://pethroom.com/">
            <div class="item bigBox box2"><img src="/assets/img/2.jpeg" alt=""></div>
        </a>
        <a href="https://bodeum.co.kr/html/edu_movie/">
            <div class="item smallBox box3"><img src="/assets/img/3.jpeg" alt=""></div>
        </a>
        <a href="https://www.coupang.com/vp/products/6979242998?itemId=17043889466&vendorItemId=84218674563&pickType=COU_PICK&sourceType=srp_product_ads&clickEventId=32325b08-c034-41bd-9351-216b176bff1e&korePlacement=15&koreSubPlacement=1&q=%EC%9E%84%ED%8E%99%ED%83%80%EB%AF%BC+%ED%8E%AB&itemsCount=36&searchId=ef2459aa196b4ec2beb063965da9c2d3&rank=0&isAddedCart=">
            <div class="item bigBox box4"><img src="/assets/img/4.jpeg" alt=""></div>
        </a>
        <div class="item bigBox box5">
            <iframe width="400" height="400" src="https://www.youtube.com/embed/lW6r2HHWcjY"
                    title="“죽어라 물어요” 장갑을 안 끼면 만질 수도 없어요. 프렌치불독의 사나운 행동 강형욱 훈련사는 어떤 솔루션을 제공할까? │세상에 나쁜 개는 없다 │알고e즘│"
                    frameborder="0"
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                    allowfullscreen></iframe>
        </div>
    </div>
</section>

</body>
</html>