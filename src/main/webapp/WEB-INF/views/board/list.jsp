<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>

    <%@ include file="../include/static-head.jsp" %>

    <link rel="stylesheet" href="/assets/css/list.css">

</head>

<body>

<%@ include file="../include/header.jsp" %>

<div id="wrap">


    <div class="main-title-wrapper">
        <h1 class="main-title">꾸러기 게시판</h1>

            <button class="add-btn">새 글 쓰기</button>

    </div>

    <div class="top-section">
        <!-- 검색창 영역 -->
        <div class="search">
            <form action="/board/list" method="get">

                <select class="form-select" name="type" id="search-type">
                    <option value="title">제목</option>
                    <option value="content">내용</option>
                    <option value="writer">작성자</option>
                    <option value="tc">제목+내용</option>
                </select>

                <input type="text" class="form-control" name="keyword" value="${p.keyword}">

                <button class="btn btn-primary" type="submit">
                    <i class="fas fa-search"></i>
                </button>

            </form>
        </div>
    </div>

    <div class="card-container">

        <c:forEach var="b" items="${bList}">
            <div class="card-wrapper">
                <section class="card" data-bno="${b.petNo}">
                    <div class="card-title-wrapper">
                        <h2 class="card-title">${b.likes}</h2>
                        <h2 class="card-title">${b.shortTitle}</h2>
                        <div class="time-view-wrapper">
                            <div class="time">
                                <i class="far fa-clock"></i>
                                    ${b.date}</div>
                            <div class="view">
                                <i class="fas fa-eye"></i>
                                <span class="view-count">${b.hits}</span>
                            </div>
                        </div>
                    </div>
                    <div class="card-content">

                            ${b.shortContent}

                    </div>
                </section>

                    <div class="card-btn-group">
                        <button class="del-btn" data-href="/board/delete?bno=${petNo}">
                            <i class="fas fa-times"></i>
                        </button>
                    </div>

            </div>
        </c:forEach>


    </div>
    <!-- end card container -->


</div>





</body>

</html>