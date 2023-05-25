<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <%@ include file="../include/header.jsp" %>


  <!-- <script src="side-menu.js" defer></script> -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css"/>

  <!--메인 화면 공통 부분 JSP-->
  <%@ include file="../include/static-head.jsp" %>
  <%@ include file="../include/header.jsp" %>

  <!--메인 화면 CSS : main-static은 공통 + 추가 개별 CSS 넣기 -->
  <link rel="stylesheet" href="/assets/css/main-static.css">
  <link rel="stylesheet" href="/assets/css/body.css">

  <%--  <link rel="stylesheet" href="/assets/css/profile.css">--%>
  <link rel="stylesheet" href="/assets/css/petCard.css">


</head>
<body>
<div class="mapper">
  <%--주변 친구 펫 카드들--%>
  <div class="pet-card-list">
    <%--    펫 카드 forEach 불러오기--%>
    <c:forEach var="plist" items="${petList}">
      <div id="card-container">
        <!--메인박스-->
        <div id="card-wrapper">
          <!-- 메인박스 안 작은박스-->
          <section id="card">
            <!-- 실제 내용을 담는 박스-->
            <div class="card-title">
              <!-- 사용자 이름 박스 시작-->
              <div class="profile"><h1 class="nickname">${plist.petName} </h1></div>

            </div> <!-- 사용자 이름 박스 끝-->
            <div class="card-img"><img src="${plist.petPhoto}" alt="#"></div> <!-- 이미지-->
            <div class="card-text"> ${plist.hashtag} </div>
            <div class="card-text"> ${plist.profileDateTime} </div>

          </section>
        </div>
      </div>
    </c:forEach>
  </div>
  <%--  좌 --%>
  <div class="btn">
<%--    <c:if test="${maker.prev}">--%>
      <div class="pageBtn-l">
        <a class="pageBtn-img"
           href="/pet/neighbor?pageNo=${maker.begin - 1}">&lt;
        </a>
      </div>
<%--    </c:if>--%>

    <%--    우 --%>
<%--    <c:if test="${maker.next}">--%>
      <div class="pageBtn-r">
        <a class="pageBtn-img"
           href="/pet/neighbor?pageNo=${maker.end + 1}">&gt;</a>
      </div>
<%--    </c:if>--%>

    <%--    숫자 버튼 --%>
    <div class="page-btn">
      <c:forEach var="i" begin="${maker.begin}" end="${maker.end}">
        <li data-page-num="${i}" class="page-item">
          <a class="page-link"
             href="/pet/neighbor?pageNo=${i}">${i}</a>
        </li>
      </c:forEach>
    </div>

  </div>

</body>
</html>