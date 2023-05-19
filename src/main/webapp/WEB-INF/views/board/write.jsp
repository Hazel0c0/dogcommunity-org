<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>My Pet 자랑하기</title>

    <!--메인 화면 공통 부분 JSP-->
    <%@ include file="../include/static-head.jsp" %>
    <%@ include file="../include/header.jsp" %>
    <!-- css -->
    <link rel="stylesheet" href="/assets/css/main-static.css">
<%-- 추후 완성 후 분리 예정 <link rel="stylesheet" href="/assets/css/write.css">--%>

    <style>
        /* 게시물 작성 CSS */
        section {
            /*margin-top: 300px;*/
            /*margin-left: 400px;*/
            width: 60%;
            /*border: 4px solid red;*/
            padding: 20px;
        }

        section > * {
            border-radius: 6px;
        }

        h1 {
            text-align: center;
            color: darkslategray;
            margin-bottom: 5px;
        }

        #formContent {
            border: 2px double gray;
            padding: 10px;
        }

        .form-group {
            margin-bottom: 20px;
            width: 100%;
            display: flex;
            border: 1px solid black;
        }

        /* 글씨 영역 */
        label {
            display: inline-block;
            width: 200px;
            background: pink;
            font-weight: 800;
            color: darkslategray;
            padding: 20px;

        }

        textarea {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            resize: vertical;
            /*background: green;*/
        }

        input[type="text"],
        input[type="file"],
        input[type="number"] {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            text-align: center;
            /*background: yellow;*/
        }

        button {
            background-color: rgba(124, 110, 117, 0.7);
            color: white;
            letter-spacing: 5px;
            padding: 10px 15px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            width: 100%;
            font-weight: 700;

        }

        button:hover {

            background-color: #4CAF50;
            color: white;

        }

        /* 파일 사진 업로드 박스 구간 */
        .upload-box {
            width: 40%;
            margin: auto;
            margin-bottom: 20px;
            height: 400px;
            border: 3px dotted gray;
            display: flex;
            justify-content: center;
            align-content: center;
            color: black;
            font-size: 0.8em;
            text-align: center;
            align-items: center;
            cursor: pointer;
        }

        #attachedImg {
            display: none;
        }

    </style>
</head>

<body>
<section style="margin-top: 150px; margin-left: 25px;">

    <h1><i class="fas fa-paw"></i>&nbsp;<em style="font-size: 35px">My Pet 게시판</em></h1>
    <form method="post" action="/board/write" enctype="multipart/form-data" id="formContent">

        <div class="form-group">
            <label for="boardNo"><i class="fas fa-bone"></i>&nbsp;&nbsp;게시판 번호</label>
            <input type="text" id="boardNo" name="boardNo" value="12345" readonly>
        </div>

        <%--펫 번호 db 전달용--%>
        <%--        <div class="form-group">--%>
        <%--            <label for="petNo"><i class="fas fa-dog"></i>&nbsp;&nbsp;펫 번호</label>--%>
        <input type="hidden" id="petNo" name="petNo" value="56789" readonly>
        <%--        </div>--%>

        <div class="form-group">
            <label for="petName"><i class="fas fa-dog"></i>&nbsp;&nbsp;펫 이름</label>
            <input type="text" id="petName" name="petName" value="작성자 펫의 이름" readonly>
        </div>

        <div class="form-group">
            <label for="content"><i class="fas fa-bone"></i>&nbsp;&nbsp;내용</label>
            <textarea id="content" name="content" rows="8" required></textarea>
        </div>

        <div class="form-group upload-box">
            <p>이미지 파일을 첨부하시려면<br><br>이곳을 클릭하세요.</p>
        </div>
        <input type="file" id="attachedImg" name="attachedImg" accept="image">

        <button type="submit" id="submitBtn">제출</button>

    </form>
</section>

<script>
    const $uploadBox = document.querySelector('.upload-box');
    const $attachedImg = document.getElementById('attachedImg');

    $uploadBox.onclick = () => {
        $attachedImg.click();
        console.log("눌러짐");
    };

    $attachedImg .addEventListener('change', function (e) {
        // e.preventDefault();
        const fileData = $attachedImg.files[0];

        if (fileData) {
                const reader = new FileReader();
                reader.readAsDataURL(fileData);

                reader.onload = function (e) {
                    console.log(e);
                    $uploadBox.style.backgroundImage = 'url(' + e.target.result + ')';
                    $uploadBox.style.backgroundSize = 'contain';
                    $uploadBox.style.backgroundRepeat = 'no-repeat';
                    $uploadBox.style.backgroundPosition = 'center';
                };
            }
    });

</script>
</body>
</html>

