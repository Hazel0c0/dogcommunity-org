<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="side-menu.js" defer></script>
<!-- 말풍선 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
<!-- css -->
<link rel="stylesheet" href="/assets/css/main.css">

</head>
<body>
    
    <%@ include file="../include/header.jsp" %>

    <%@ include file="../include/sidebar.jsp" %>

    <!-- body -->

<section id="boxRow1">
   
    <c:forEach var="b" items="${bList}"> 

        <div id="card-container">
            <!--메인박스-->
            <div id="card-wrapper">
                <!-- 메인박스 안 작은박스-->
            <section id="card" data-bno="${b.boardNo}">
                <!-- 실제 내용을 담는 박스-->
                <div class="card-title">
                    <!-- 사용자 이름 박스 시작-->
                    <div class="miniprofile"><img src="../img/dog.jpg" alt="#"></div>
                    <div class="profile">
                        <h1 class="nickname">${b.petName}</h1>
                    </div>
                    
                </div> <!-- 사용자 이름 박스 끝-->
                <div class="card-img"><img src="${b.attachedImg}" alt="#"></div> <!-- 이미지-->
                
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
                    <div class="card-text">${b.petName} , ${b.content}</div> <!-- 작성내용   -->
                    <div class="regdate"> ${b.boardDateTime} 작성일자시간</div>
                </div> <!-- 게시글 내용 끝-->
            </section>
        </div>
    </div>
    </c:forEach>

</section>
<!--// body-->





</body>
</html>