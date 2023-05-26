<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <!--메인 화면 공통 부분 JSP-->
    <%@ include file="../include/header.jsp" %>

    <!--추가 개별 CSS 넣기 -->
    <link rel="stylesheet" href="/assets/css/profile.css">

</head>

<body>

<div class="profileChange">

    <form action="/pet/profile" method="post" name="petProfile" class="profile" enctype="multipart/form-data">

        <label for="petName">반려동물 이름</label>
        <input type="text" id="petName" name="petName" required>

        <label for="petAge">나이</label>
        <input type="text" id="petAge" name="petAge" required>

        <label for="petKind">품종</label>
        <input type="text" id="petKind" name="petKind" required>

        <label for="petPhoto">프로필 사진 변경</label>
        <input type="file" id="petPhoto" name="petPhoto" accept="image/*">


        <label for="petGender">성별</label>
        <select id="petGender" name="petGender">
            <option value="">선택하세요</option>
            <option value="FEMALE">여</option>
            <option value="MALE">남</option>
            <option value="NO_GENDER">중성</option>
            <option value="SECRET">밝히고 싶지 않음</option>
        </select>

        <label for="hashTag">소개</label>
        <textarea id="hashTag" name="hashtag" rows="4" required></textarea>

        <label for="profileSuggest">프로필에 계정 추천 표시</label>
        <p id="choice">강아지의 프로필이 다른 프로필에서 추천될 수 있는지를 선택하세요.
            &nbsp;&nbsp;&nbsp;
            <input type="checkbox" id="profileSuggest" name="profileSuggest">
        </p>

        <input type="submit" value="제출" id="submitBtn">
    </form>
</div>
<script>
    <%--  좌측 프로필 영역 --%>
    const $profilePetName = document.getElementById('profilePetName');
    const $profileHashTag = document.getElementById('profileHashTag');
    <%--  우측 프로필 수정 영역 --%>
    const $petName = document.getElementById('petName');
    const $hashTag = document.getElementById('hashTag');
    const $submitBtn = document.getElementById('submitBtn');

    $submitBtn.addEventListener('click', function (e) {
        // e.preventDefault(); // 기본 제출 동작 방지 : db로 값 넘길때 주석 해지 필수~!

        $profilePetName.textContent = $petName.value;
        let hashTagValue = $hashTag.value;
        if (!hashTagValue.includes('#')) {
            hashTagValue = '#' + hashTagValue;
        }
        $profileHashTag.textContent = hashTagValue;
        // console.log($petName.value);
        // console.log($hashTag.value);

        // 파일 잡아오기
        const fileInput = document.getElementById('petPhoto');
        const fileData = fileInput.files[0];

        if (fileData) {
            const reader = new FileReader();
            reader.readAsDataURL(fileData);

            reader.onload = function (e) {
                const profileImg = document.querySelector('.profile-img');
                profileImg.style.backgroundImage = 'url(' + e.target.result + ')';
            };
        }
    });


</script>
</body>
</html>