<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>


    <!-- common css -->
    <link rel="stylesheet" href="../../common.css">

    <!-- reset -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">

    <!-- fontawesome css: https://fontawesome.com -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">

    <!-- https://linearicons.com/free#cdn -->
    <link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">

    <!-- bootstrap css 와 js를 같이 넣어야지 적용 됨 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous">
    </script>

    <!-- side menu event js defer : 지연 메뉴 걸기 -->
    <script src="side-menu.js" defer></script>

    <!-- 말풍선 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />

</head>

<body>

<style>
    * {
        box-sizing: border-box;
    }

    body {
        background-color: #f0f0f0;
        display: flex;

    }

    button {
        outline: none;
        border: none;
    }

    #wrap {
        width: 60%;
        margin: 100px auto;
    }


    /* reset */
    a {
        color: inherit;
        text-decoration: none;
    }

    /* common style */
    .hide {
        display: none !important;
    }

    /* header style */
    header {
        background: black;
        position: fixed;
        width: 100%;
        top: 0;
        z-index: 1000;
        font-size: 33px;
        font-family: Linearicons-Free;
    }

    header.on {
        background: #222;
        border-bottom: 1px solid #2c2c2c;
        transition: .4s;
    }

    header .inner-header {
        /* background: orange; */
        width: 94%;
        margin: 0 auto;
        height: 150px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        font-weight: 500;
        color: #fff;
    }

    header .inner-header .logo {
        /* background: tomato; */
        margin-right: 20px;
    }

    header .inner-header .logo a {
        display: block;
    }

    header .inner-header .logo a img {
        height: 70px;
    }

    header .inner-header .intro-text {
        /* background: greenyellow; */
        flex: 7;
        letter-spacing: 3px;
        text-transform: uppercase;
        /* margin: 20px; */
    }

    header .inner-header .menu-open {
        /* background: skyblue; */
        flex: 1.5;
        display: flex;
        justify-content: flex-end;
        align-items: center;
    }

    header .inner-header .menu-open .lnr-menu {
        font-size: 33px;
        margin-left: 15px;
    }

    /* header gnb style */
    header .gnb {
        background: #000;
        color: white;
        height: 100vh;

        padding: 70px 30px;
        box-sizing: border-box;
        /* border: red; */

        position: fixed;
        z-index: 2000;
        right: -100%;
        top: 60px;
        transition: .5s;

        display: flex;
        flex-direction: row-reverse;
    }

    header .gnb.on {
        right: 0;
    }

    header .gnb .close {
        display: block;
        color: #fff;
    }

    header .gnb ul {
        margin-right: 20px;
    }

    header .gnb ul li {
        font-size: 30px;
        font-weight: 700;
        line-height: 2;
    }

    header .gnb ul li:hover,
    header .gnb ul li.active {
        color: rgb(233, 101, 123);
    }

    /*======left side bar=========== */
    aside.sidebar {
        background-color: green;
        width: 20%;
        display: flex;
        flex-direction: column;
        flex-wrap: wrap;
        padding: 30px;
        height: 100vh;
        color: white;
        /* flex: 2 */
    }

    aside.sidebar .profile-box {
        border: 2px solid red;
        margin-top: 150px;
        padding: 30px;
        text-align: center;
    }

    aside.sidebar .profile-box .profile-img {
        border: 2px solid yellow;
        background: url('/img/dog.png') no-repeat center;
        background-size: contain;
        border-radius: 50%;
        height: 300px;
    }

    aside.sidebar .profile-box h3 {
        border: 1px solid orange;
        margin: 20px;
    }

    /* =====Begin main page body===== */

    #boxRow1 {
        display: flex;
        border: 3px solid red;
        flex-direction: row;
        justify-content: space-around;
        width: 80%;
    }

    #boxRow1>* {
        width: 100%;
    }

    * 메인 박스 */ #card-container {

                   flex-direction: row;
                   flex-wrap: wrap;
                   margin-left: 90px;
                   margin-top: 50px;
                   /* height: 500px; */
                   /* text-align: center; */
               }

    /* 메인박스 안 작은 박스 */
    #card-container #card-wrapper {
        position: relative;
        /* width: 25%; */
        margin-top: 180px;
        margin-right: 3%;
        margin-left: 10px;
        height: 450px;
        margin-bottom: 100px;
        cursor: pointer;
        transition: 0.5s;

        border: 1px solid #000;
    }

    /* 실제 내용을 담는 박스 */
    #card-container #card-wrapper #card {
        height: 450px;
        border-radius: 20px;
        box-shadow: 0 15px 0 #999;
        overflow: hidden;
        transition: 0.5s;
        border: 2px solid #000;
    }

    /*  사용자 이름 박스 */
    #card-container #card-wrapper #card .card-title {
        background: orange;
        padding: 1px;
        margin: 3px auto;
        /* position: relative; */
        display: flex;

    }

    /* 유저의 프로필 사진 */
    #card-container #card-wrapper #card .card-title .miniprofile {
        display: block;
        width: 25px;
        height: 25px;
        overflow: hidden;
        margin-left: 10px;

    }

    /* 유저 프로필 사진 이미지 */
    #card-container #card-wrapper #card .card-title .miniprofile img {
        object-fit: cover;
        border-radius: 50%;
        width: 1.5rem;
        height: 1.5rem;
        display: block;
    }

    /* 프로필 박스 (닉네임을 담고있는 ) */
    #card-container #card-wrapper #card .card-title .profile {
        /* display: flex; */
        justify-content: flex-start;
        /* width: 100%; */
    }

    /* 유저의 닉네임 */
    #card-container #card-wrapper #card .card-title .nickname {
        font-size: 14px;
        width: fit-content;
        margin-top: 5px;
        margin-left: 5px;
        /* margin-left: 10px; */

    }

    /* 사진 박스 */
    #card-container #card-wrapper #card .card-img {
        background: violet;
        width: 100%;
        height: 60%;
        position: relative;

        /* 사진 넘치는 부분 가리기 */
        overflow: hidden;
    }

    /*  사진 박스안에 실제 사진이 담기는 곳 */
    #card-container #card-wrapper #card .card-img img {
        position: absolute;

        /* 이미지 가운데 정렬 */
        /* top: 50%;
left: 50%; */
        /* transform: translate(-50%, -50%); */
        width: 25rem;
        height: 20rem;
        /* 사진 박스안에 꽉 채우기 사진 픽셀 깨짐 */
        /* width: 100%; */
        /* height: 100%; */
    }

    /* 사진 바로 밑 게시글 내용 시작 박스 */
    #card-container #card-wrapper #card .card-content {
        border: 1px solid blue;

        /* padding: 5px; */
    }

    /* 내용 박스 맨위 버튼들이 담겨 있는 박스 */
    #card-container #card-wrapper #card .card-content .eventbuttons {
        margin-top: 5px;
        margin-left: 10px;
        margin-right: 10px;
        display: flex;
        justify-content: space-between;
    }

    /* 첫번째 버튼 */
    /* #card-container #card-wrapper #card .card-content .eventbuttons:nth-child(1){
flex-grow: 1;
}
/* 두번째 버튼 */
    #card-container #card-wrapper #card .card-content .eventbuttons:nth-child(2) {
        flex-grow: 1;
    }

    /* 세번째 버튼  */
    #card-container #card-wrapper #card .card-content .eventbuttons:nth-child(3) {
        flex-grow: 1;
    }

    /* 마지막 버튼 */
    #card-container #card-wrapper #card .card-content .eventbuttons:nth-child(4) {
        flex-grow: 2;
    }


    /* 버튼들을 담고있는 박스 */
    #card-container #card-wrapper #card .card-content .eventbuttons span {
        border: 1px solid pink;
        /* margin-bottom: 3px; */
    }

    /* 담겨있는 버튼 묶음 */
    #card-container #card-wrapper #card .card-content .eventbuttons span button {
        background: #fff;
    }

    #card-container #card-wrapper #card .card-content .eventbuttons span i {
        background: #fff;
    }

    /* 내용 박스 맨 밑 텍스트 내용들 */
    #card-container #card-wrapper #card .card-content .card-text {
        margin: 5px 5px 3px 5px;
        font-size: 14px;
        height: 50px;
    }

    #card-container #card-wrapper #card .card-content .regdate {
        margin-top: 3px;
        margin-right: 4px;
        font-size: 7px;
        float: right;
    }

    /*==End main body== */
</style>



<!-- header -->
<header>
    <div class="inner-header">
        <h1 class="logo">
            <a href="main.html">
                <img src="/img/logo-instagram.png" alt="로고이미지">
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
            <li><a href="profile.html"><span class="lnr lnr-user"> 프로필</span></a></li>
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
        <div id="card-wrapper">
            <!-- 메인박스 안 작은박스-->
            <section id="card">
                <!-- 실제 내용을 담는 박스-->
                <div class="card-title">
                    <!-- 사용자 이름 박스 시작-->
                    <div class="miniprofile"><img src="" alt="#"></div>
                    <div class="profile">
                        <h1 class="nickname">작성자 : 뭉치</h1>
                    </div>

                </div> <!-- 사용자 이름 박스 끝-->
                <div class="card-img"><img src="../petstagram/불독2.png" alt="#"></div> <!-- 이미지-->

                <div class="card-content">
                    <!-- 게시글 내용 시작 -->
                    <section class="eventbuttons">
                        <!-- 버튼 담는 박스 -->
                        <div class="th">
                            <span class="aamw"><button class="abl"><i class="bi bi-heart"></i></button></span>
                            <!-- 좋아요 버튼-->
                            <span class="aamx"><button class="abl"><i class="bi bi-chat"></i></button></span>
                            <!-- 댓글 버튼-->
                            <span class="aamy"><button class="abl"><i class="bi bi-messenger"></i></button></span>
                            <!-- 메세지 버튼-->
                        </div>
                        <div class="tj">
                            <span class="aamz"><button class="abl"><i class="bi bi-lightning"></i></button></span>
                            <!-- 저장 버튼 (보류) viewcount 로 대체예정-->
                        </div>
                    </section>
                    <div class="card-text">작성자 :하하하하하하하</div> <!-- 작성내용   -->
                    <div class="regdate">작성일자시간</div>
                </div> <!-- 게시글 내용 끝-->
            </section>
        </div>
    </div>

    <div id="card-container">
        <!--메인박스-->
        <div id="card-wrapper">
            <!-- 메인박스 안 작은박스-->
            <section id="card">
                <!-- 실제 내용을 담는 박스-->
                <div class="card-title">
                    <!-- 사용자 이름 박스 시작-->
                    <div class="miniprofile"><img src="../petstagram/불독2.png" alt="#"></div>
                    <div class="profile">
                        <h1 class="nickname">작성자 : 뭉치</h1>
                    </div>

                </div> <!-- 사용자 이름 박스 끝-->
                <div class="card-img"><img src="../petstagram/불독2.png" alt="#"></div> <!-- 이미지-->

                <div class="card-content">
                    <!-- 게시글 내용 시작 -->
                    <section class="eventbuttons">
                        <!-- 버튼 담는 박스 -->
                        <div class="th">
                            <span class="aamw"><button class="abl"><i class="bi bi-heart"></i></button></span>
                            <!-- 좋아요 버튼-->
                            <span class="aamx"><button class="abl"><i class="bi bi-chat"></i></button></span>
                            <!-- 댓글 버튼-->
                            <span class="aamy"><button class="abl"><i class="bi bi-messenger"></i></button></span>
                            <!-- 메세지 버튼-->
                        </div>
                        <div class="tj">
                            <span class="aamz"><button class="abl"><i class="bi bi-lightning"></i></button></span>
                            <!-- 저장 버튼 (보류) viewcount 로 대체예정-->
                        </div>
                    </section>
                    <div class="card-text">작성자 :하하하하하하하</div> <!-- 작성내용   -->
                    <div class="regdate">작성일자시간</div>
                </div> <!-- 게시글 내용 끝-->
            </section>
        </div>
    </div>

    <div id="card-container">
        <!--메인박스-->
        <div id="card-wrapper">
            <!-- 메인박스 안 작은박스-->
            <section id="card">
                <!-- 실제 내용을 담는 박스-->
                <div class="card-title">
                    <!-- 사용자 이름 박스 시작-->
                    <div class="miniprofile"><img src="../petstagram/불독2.png" alt="#"></div>
                    <div class="profile">
                        <h1 class="nickname">작성자 : 뭉치</h1>
                    </div>

                </div> <!-- 사용자 이름 박스 끝-->
                <div class="card-img"><img src="../petstagram/불독2.png" alt="#"></div> <!-- 이미지-->

                <div class="card-content">
                    <!-- 게시글 내용 시작 -->
                    <section class="eventbuttons">
                        <!-- 버튼 담는 박스 -->
                        <div class="th">
                            <span class="aamw"><button class="abl"><i class="bi bi-heart"></i></button></span>
                            <!-- 좋아요 버튼-->
                            <span class="aamx"><button class="abl"><i class="bi bi-chat"></i></button></span>
                            <!-- 댓글 버튼-->
                            <span class="aamy"><button class="abl"><i class="bi bi-messenger"></i></button></span>
                            <!-- 메세지 버튼-->
                        </div>
                        <div class="tj">
                            <span class="aamz"><button class="abl"><i class="bi bi-lightning"></i></button></span>
                            <!-- 저장 버튼 (보류) viewcount 로 대체예정-->
                        </div>
                    </section>
                    <div class="card-text">작성자 :하하하하하하하</div> <!-- 작성내용   -->
                    <div class="regdate">작성일자시간</div>
                </div> <!-- 게시글 내용 끝-->
            </section>
        </div>
    </div>
</section>
<!--// body-->

</body>

</html>