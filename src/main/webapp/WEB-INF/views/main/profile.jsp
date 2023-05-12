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
    <script src="/assets/js/side-menu.js" defer></script>

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

    header .gnb ul {
        font-size: 30px;
        font-weight: 700;
        line-height: 2;
    }

    header .gnb ul :hover,
    header .gnb ul .active {
        color: rgb(233, 101, 123);
    }

    /*left side bar */
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
        background: url('/assets/img/dog.png') no-repeat center;
        background-size: contain;
        border-radius: 50%;
        height: 300px;
    }

    aside.sidebar .profile-box h3 {
        border: 1px solid orange;
        margin: 20px;
    }

    /* =====Begin Profile Change body===== */
    .profileChange {
        width: 60%;

    }
    form {
        width: 500px;
        margin: 160px auto;
        /* border: 1px solid #000; */
    }

    label {
        display: block;
        margin-top: 10px;
    }

    input[type="text"],
    textarea {
        width: 100%;
        padding: 5px;
        border-radius: 4px;
        border: 1px solid #ccc;
        box-sizing: border-box;
        resize: vertical;
    }

    input[type="submit"] {
        background-color: #4CAF50;
        color: white;
        padding: 10px 15px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        margin-left: 85%;
    }

    input[type="submit"]:hover {
        background-color: #45a049;
    }

    #suggestProfile {
        font-size: 0.8em;
    }

    /* End Profile Page body */
</style>



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
            <a href="#"><span class="lnr lnr-home"> 홈</span></a>
            <a href="#"><span class="lnr lnr-magnifier"> 검색</span></a>
            <a href="#"><span class="lnr lnr-map"> 내 주변 친구</span></a>
            <a href="#"><span class="lnr lnr-heart"> 자랑하기</span></a>
            <a href="#"><span class="lnr lnr-bubble"> 메시지</span></a>
            <a href="#"><span class="lnr lnr-alarm"> 알림</span></a>
            <a href="#"><span class="lnr lnr-user"> 프로필</span></a>
        </ul>
    </nav>
</header>

<!--main left sidebar-->
<aside class="sidebar">
    <div class="profile-box">
        <div class="profile-img"><a href=""></a></div>
        <h3 id="petNickname">멍멍이</h3>
        <p id="profileIntro">#안뇽</p>
    </div>
</aside>

<!--//Profile Change Body label이랑 id 맞추고 dto랑 name 맞춘다-->
<div class="profileChange">
    <form class="profile">
        <label for="petName">반려동물 이름</label>
        <input type="text" id="petName" name="petName" required>

        <label for="petAge">나이</label>
        <input type="text" id="petAge" name="petAge" required>

        <label for="petKind">품종</label>
        <input type="text" id="petKind" name="petKind" required>

        <label for="area">거주 지역</label>
        <input type="text" id="area" name="area" required>

        <label for="petGender">성별</label>
        <select id="petGender" name="petGender">
            <option value="">선택하세요</option>
            <option value="female">여</option>
            <option value="male">남</option>
            <option value="noGender">중성</option>
            <option value="secret">밝히고 싶지 않음</option>
        </select>

        <label for="hashTag">소개</label>
        <textarea id="hashTag" name="hashTag" rows="4" required></textarea>

        <label for="profileSuggest">프로필에 계정 추천 표시</label>
        <p id="suggestProfile">강아지의 프로필이 다른 프로필에서 추천될 수 있는지를 선택하세요.&nbsp;&nbsp;&nbsp;<input type="checkbox"></p>

        <input type="submit" value="제출">
    </form>
</div>
<script>

    const $hashTag = document.getElementById('hashTag');
    const $profileIntro= document.getElementById('profileIntro');
    const $petName= document.getElementById('petName');
    const $petNickname= document.getElementById('petNickname');

    $hashTag.onkeyup = e => {
        // console.log(e);

        if (e.key === 'Enter') {
            $profileIntro.textContent = $hashTag.value;
            $petNickname.textContent = $petName.value;
        }

    };

</script>
</body>

</html>