@<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    <div id="wrap" class="form-container">
        <h1>${b.boardNo}번 게시물 내용~ </h1>
        <h2># 작성일자: ${b.boardDateTime}</h2>
        <label for="writer">작성자</label>
        <input type="text" id="writer" name="writer" value="${b.petName}" readonly>
        <div><img src="${b.petPhoto}"> </div>
        <div><img src="${b.attachedImg}" alt=""> </div>
        <label for="content">내용</label>
        <div id="content">${b.content}</div>
        <div class="buttons">
            <button class="list-btn" type="button" onclick="window.location.href='/board/list'">목록</button>
        </div>

</body>
</html>