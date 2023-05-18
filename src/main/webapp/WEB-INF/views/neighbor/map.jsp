<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <style>
      .map {
          width: 1800px;
          height: 1200px;
          background:
                  url("https://www.gangnam.go.kr/assets/images/contents/04/district_img02.jpg?20221223") no-repeat;
          background-size: cover;
          position: relative;
      }

      #논현동 {
          width: 100px;
          height: 50px;
          background-color: palevioletred;
          font-size: 1.7em;
          text-align: center;
          font-weight: 700;
          position: absolute;
          top: 33%;
          left: 22%;
          z-index: 9999;
      }
  </style>
</head>
<body>
<h1>지도다</h1>
<div class="map">
  <c:forEach items="${dong}" var="d">
    <div class="dong">
      <button id="${d}" onclick="location.href='neighbor?addDetail=${d}'">${d}</button>
        <%--             지금 무슨 동 넘겼는지 같이 보내줘야함--%>
    </div>
  </c:forEach>
</div>
</body>
</html>