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
  <%@ include file="../include/static-head.jsp" %>
  <%@ include file="../include/header.jsp" %>

  <!--메인 화면 CSS : main-static은 공통 + 추가 개별 CSS 넣기 -->
  <link rel="stylesheet" href="/assets/css/main-static.css">
  <link rel="stylesheet" href="/assets/css/profile.css">
  <link rel="stylesheet" href="/assets/css/neighborMap.css">

</head>
<body>
<div class="mapper">
  <section id="boxRow1">
    <c:forEach var="plist" items="${petList}">
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
                <h1 class="nickname">${plist.petName}</h1>
              </div>

            </div> <!-- 사용자 이름 박스 끝-->
            <div class="card-img"><img class="pet-img" src="${plist.petPhoto}" alt="펫프로필"></div> <!-- 이미지-->

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
              <div class="card-text">${plist.hashtag}</div> <!-- 작성내용   -->
              <div class="regdate">${plist.profileDateTime}</div>
            </div> <!-- 게시글 내용 끝-->
          </section>
        </div>
      </div>
    </c:forEach>
  </section>
</div>
</body>
</html>