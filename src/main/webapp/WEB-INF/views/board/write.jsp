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
    <link rel="stylesheet" href="/assets/css/write.css">
    <!-- js -->
    <script src="https://cdn.ckeditor.com/4.17.2/standard/ckeditor.js"></script>

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
        e.preventDefault();
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

