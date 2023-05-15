<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>

    <%@ include file="../include/static-head.jsp" %>
    <link rel="stylesheet" href="/assets/css/sign-up.css">
</head>

<body>
<div class="loginWrap">
    <form action="/user/sign-up" name="signup" id="signUpForm" method="post">
    <section class="logInwithFB">
        <h1><img src="/assets/img/logo-instagram.png" alt="로고이미지" id="petstaLogo">Petstagram</h1>
        <p>Sign up to see photos and videos from your friends</p>
        <button>
            <a href="https://www.facebook.com/" class="loginFB"><span class="fab fa-facebook"></span> Log in with Facebook</a>
        </button>
        <div>
            <div class="or"> OR </div>
        </div>
    </section>
    <section class="signUpPage">
        <p id="showMessage"></p>
        <input type="text" placeholder="전화번호 또는 이메일" name="email" id="email" class="phone">
        <select type="text" placeholder="주소" name="adds" id="adds">
            <option value="">구 선택</option>
            <option value="강남구">강남구</option>
            <option value="강동구">강동구</option>
            <option value="강북구">강북구</option>
            <option value="강서구">강서구</option>
            <option value="관악구">관악구</option>
            <option value="광진구">광진구</option>
            <option value="구로구">구로구</option>
            <option value="금천구">금천구</option>
            <option value="노원구">노원구</option>
            <option value="도봉구">도봉구</option>
        </select>
        <input type="text" placeholder="동" name="dong" id="dong">
        <input type="text" placeholder="사용자 이름" name="userName" id="userName">
        <input type="text" placeholder="아이디" name="id" id="id">
        <input type="text" placeholder="비밀번호" name="pwd" id="pwd">
        <button id="signup-btn">Sign Up</button>
        <p>By signing up, you agree to our Terms, Data Policy and Cookies Policy.</p>
    </section>
    <section class="logIn">
        <button class="haveAccount" style="border-color: darkgrey;">
            <a href="/user/login" class="noneunderline">
                <p>Have an account?
                    <strong style="color:rgb(89, 166, 221)"> Log in</strong>
                </p>
            </a>
        </button>
    </section>
    </form>
</div>
</body>
<script>
    // 회원 가입 아이디 검증 : 전화번호(이메일), (주소), 사용자이름, 아이디, 비밀번호
    //phoneNum adds userName id pwd
    const checkResultList = [false, false, false, false, false];

    // 이메일 검사 정규표현식
    const emailPattern = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

    // 이메일 입력값 검증
    const $emailInput = document.getElementById('email');

    $emailInput.onkeyup = e => {

        const emailValue = $emailInput.value;
        console.log(emailValue);

        if (emailValue.trim() === '') {
            $emailInput.style.borderColor = 'red';
            document.getElementById('showMessage').innerHTML
                = '<b style="color: red;">[이메일은 필수값입니다.]</b>';
            checkResultList[0] = false;
        } else if (!emailPattern.test(emailValue)) {
            $emailInput.style.borderColor = 'red';
            document.getElementById('showMessage').innerHTML
                = '<b style="color: red;">[이메일 형식을 지켜주세요.]</b>';
            checkResultList[0] = false;
        } else {
            // 이메일 중복검사
            fetch('/user/check?type=email&keyword=' + emailValue)
                .then(res => res.json())
                .then(flag => {
                    if (flag) {
                        $emailInput.style.borderColor = 'red';
                        document.getElementById('showMessage').innerHTML
                            = '<b style="color: red;">[이메일이 중복되었습니다.]</b>';
                        checkResultList[0] = false;
                    } else {
                        $emailInput.style.borderColor = 'blue';
                        document.getElementById('showMessage').innerHTML
                            = '<b style="color: blue;">[사용가능한 이메일입니다.]</b>';
                        checkResultList[0] = true;
                    }
                });
        }
    };

    // 주소 값 동 정규 표현식
    const addressPattern = /^[^0-9]+동$/;

    const $dongInput = document.getElementById('dong');

    $dongInput.onkeyup = e => {
        const dongValue = $dongInput.value;

        if (dongValue.trim() === '') {
            $dongInput.style.borderColor = 'red';
            document.getElementById('showMessage').innerHTML = '<b style="color: red;">[동 입력은 필수값입니다!]</b>';
            checkResultList[1] = false;
        } else if (!addressPattern.test(dongValue)) {
            $dongInput.style.borderColor = 'red';
            document.getElementById('showMessage').innerHTML = '<b style="color: red;">[제대로 입력 해주세요.]</b>';
            checkResultList[1] = false;
        } else {
            $dongInput.style.borderColor = 'blue';
            document.getElementById('showMessage').innerHTML = '<b style="color: blue;">[동까지 잘 입력하셨습니다.]</b>';
            checkResultList[1] = true;
        }
    };




        // 사용자 이름 검사 정규표현식
    const namePattern = /^[가-힣]+$/;

    // 사용자 이름 입력값 검증
    const $nameInput = document.getElementById('userName');

    $nameInput.onkeyup = e => {

        const nameValue = $nameInput.value;
        console.log(nameValue);

        if (nameValue.trim() === '') {
            $nameInput.style.borderColor = 'red';
            document.getElementById('showMessage').innerHTML
                = '<b style="color: red;">[이름은 필수정보입니다.]</b>';
            checkResultList[2] = false;
        } else if (!namePattern.test(nameValue)) {
            $nameInput.style.borderColor = 'red';
            document.getElementById('showMessage').innerHTML
                = '<b style="color: red;">[이름은 한글로 기입하세요.]</b>';
            checkResultList[2] = false;
        } else {
            $nameInput.style.borderColor = 'blue';
            document.getElementById('showMessage').innerHTML
                = '<b style="color: blue;">[사용가능한 이름입니다.]</b>';
            checkResultList[2] = true;
        }
    };

    // 아이디 검사 정규표현식
    const accountPattern = /^[a-zA-Z0-9]{4,14}$/;

    // 아이디 입력값 검증
    const $idInput = document.getElementById('id');
    console.log($idInput )
    $idInput.onkeyup = e => {

        const idValue = $idInput.value; // 입력값을 idValue라고 한다.
        console.log(idValue);

    if(idValue.trim() === '') {
        $idInput.style.borderColor='red';
        document.getElementById('showMessage').innerHTML
            = '<b style="color:red;">[아이디는 필수값입니다]</b>';
        checkResultList[3] = false;
    } else if(!accountPattern.test(idValue)) { // 테스트 할때 아이디 값을 정규표현식으로 테스트 한다.
        $idInput.style.borderColor='red';
        document.getElementById('showMessage').innerHTML
            = '<b style="color:red;">[아이디는 4- 14글자의 영문, 숫자로 입력하세요.]</b>';
        checkResultList[3] = false;
    } else {
        // 아이디 중복검사
        fetch('/user/check?type=id&keyword=' + idValue)
            .then(res => res.json())
            .then(flag => {
                if(flag) { // true 이면 중복
                    $idInput.style.borderColor='red';
                    document.getElementById('showMessage').innerHTML
                        = '<b style="color:red;">[아이디가 중복되었습니다.]</b>';
                    checkResultList[3] = false;
                } else { // 중복이아님
                    $idInput.style.borderColor='green';
                    document.getElementById('showMessage').innerHTML
                        = '<b style="color:blue;">[사용가능한 아이디입니다.]</b>';
                    checkResultList[3] = true;
                }
            });

        }
    };

    // 패스워드 검사 정규표현식
    const passwordPattern =
        /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[-+_!@#$%^&*.,?]).{8,16}$/;
        // /([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/;

    // 패스워드 입력값 검증
    const $pwInput = document.getElementById('pwd');

    $pwInput.onkeyup = e => {

        const pwValue = $pwInput.value;
        // console.log(pwValue);

        if (pwValue.trim() === '') {
            $pwInput.style.borderColor = 'red';
            document.getElementById('showMessage').innerHTML
                = '<b style="color: red;">[비밀번호는 필수값입니다!]</b>';
            checkResultList[4] = false;
        } else if (!passwordPattern.test(pwValue)) {
            $pwInput.style.borderColor = 'red';
            document.getElementById('showMessage').innerHTML
                = '<b style="color: red;">[대/소문자, 특수문자, 숫자 포함 8-16자 내외]</b>';
            checkResultList[4] = false;
        } else {
            $pwInput.style.borderColor = 'blue';
            document.getElementById('showMessage').innerHTML
                = '<b style="color: blue;">[사용가능한 비밀번호입니다.]</b>';
            checkResultList[4] = true;

        }
    };

    // 회원 가입 버튼 클릭 이벤트
    document.getElementById('signup-btn').onclick = e => {

        // 5개의 입력칸이 모두 통과되었을 경우 폼을 서브밋 한다.
        const $form = document.getElementById('signUpForm');
        if(!checkResultList.includes(false)) { // 한 칸이라도 틀린게 없다면
            $form.submit();
            // $rt.value = '';
            // $rw.value = '';
        } else {
            alert('입력란을 다시 확인하세요!');
        }
    };

</script>
</html>