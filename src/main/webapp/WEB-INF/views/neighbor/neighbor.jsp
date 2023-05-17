<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <style>
      img {
          width: 300px;
          height: 300px;
      }

      .card-wrapper {
          border: 2px solid palevioletred;
          width: fit-content;
      }

      .pet-card-list {
          display: flex;
      }
  </style>
</head>
<body>



<h1>주변 친구 찾기</h1>

<hr>
<%--주변 친구 펫 카드들--%>
<div class="pet-card-list">
  <%--    펫 카드 forEach 불러오기--%>
  <c:forEach var="plist" items="${petList}">
    <div class="card-wrapper">
      <h3 class="pet-name">${plist.petName}</h3>
      <div class="pet-photo">
        <img src="${plist.petPhoto}" alt="${plist.petName}">
      </div>
<%--      <div>♥ : ${plist.likes}      hits: ${plist.hits}</div>--%>
      <div class="hashtag">${plist.hashtag}</div>
    </div>
  </c:forEach>
</div>
</body>
</html>