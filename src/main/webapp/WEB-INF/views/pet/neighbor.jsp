<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
</head>
<body>

<h1>주변 친구 펫 카드 나열</h1>

<%--주변 친구 펫 카드들--%>
<div class="pet-card-list">
  <%--    펫 카드 forEach 불러오기--%>
  <c:forEach var="plist" items="${petList}">
    <div class="card-wrapper">
      <h2 class="pet-name">${plist.petName}</h2>
      <div class="pet-photo">${plist.petPhoto}</div>
    </div>
  </c:forEach>
</div>
</body>
</html>