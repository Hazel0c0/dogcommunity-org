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
    <%@ include file="../include/header.jsp" %>
    <!-- css -->
    <link rel="stylesheet" href="/assets/css/main-static.css">
    <!-- js -->
    <script src="https://cdn.ckeditor.com/4.17.2/standard/ckeditor.js"></script>

    <style>
        section {
            width: 50%;
            border: 4px solid red;
            margin: 180px auto;
            padding: 20px;
            border-radius: 10px;
        }

        h1 {
            text-align: center;
            color: darkslategray;
            margin-bottom: 5px;
        }

        #formContent {
            border-radius: 10px;
            border: 2px double gray;
            padding: 10px;
            display: flex;
        }

        #formContent > * {
            border-radius: 10px;
        }

        .imgUpload {
            flex:1.5;
            /* border: 5px solid red; */
            margin-right: 20px;
        }

        .writePlace {
            flex:2;
            /* border: 5px solid blue; */
            display: flex;
            flex-direction: column;
        }

        .form-group {
            margin-bottom: 5px;
            width: 100%;
            display: flex;
            border: 1px solid black;
        }

        /* 파일 이미지 업로드 박스 구간 */
        .upload-box {
            border-radius: 10px;
            margin: auto;
            height: 400px;
            border: 3px dotted gray;
            justify-content: center;
            /* align-content: center; */
            color: black;
            font-size: 0.8em;
            text-align: center;
            align-items: center;
            cursor: pointer;

        }

        #attachedImg {
            display: none;
        }


        /* 글씨 영역 */
        label {
            display: inline-block;
            width: 130px;
            background: rgb(156, 174, 231);
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

        .write1 {
            height: 60px;
        }

        .write2 {
            flex:3;
        }

        /* 버튼 영역 */
        button {
            background-color: #4CAF50;
            color: white;
            letter-spacing: 5px;
            padding: 10px 15px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            width: 100%;
            font-weight: 700;
            /* flex:1; */

        }

        button:hover {

            background-color: #09620c;
            color: white;

        }
    </style>
</head>

<body>
<section>
    <h1><i class="fas fa-paw"></i>&nbsp;<em style="font-size: 30px">My Pet 자랑하기</em></h1>

    <form id="formContent" method="post" action="/board/write" enctype="multipart/form-data">
        <div class="imgUpload">
            <div class="form-group upload-box">
                <p>이미지 파일을 첨부하시려면<br><br>이곳을 클릭하세요.</p>
            </div>
            <input type="file" id="attachedImg" name="attachedImg" accept="image">
        </div>

        <div class="hiddenValues">
            <input type="hidden" id="boardNo" name="boardNo" value="${boardNo}" readonly>
            <input type="hidden" id="petNo" name="petNo" value="${p.petNo}" readonly>
        </div>

        <div class="writePlace">
            <div class="form-group write1">
                <label for="petName"><i class="fas fa-dog"></i>&nbsp;&nbsp;마이 펫</label>
                <input type="text" id="petName" name="petName" value="${p.petName}" readonly>
            </div>
            <div class="form-group write2">
                <label for="content"><i class="fas fa-bone"></i>&nbsp;&nbsp;글 작성</label>
                <textarea id="content" name="content" rows="8" maxlength="200" placeholder="글을 작성해주세요" required></textarea>
            </div>
            <button type="submit" id="submitBtn">제출</button>
        </div>
    </form>

</section>

<script>
    CKEDITOR.replace('content');

    const $uploadBox = document.querySelector('.upload-box');
    const $attachedImg = document.getElementById('attachedImg');

    $uploadBox.onclick = () => {
        $attachedImg.click();
        console.log("눌러짐");
    };

    $attachedImg.addEventListener('change', function (e) {
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
                $uploadBox.querySelector('p').style.display = 'none';
                $uploadBox.style.border = 'none';
            };
        }
    });
</script>
</body>
</html>

