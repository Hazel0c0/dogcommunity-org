<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <%@ include file="../include/static-head.jsp" %>

    <!-- side menu event js defer : 지연 메뉴 걸기 -->
    <script src="side-menu.js" defer></script>
    <!-- 말풍선 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
    <!-- css -->
    <link rel="stylesheet" href="/assets/css/main.css">
</head>

<body>

<!-- header -->
<header>
    <div class="inner-header">
        <h1 class="logo">
            <a href="main.html">
                <img src="/assets/img/logo-instagram.png" alt="로고이미지">
            </a>
        </h1>
        <h2 class="intro-text"><a href="main.html">Petstagram</a></h2>
        <a href="#" class="menu-open">
            <span class="menu-txt">MENU</span>
            <span class="lnr lnr-menu"></span>
        </a>
    </div>

    <nav class="gnb">
        <a href="#" class="close">
            <span class="lnr lnr-cross"></span>
        </a>
        <ul>
            <li><a href="#"><span class="lnr lnr-home"> 홈</span></a></li>
            <li><a href="#"><span class="lnr lnr-magnifier"> 검색</span></a></li>
            <li><a href="#"><span class="lnr lnr-map"> 내 주변 친구</span></a></li>
            <li><a href="#"><span class="lnr lnr-heart"> 자랑하기</span></a></li>
            <li><a href="#"><span class="lnr lnr-bubble"> 메시지</span></a></li>
            <li><a href="#"><span class="lnr lnr-alarm"> 알림</span></a></li>
            <li><a href="/pet/profile"><span class="lnr lnr-user"> 프로필</span></a></li>
        </ul>
    </nav>
</header>

<!--main sidebar-->
<aside class="sidebar">
    <div class="profile-box">
        <div class="profile-img"><a href=""></a></div>
        <h3><a href="">멍뭉이</a></h3>
        <p id="profileIntro"> #왈왈으르릉 #가까이오지마</p>
    </div>
</aside>

<!-- body -->

<section id="boxRow1">
   
  

        <div id="card-container">
            <!--메인박스-->
        
            <!-- <%@ include file="../main/list.jsp" %> -->
    </div>


</section>
<!--// body-->


<script>
    // const cardcontainer =document.getElementById(card_container);
    // fetch("list.jsp")
    // .then(response => response.text())
    // .then(data => {
    //     cardcontainer.innerHTML = data;
    // })
    // .catch(error => {
    //     console.error("Error : ", error)
    // });
</script>
</body>

</html>