<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>게시판 글쓰기</title>

        <%@ include file="../include/static-head.jsp" %>

        <!-- ck editor -->
        <script src="https://cdn.ckeditor.com/4.17.2/standard/ckeditor.js"></script>
        <style>
            .form-container {
                width: 500px;
                margin: auto;
                padding: 20px;
                background-image: linear-gradient(135deg, #a1c4fd, #fbc2eb);
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                border-radius: 4px;
                font-size: 18px;
            }
            .form-container h1 {
                font-size: 40px;
                font-weight: 700;
                letter-spacing: 10px;
                text-align: center;
                margin-bottom: 20px;
                color: #ffffff;
            }
            label {
                display: block;
                margin-bottom: 5px;
                font-size: 20px;
            }
            input[type="text"],
            textarea {
                font-size: 18px;
                width: 100%;
                padding: 8px;
                box-sizing: border-box;
                border: 2px solid #ffffff;
                border-radius: 8px;
                margin-bottom: 10px;
                background-color: rgba(255, 255, 255, 0.8);
            }
            textarea {
                resize: none;
                height: 200px;
            }
            .buttons {
                display: flex;
                justify-content: flex-end;
                margin-top: 20px;
            }
            button {
                font-size: 20px;
                padding: 10px 20px;
                border: none;
                margin-right: 10px;
                background-color: #4caf50;
                color: white;
                cursor: pointer;
                border-radius: 4px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                transition: background-color 0.3s;
            }
            button.list-btn {
                background: #e61e8c;
            }
            button:hover {
                background-color: #3d8b40;
            }
            button.list-btn:hover {
                background: #e61e8c93;
            }
        </style>
    </head>
    <body>
        <%@ include file="../include/header.jsp" %>

        <div id="wrap" class="form-container">
            <h1>꾸러기 게시판 글쓰기</h1>
            <form action="/board/write" method="post">
                <label for="user_no">회원 넘버</label>
                <input type="hidden" id="user_no" required />
                <label for="pet_no">애완동물 숫자</label>
                <input type="text" id="pet_no" name="petNo" required />
                <label for="likes">좋아요 수</label>
                <input type="text" id="likes" name="likes" required />
                <label for="title">제목</label>
                <input type="text" id="title" name="title" required />
                <label for="attached_img">첨부</label>
                <input
                    type="text"
                    id="attached_img"
                    name="attachedImg"
                    required
                />
                <label for="content">첨부</label>
                <textarea
                    id="content"
                    name="content"
                    maxlength="200"
                    required
                ></textarea>
                <div class="buttons">
                    <button
                        class="list-btn"
                        type="button"
                        onclick="window.location.href='/board/list'"
                    >
                        목록
                    </button>
                    <button type="submit">글쓰기</button>
                </div>
            </form>
        </div>
    </body>
</html>
