<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!--메인 화면 공통 부분 JSP-->
  <%@ include file="../include/static-head.jsp" %>
  <%@ include file="../include/header.jsp" %>

  <!--메인 화면 CSS : main-static은 공통 + 추가 개별 CSS 넣기 -->
  <link rel="stylesheet" href="/assets/css/main-static.css">
  <link rel="stylesheet" href="/assets/css/profile.css">
  <link rel="stylesheet" href="/assets/css/neighborMap.css">

  <style>
      .pet-img {
          width: 300px;
          height: 300px;
      }

      .pet-card-list {
          display: flex;
          justify-content: space-around;
          margin: 0 100px;
      }

      #card-container #card-wrapper #card {
          height: 450px;
          width: 300px;
      }

      .nickname {
          font-size: 1.5em;
          text-align: center;
      }

      .pageBtn-l {
          position: absolute;
          top: 60%;
      }

      .pageBtn-r {
          position: absolute;
          top: 60%;
          right: 0;
      }

      .pageBtn-img {
          border: 2px solid black;
          border-radius: 50%;
          width: 80px;
          height: 80px;

          text-align: center;
          line-height: 70px;
          font-size: 3em;
          align-items: center;
      }

  </style>

  <!--메인 화면 공통 부분 JSP-->
  <%@ include file="../include/static-head.jsp" %>
  <%@ include file="../include/header.jsp" %>

  <!--메인 화면 CSS : main-static은 공통 + 추가 개별 CSS 넣기 -->
  <link rel="stylesheet" href="/assets/css/main-static.css">
  <link rel="stylesheet" href="/assets/css/profile.css">
</head>
<body>
<div class="mapper">
  <div class="pageBtn-l">
    <a class="pageBtn-img"
       href="/map/neighbor?addr=${addr.addr}pageNo=${maker.begin - 1}">&lt;</a>
  </div>
  <%--주변 친구 펫 카드들--%>
  <div class="pet-card-list">
    <%--    펫 카드 forEach 불러오기--%>
    <c:forEach var="plist" items="${petList}">
      <section id="boxRow1">
        <div id="card-container">
          <!--메인박스-->
          <div id="card-wrapper">
            <!-- 메인박스 안 작은박스-->
            <section id="card">
              <!-- 실제 내용을 담는 박스-->
              <div class="card-title">
                <!-- 사용자 이름 박스 시작-->
                <div class="profile">
                  <h1 class="nickname">${plist.petName}</h1>
                </div>

              </div> <!-- 사용자 이름 박스 끝-->
              <div class="card-img"><img class="pet-img" src="${plist.petPhoto}" alt="#"></div> <!-- 이미지-->

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
      </section>
    </c:forEach>
  </div>
  <div class="pageBtn-r">
    <a class="pageBtn-img"
       href="/map/neighbor?pageNo=${maker.finalPage}">&gt;</a>
  </div>
</div>

<c:forEach var="i" begin="${maker.begin}" end="${maker.end}">
  <li data-page-num="${i}" class="page-item">
    <a class="page-link"
       href="/map/neighbor?pageNo=${i}">${i}</a>
  </li>
</c:forEach>


</body>
</html>