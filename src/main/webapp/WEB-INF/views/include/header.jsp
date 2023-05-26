<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <%-- 공통 적용 reset CSS--%>
    <%@ include file="../include/static-head.jsp" %>
    <!-- side menu event js defer : 지연 메뉴 걸기 -->
    <script src="/assets/js/side-menu.js" defer></script>
    <!-- css -->
    <link rel="stylesheet" href="/assets/css/main-static.css">

</head>

<body>

<!-- header -->
<header>
    <div class="inner-header">
        <h1 class="logo">
            <a href="/main">
                <img src="/assets/img/logo-instagram.png" alt="로고이미지">
            </a>
        </h1>
        <h2 class="intro-text"><a href="/main">Petstagram</a></h2>
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
            <li><a href="/main"><span class="lnr lnr-home"> 홈</span></a></li>
            <li><a href="#"><span class="lnr lnr-alarm"> 알림</span></a></li>
            <li><a href="/pet/neighbor"><span class="lnr lnr-map"> 내 주변 친구</span></a></li>
            <li><a href="/map/map"><span class="lnr lnr-map"> 산책가기</span></a></li>
            <li><a href="/board/mine"><span class="lnr lnr-heart"> Feed 보기</span></a></li>
            <li><a href="/board/write"><span class="lnr lnr-file-add"> 글 작성</span></a></li>
            <li><a href="/board/message"><span class="lnr lnr-bubble"> 메시지</span></a></li>
            <li><a href="/pet/profile"><span class="lnr lnr-paw"> 프로필</span></a></li>
            <li><a href="/pet/modify"><span class="lnr lnr-paw"> 프로필 수정</span></a></li>
            <li><a href="/user/logout"><span class="lnr lnr-exit"> 로그아웃</span></a></li>
        </ul>
    </nav>
</header>

<aside class="sidebar">
    <div class="profile-box">
        <a href="/pet/profile">
            <img class="profile-img" src="${loginPet.petPhoto}" alt="프사">
            <h3 id="profilePetName">${loginPet.petName}</h3>
            <p id="profileHashTag">${loginPet.hashtag}</p>
        </a>
    </div>
</aside>
