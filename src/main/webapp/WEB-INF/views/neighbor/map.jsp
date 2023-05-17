<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
<h1>지도다</h1>
<div class="map">
    <c:forEach items="${dong}" var="d">
        <div class="dong">
            <button onclick="location.href='neighbor?addDetail=${d}'">${d}</button>
<%--             지금 무슨 동 넘겼는지 같이 보내줘야함--%>
        </div>
    </c:forEach>
</div>
</body>
</html>